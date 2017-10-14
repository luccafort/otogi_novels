class AddTitleToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :title, :string, limit: 255, null:false, default:'', :after => :id
  end
end
