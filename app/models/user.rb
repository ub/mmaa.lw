class User < ApplicationRecord
  has_many :activity_applications
  # May omit contact on User creation, but contact should be filled on entering application
  # for a meetup presentation (or general activity)
  validates_presence_of :contact, if: -> {activity_applications.present?}

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

  def admin?
    self.admin_flag == true
  end

end
