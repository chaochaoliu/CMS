class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable 

  has_one :profile, dependent: :destroy
  has_many :registrations
  has_many :events, through: :registrations
  has_many :reflections
  has_many :comments
  has_many :sermon_reflections
  belongs_to :role
  before_save :set_default_role
  has_paper_trail

  def set_default_role
    self.role_id ||= 1
  end

  def admin?
    self.role.name == 3 || self.role.name == 4
  end

  def superadmin?
    self.role.name == 4
  end

  def staff?
    self.role.name == 3
  end

  def approved?
    self.role.name == 2
  end

  def un_approved?
    self.role.name == 1
  end

end
