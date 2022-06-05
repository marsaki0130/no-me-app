class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def show
    @board = Board.find(params[:id])
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, notice: '保存できました'
    else
      flash.now[:eroor] = '保存に失敗しました'
      render :new
    end
  end


  def likes
    @board = Board.find(params[:board_id])
    @like = @board.likes + 100
    @board.update(likes: @like)
  end

  private

    def board_params
      params.require(:board).permit(:title, :content)
    end
end