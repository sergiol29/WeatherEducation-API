class Variable < ApplicationRecord
  has_many :ValueMax
  has_many :ValueMin
  has_many :LastFrame
  has_many :Datum
  belongs_to :User, optional: true

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  # Include file app/admin/variable_admin.rb, this file configure model Variable in RailsAdmin
  include VariableAdmin
end
