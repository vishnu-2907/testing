class Chat < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: :User
  belongs_to :receiver, foreign_key: :receiver_id, class_name: :User

  validates :title,presence:true
  validates :message,presence:true

  scope :user_chats, ->(user_id = nil) { where('sender_id=? or receiver_id=?', user_id, user_id) }

  before_update do
  	if self.receiver_id_changed?
  		errors.add(:receiver, 'receiver should not be updated')
  	end
  end

end
