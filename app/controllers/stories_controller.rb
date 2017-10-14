class StoriesController < ApplicationController
  def index
    # タイトル表示にnovel_seriesのIDが必須
    @novel_series = NovelSeries.find(params[:novel_series_id])
  end

  # POST /novels/:novel_id/stories
  def create
    @novel_series = NovelSeries.find(params[:novel_id])
    @story = @novel_series.story.create(get_story_params)

    redirect_to novel_series_path($novel)
  end

  private
    def get_story_params
      params.require(:story).permit(:title, :content, :prolugue, :epilogue)
    end
end
