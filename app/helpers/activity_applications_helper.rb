module ActivityApplicationsHelper
  PREDEFINED_TAGS =
      ["GTD", "ГрупповаяКультура", "ИИ", "КогнитивнаяНаука", "КогнитивныеИскажения",
       "КритическоеМышление", "Лайфхаки", "Логика", "Математика", "Нейробиология",
       "НенасильственноеОбщение",
       "ПрактическаяРациональность", "Псевдоаргументы", "СоциальнаяПсихология",
       "ТеоремаБайеса", "ТеорияВероятностей", "ТеорияИгр", "ТеорияПринятияРешений",
       "Трансгуманизм", "УправлениеПроектами", "Философия", "ЦепочкиLessWrong",
       "Эволюция", "Эпистемология", "ЭффективныйАльтруизм",
       "ПОЧВОВЕДЕНИЕ"]

  def hashtag_checkbox(activity_application, checkbox)
    checked = activity_application.tags.include? checkbox.text
    checkbox.label do
      concat checkbox.check_box(checked: checked)
      concat checkbox.text
    end
  end

  def hashtag_textfield(activity_application, form)
    custom_tags = activity_application.tags - PREDEFINED_TAGS
    value = custom_tags.join(' ')
    text_field_tag "activity_application[tags][]", value
  end
end
