class NovelSeriesController < ApplicationController
  def index
    # Novelsの一覧表示
    @novels = NovelSeries.all
  end

  def show
    # 選択されたNovels詳細表示
    @novel = NovelSeries.find(params[:id])
  end

  def new
    # Novels新規作成
    @novel = NovelSeries.new
  end

  def create
    @novel = NovelSeries.new(post_params)
    if @novel.save
      redirect_to @novel
    else
      # newメソッドをHTTP Code422で表示
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Novels更新
    @novel = NovelSeries.find(params[:id])
  end

  def update
    # Novels更新
    @novel = NovelSeries.find(params[:id])
    if @novel.update(post_params)
      redirect_to @novel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # TODO: Novels削除(論理削除)
    @novel = NovelSeries.find(params[:id])
    @novel.destroy

    # 削除後リダイレクト
    redirect_to novels_path
  end

  # 必要な値のみを取得
  private
    def post_params
      params.require(:novel).permit(:title)
    end
end
