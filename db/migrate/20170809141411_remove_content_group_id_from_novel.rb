class RemoveContentGroupIdFromNovel < ActiveRecord::Migration[5.1]
  def change
    remove_column :novels, :content_group_id, :integer
  end
end
