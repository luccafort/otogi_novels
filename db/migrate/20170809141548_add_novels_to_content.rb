class AddNovelsToContent < ActiveRecord::Migration[5.1]
  def change
    add_reference :contents, :novel, foreign_key: true
  end
end
