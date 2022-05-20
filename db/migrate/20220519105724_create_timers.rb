class CreateTimers < ActiveRecord::Migration[6.1]
  def change
    create_table :timers do |t|
      t.string :name, null: false
      t.datetime :work_time, null: false
      t.datetime :rest_time, null: false
      t.datetime :implementation_time
      t.integer :switch, default: 0, null: false
      t.boolean :repetition
      t.integer :character, default: 0, null: false
      t.integer :sound
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
