class ChangeDurationColumnToIntegerInActivityApplication < ActiveRecord::Migration[5.1]
  def change

    reversible do | dir |
      dir.up do
        change_table :activity_applications do |t|
          t.remove :duration
          t.column :duration, :integer
        end
      end
      dir.down do
        change_table :activity_applications do |t|
          t.remove :duration
          t.column :duration, :int4range
        end
      end


    end
  end
end
