class User < ActiveRecord::Base
  #extend Enumerize
  has_many :user_clubs
  has_many :clubs, through: :user_clubs
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #enumerize :role, in: [:athlete, :manager, :admin], default: :athlete]

  def admin?
    role == 'admin'
  end

  def manager?
    role == 'manager'
  end

  def is_athlete?
    role == 'athlete'
  end

  def home_path
    role + "_home_path"
  end

  def full_name
    first_name + ' ' + last_name + '::' + role.titleize
  end
end
