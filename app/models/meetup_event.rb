class MeetupEvent < ApplicationRecord
  DEFAULT_DESCRIPTION = 'Академическая встреча'.freeze
  DEFAULT_PLACE = 'Антикафе "Кочерга" (Москва, Б. Дорогомиловская, 5)'.freeze
  after_initialize :ensure_default_values

  has_many :activity_applications

  def ensure_default_values
    self.description ||= DEFAULT_DESCRIPTION if self.has_attribute? :description
    self.place ||= DEFAULT_PLACE if self.has_attribute? :place
  end

end
