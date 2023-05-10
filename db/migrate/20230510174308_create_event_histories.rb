class CreateEventHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :event_histories do |t|
      t.references :subscription, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
