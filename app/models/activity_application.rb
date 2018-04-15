class ActivityApplication < ApplicationRecord
  belongs_to :user
  belongs_to :meetup_event
  accepts_nested_attributes_for :user, update_only: true
  validates_associated :user
  validates_presence_of :duration

end
