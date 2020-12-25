class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, {presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }}
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
has_many :estimates
has_many :reasons
has_many :customers
end

# :registerable,
