class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, uniqueness: true

  validate :maximum_categories_count

  validate :maximum_open_consultations_count

  has_and_belongs_to_many :categories

  has_many :consultations

  ROLES = %i[admin doctor patient]

  def maximum_categories_count
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
end
