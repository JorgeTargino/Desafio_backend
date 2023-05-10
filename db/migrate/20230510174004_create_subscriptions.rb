class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.user :references
      t.status :references

      t.timestamps
    end
  end
end
