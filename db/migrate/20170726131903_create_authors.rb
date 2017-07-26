class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :email
      t.string :first_name
      t.string :family_name
      t.string :pen_name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
