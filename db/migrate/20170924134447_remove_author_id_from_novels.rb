class RemoveAuthorIdFromNovels < ActiveRecord::Migration[5.1]
  def change
    remove_reference :novels, :author, foreign_key: true
  end
end
