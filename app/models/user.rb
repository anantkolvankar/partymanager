class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :invite_members, -> (user_id) { where('id !=?',user_id) }
  scope :has_birthday, -> (date) { where('dob =?',date) }
end
