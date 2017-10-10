class RenameNovelIdColumnToNovelSeriesId < ActiveRecord::Migration[5.1]
  def change
    rename_column :stories, :novel_id, :novel_series_id
  end
end
