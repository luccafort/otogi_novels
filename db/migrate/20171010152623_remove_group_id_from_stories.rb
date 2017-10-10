class RemoveGroupIdFromStories < ActiveRecord::Migration[5.1]
  def change
    remove_column :stories, :group_id, :integer
    remove_column :stories, :group_position, :integer
  end
end
