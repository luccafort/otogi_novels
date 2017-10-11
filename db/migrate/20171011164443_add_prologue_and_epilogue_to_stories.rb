class AddPrologueAndEpilogueToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :prologue, :text, null:true, :after => :content
    add_column :stories, :epilogue, :text, null:true, :after => :prologue
  end
end
