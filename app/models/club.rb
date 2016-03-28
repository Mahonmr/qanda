class Club < ActiveRecord::Base
  has_many :user_clubs
  has_many :users, through: :user_clubs
  has_many :events
  before_destroy :check_for_managers
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  private

  def check_for_managers
    if self.users.any?
      errors[:base] << "Managers need to be unassigned from #{self.name} before deleting."
      return false
    end
  end
end
