class Event < ActiveRecord::Base
  validates :name, :presence => true, :if => :active_or_name?
  validate :validate_date, :if => :active_or_name?

  def validate_date
    return errors.add(:event_date, "must be Entered") if self.event_date.nil?
    unless self.event_date >= Date.today
      errors.add(:event_date, "Event date must be greater or equel to today's date")
    end
  end

  def active?
    status == "active"
  end

  def active_or_name?
    status.include?('event_name') || active?
  end
end
