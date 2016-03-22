class Worker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :labs
  has_many :results_for_users
  validates :sex, format: { with: /\A[FM]\z/}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :pesel, presence: true, format: { with: /\A\d{11}\z/i, on: :create}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :lab_id, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
