class Video < ActiveRecord::Base
  has_many :ratings, :dependent => :destroy

end

class Rating < ActiveRecord::Base
  belongs_to :video
  validates_presence_of :video
  validates_inclusion_of :value, :in => 1..10
end
# this is the one i tried to write myself kinda but couldnt get to work so maybe use letsrate ?
