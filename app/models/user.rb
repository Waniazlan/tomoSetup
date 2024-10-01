class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :account

         before_validation :set_account
       
         def set_account
           self.build_account
         end
  # validates_uniqueness_of :username
  # scope :all_except, ->(user) { where.not(id: user) }
  # after_create_commit { broadcast_append_to "users" }
  # has_many :messages

end
