class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :team
end


# CHAT TEM TIME (belongs to) references:team
