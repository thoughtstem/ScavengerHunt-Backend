class AddPaperclipToSubmission < ActiveRecord::Migration
  def change
    add_attachment :submissions, :image
  end
end
