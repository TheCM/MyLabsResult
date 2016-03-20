class Lab < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :workers
  validates :description, presence: true
  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
