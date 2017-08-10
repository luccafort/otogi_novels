class ContentsController < ApplicationController
  # POST /novels/:novel_id/contents
  def create
    @novel = Novel.find(params[:novel_id])
    @content = @novel.contents.create(content_params)

    redirect_to novel_path($novel)
  end

  private
    def content_params
      params.require(:content).permit(:author, :body)
    end
end
