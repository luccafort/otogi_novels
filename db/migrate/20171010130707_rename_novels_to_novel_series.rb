class RenameNovelsToNovelSeries < ActiveRecord::Migration[5.1]
  def change
    rename_table :novels, :novel_series
  end
end
