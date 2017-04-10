class Team < ActiveRecord::Base
  belongs_to :game_instance

  has_many :team_memberships
  has_many :players, through: :team_memberships

  def names
    players.map(&:name)
  end

  def first_names
    players.map(&:first_name)
  end

  def number_of_players
    players.size
  end

  def next_activity_instance
    game_instance.activity_instances.select do |a|
      s = a.last_submission_for(self)
      (!s.nil? and s.rejected) or s.nil?
    end.first
  end

end
