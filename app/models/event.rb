class Event < ActiveRecord::Base
  belongs_to :club
  validates :name, :presence => true, :if => :active_or_name?
  validates :address, :presence => true, :if => :active_or_address?
  validate :validate_date, :if => :active_or_name?
  # geocoded_by :location
  # reverse_geocoded_by :latitude, :longitude, :address => :address
  #after_validation :geocode, :if => :active_or_address?
  #after_validation :verify_presence_of_address, :if => :active_or_address?

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

  def active_or_address?
    status.include?('event_address') || active?
  end

  # def verify_presence_of_address
  #   reverse_geocode
  # end

  def location
    self.address + self.city + self.state + self.zip
  end
end
