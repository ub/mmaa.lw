class CreateActivityApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_applications do |t|
      t.references :user, foreign_key: true
      t.references :meetup_event, foreign_key: true
      t.string :name
      t.text :description
      t.int4range :duration
      t.string :tags, array: true, default:"{}", length:32

      t.timestamps
    end
  end
end
