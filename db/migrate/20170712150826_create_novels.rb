class CreateNovels < ActiveRecord::Migration[5.1]
  def change
    create_table :novels do |t|

      t.timestamps
    end
  end
end
