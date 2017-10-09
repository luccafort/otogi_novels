class AddStoriesIdToNovels < ActiveRecord::Migration[5.1]
  def change
    add_reference :novels, :stories, foreign_key: true
  end
end
