class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :group_id
      t.text :content
      t.integer :group_position
      t.integer :status

      t.timestamps
    end
  end
end
