class ChangeEventHistoryColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :event_histories, :type, :status_type
  end
end
