class ActivityInstance < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  belongs_to :activity_instance #The next activity in the game...
  belongs_to :game_instance

  has_many :submissions

  def next_activity
    activity_instance 
  end

  def last_submission_for(team)
    return submissions.where({team_id: team.id}).order("created_at").first
  end

end
