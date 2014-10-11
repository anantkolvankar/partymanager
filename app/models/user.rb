class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :parties
  has_many :users_parties, through: :parties

  scope :invite_members, -> (user_id) { where('id !=?', user_id) }
  scope :has_birthday, -> (date,user_id) { where('dob =? and id=?', date, user_id) }

  def birthday?
    dob == Date.today
  end
end
