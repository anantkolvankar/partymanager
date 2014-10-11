class Menu < ActiveRecord::Base
  belongs_to :party
  has_many :users_parties
end
