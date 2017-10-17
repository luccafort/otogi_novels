class StoriesController < ApplicationController
  def index
    # タイトル表示にnovel_seriesのIDが必須
    @novel_series = NovelSeries.find(params[:novel_series_id])
  end

  def show
    # TODO:親であるところのnovel_seriesも取得する必要あり
    # TODO:novel_seriesから著者名を取得する必要あり
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  # POST /novels/:novel_id/stories
  def create
    @story = Story.create(get_story_params)
    if @story.save
      redirect_to story_path @story
    else
      # newメソッドをHTTP Code 422で表示
      render :new, status: :unprocessable_entity
    end


  end

  def edit
    # 更新対象取得
    @story = Story.find(parans[:id])
  end

  def update
    # 更新
    @story = Story.find(params[:id])
    if @story.update(get_story_params)
      redirect_to @story
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to :controller => 'novel_series', :action => 'index'
  end

  private
    def get_story_params
      params.require(:story).permit(:title, :content, :prolugue, :epilogue, novel_series_attributes: [:novel_series_id])
    end
end
