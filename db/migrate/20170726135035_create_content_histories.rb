class CreateContentHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :content_histories, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :content_id
      t.text :content_diff

      t.timestamps
    end
  end
end
