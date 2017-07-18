class CreateNovels < ActiveRecord::Migration[5.1]
  def change
    create_table :novels, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :title
      t.string :author
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
