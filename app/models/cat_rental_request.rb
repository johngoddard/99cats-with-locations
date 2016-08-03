class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w(PENDING DENIED APPROVED)

  validates :cat_id, :start_date, :end_date, :lat, :long, presence: true
  validates :status, inclusion: STATUSES
  validate :overlapping_approved_requests, :valid_date_range

  belongs_to :cat

  def pending?
    self.status == "PENDING"
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def approve!
    CatRentalRequest.transaction do
      overlapping_pending_requests.each do |request|
        request.deny!
      end
      self.status = "APPROVED"
      self.save!
    end
  end

  def valid_date_range

    if self.start_date.nil? || self.end_date.nil? || self.start_date > self.end_date
      errors[:rental_dates] << "Start date can't be after end date"
    end
  end

  def overlapping_approved_requests
    return unless self.status == "APPROVED"

    approved_rentals = CatRentalRequest.where(cat_id: self.cat_id, status: "APPROVED")
                        .where(dates_where_string, start_date: self.start_date, end_date: self.end_date)
    if approved_rentals.length > 0
      errors[:rental_dates] << "conflict with approved rentals"
    end
  end

  def overlapping_pending_requests
    CatRentalRequest.where(cat_id: self.cat_id, status: "PENDING")
    .where(dates_where_string, start_date: self.start_date, end_date: self.end_date)
  end

  def dates_where_string
    <<-SQL
     (start_date BETWEEN :start_date AND :end_date
       OR end_date BETWEEN :start_date AND :end_date
       OR (
         start_date <= :start_date AND end_date >= :start_date
       )
       OR (
        start_date <= :end_date AND end_date >= :end_date
       )
     )
    SQL
  end

end
