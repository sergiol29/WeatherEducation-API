#require 'bcrypt'

class User < ApplicationRecord
  # Authenticate with devise in rails admin
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :Station

  # users.password_hash in the database is a :string
  #include BCrypt

  #def password
  #  @password ||= Password.new(password_hash)
  #end

  #def password=(new_password)
  #  @password = Password.create(new_password)
  #  self.password_hash = @password
  #end

  enum role: [:client, :admin]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,
            length: {minimum: 6},
            on: :create
  validates :password, presence: true,
            length: {minimum: 6},
            allow_blank: true,
            on: :update

  # Include file app/admin/user_admin.rb, this file configure model User in RailsAdmin
  include UserAdmin
end
