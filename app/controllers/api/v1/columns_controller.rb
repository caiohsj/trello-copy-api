class Api::V1::ColumnsController < Api::ApiController
  before_action :authenticate_user_from_token!
  before_action :find_board, only: [:create]
  before_action :find_column, only: [:update, :destroy]

  def create
    column = @board.columns.create(title: params[:title])

    return render json: column, status: :ok if column.persisted?

    render json: column.errors.full_messages, status: :unprocessable_entity
  end

  def update
    return render json: @column, status: :ok if @column.update(title: params[:title])

    render json: @column.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    return render json: @column, status: :ok if @column.destroy

    render json: @column.errors.full_messages, status: :unprocessable_entity
  end

  private

  def find_board
    @board = current_user.boards.find_by(id: params[:board_id])

    render json: {}, status: :not_found unless @board.present?
  end

  def find_column
    @column = current_user.columns.find_by(id: params[:id])

    render json: {}, status: :not_found unless @column.present?
  end
end
