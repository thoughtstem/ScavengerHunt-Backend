class GameInstance < ActiveRecord::Base
  has_many :teams
  has_many :activity_instances
end
