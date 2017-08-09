class AddAuthorToNovels < ActiveRecord::Migration[5.1]
  def change
    add_reference :novels, :author, foreign_key: true
  end
end
