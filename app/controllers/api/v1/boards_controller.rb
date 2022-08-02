class Api::V1::BoardsController < Api::ApiController
  before_action :authenticate_user_from_token!
  before_action :find_board, only: [:update, :destroy]

  def index
    render json: current_user.boards, status: :ok
  end

  def create
    board = current_user.boards.create(board_params)

    return render json: board, status: :ok if board.persisted?

    render json: board.errors.full_messages, status: :unprocessable_entity
  end

  def update
    return render json: @board, status: :ok if @board.update(board_params)

    render json: @board.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    return render json: @board, status: :ok if @board.destroy

    render json: @board.errors.full_messages, status: :unprocessable_entity
  end

  private

  def board_params
    params.permit(:name, :background_color, :background_photo)
  end

  def find_board
    @board = current_user.boards.find_by(id: params[:id])

    render json: {}, status: :not_found unless @board.present?
  end
end
