class RenameContentsToStories < ActiveRecord::Migration[5.1]
  def change
    rename_table :contents, :stories
    rename_table :content_histories, :story_histories
  end
end
