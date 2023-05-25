class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, uniqueness: true

  validate :maximum_categories_count

  validate :maximum_consultations_count

  has_and_belongs_to_many :categories

  has_many :consultations

  has_one_attached :avatar

  validates_format_of :phone, with: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/, :multiline => true, :allow_blank => true

  attr_writer :login

  ROLES = %i[admin doctor patient]

  def maximum_consultations_count
    if self.consultations.where(open: true).count > 10
      self.errors.add(:groups, "cannot have more than 10 open")
    end
  end

  def maximum_categories_count
    if self.categories.count > 1
      self.errors.add(:groups, "cannot have more than 1 category")
    end
  end

  def is?(requested_role)
    self.role == requested_role.to_s
  end

  attr_writer :login

  def login
    @login || self.phone || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where(["lower(phone) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
