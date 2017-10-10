class StoriesController < ApplicationController
  # POST /novels/:novel_id/stories
  def create
    @novelSeries = NovelSeries.find(params[:novel_id])
    @story = @novel.stories.create(get_story_params)

    redirect_to novel_path($novel)
  end

  private
    def get_story_params
      params.require(:story).permit(:author, :body)
    end
end
