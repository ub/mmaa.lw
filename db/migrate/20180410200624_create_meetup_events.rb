class CreateMeetupEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :meetup_events do |t|
      t.text :description
      t.datetime :start_time
      t.string :place
    end
  end
end
