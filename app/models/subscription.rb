class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :status

    before_save :create_event_history

    def create_event_history
      EventHistory.create(subscription_id: self.id, status_type: self.status.status_name) if self.status_id_changed?
    end
end
