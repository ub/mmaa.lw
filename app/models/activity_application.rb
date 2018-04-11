class ActivityApplication < ApplicationRecord
  belongs_to :user
  belongs_to :meetup_event
end
