class Party < ActiveRecord::Base
  belongs_to :product
  belongs_to :birthday,:foreign_key => "bid", :class_name => "User"
  belongs_to :invitee,:foreign_key => "invitee_id", :class_name => "User"

  scope :has_invited,-> (user_id) { where('invitee_id=?',user_id) }

  def is_contributed?
    is_contributed == true
  end
end
