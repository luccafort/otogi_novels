class AddSummaryToNovelSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :novel_series, :summary, :text, null:true, :after => :title
  end
end
