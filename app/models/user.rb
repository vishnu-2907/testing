class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chats,foreign_key: :sender_id

  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
                                                   message: 'only allows letters and space character' }
  

end
