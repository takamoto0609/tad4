class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :wash_power
  belongs_to :dry_power
  belongs_to :start_time
  belongs_to :end_time
  belongs_to :status

  validates :comment, :address, :point, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
