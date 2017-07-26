class ChangeAuthorToNovels < ActiveRecord::Migration[5.1]
  def up
    rename_column :novels, :author, :author_id
    change_column :novels, :author_id, :integer, null: false, default: 0
  end

  def down
    rename_column :novels, :author_id, :author
    change_column :novels, :author, :string
  end
end
