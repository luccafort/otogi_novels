class StoriesController < ApplicationController
  # POST /novels/:novel_id/stories
  def create
    @novel_series = NovelSeries.find(params[:novel_id])
    @story = @novel_series.story.create(get_story_params)

    # TODO:パスの指定がおかしい正しくはnovel_series_path
    redirect_to novel_path($novel)
  end

  private
    def get_story_params
      params.require(:story).permit(:author, :body)
    end
end
