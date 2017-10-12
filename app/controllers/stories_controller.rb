class StoriesController < ApplicationController
  def index
    # タイトル表示にnovel_seriesのIDが必須
    @novel_series = NovelSeries.find(get_novel_stories_params)
    @stories = Stories.where(novel_series_id: get_novel_stories_params).order(:id)
  end

  # POST /novels/:novel_id/stories
  def create
    @novel_series = NovelSeries.find(params[:novel_id])
    @story = @novel_series.story.create(get_story_params)

    redirect_to novel_series_path($novel)
  end

  private
    def get_story_params
      params.require(:story).permit(:author, :body)
    end

  private
    def get_novel_stories_params
      params.require(:novel_series).permit(:id)
    end
end
