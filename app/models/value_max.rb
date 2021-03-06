class ValueMax < ApplicationRecord
  belongs_to :Variable, optional: true, dependent: :destroy
  belongs_to :Station, optional: true, dependent: :destroy

  validates :station_id, presence: true
  validates :variable_id, presence: true

  # Include file app/admin/value_max_admin.rb, this file configure model ValueMax in RailsAdmin
  include ValueMaxAdmin
end
