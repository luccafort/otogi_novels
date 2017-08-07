class NovelsController < ApplicationController
  def index
    # Novelsの一覧表示
    @novels = Novel.all
  end

  def show
    # 選択されたNovels詳細表示
    @novel = Novel.find(params[:id])
  end

  def new
    # Novels新規作成
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(post_params)
    if @novel.save
      redirect_to @novel
    else
      # newメソッドをHTTP Code422で表示
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Novels更新
    @novel = Novel.find(params[:id])
  end

  def update
    # Novels更新
  end

  def destroy
    # Novels削除(論理削除)
  end

  # 必要な値のみを取得
  private
    def post_params
      params.require(:novels).permit(:title)
    end
end
