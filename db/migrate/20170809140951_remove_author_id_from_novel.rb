class RemoveAuthorIdFromNovel < ActiveRecord::Migration[5.1]
  def change
    remove_column :novels, :author_id, :integer
  end
end
