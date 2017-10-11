class NovelSeriesController < ApplicationController
  def index
    # Novelsの一覧表示
    @novel_series = NovelSeries.all
  end

  def show
    # 選択されたNovels詳細表示
    @novel_series = NovelSeries.find(params[:id])
  end

  def new
    # Novels新規作成
    @novel_series = NovelSeries.new
  end

  def create
    @novel_series = NovelSeries.new(novel_series_params)
    if @novel_series.save
      redirect_to @novel_series
    else
      # newメソッドをHTTP Code422で表示
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Novels更新
    @novel_series = NovelSeries.find(params[:id])
  end

  def update
    # Novels更新
    @novel_series = NovelSeries.find(params[:id])
    if @novel_series.update(novel_series_params)
      redirect_to @novel_series
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # TODO: Novels削除(論理削除)
    @novel_series = NovelSeries.find(params[:id])
    @novel_series.destroy

    # 削除後リダイレクト
    redirect_to :action => 'index'
  end

  # 必要な値のみを取得
  private
    def novel_series_params
      params.require(:novel_series).permit(:title, :summary)
    end
end
