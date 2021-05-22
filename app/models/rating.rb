class Rating < ActiveRecord::Base
  belongs_to :video
  validates_presence_of :video
  validates_inclusion_of :value, :in => 1..10
end
