class AddContentGroupIdToNovels < ActiveRecord::Migration[5.1]
  def up
    add_column :novels, :content_group_id, :integer, null:false, default: 0, :after => :author
  end

  def down
    remove_column :novels, :content_group_id
  end
end
