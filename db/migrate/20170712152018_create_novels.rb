class CreateNovels < ActiveRecord::Migration[5.1]
  def change
    create_table :novels do |t|
      t.string :title
      t.string :author
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
