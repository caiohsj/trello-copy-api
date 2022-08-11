class Api::V1::CardsController < Api::ApiController
  before_action :authenticate_user_from_token!
  before_action :find_column, only: [:create]
  before_action :find_card, only: [:update, :destroy, :show]

  def create
    card = @column.cards.create(card_params)

    return render json: card, status: :ok if card.persisted?

    render json: card.errors.full_messages, status: :unprocessable_entity
  end

  def update
    return render json: @card, status: :ok if @card.update(card_params)

    render json: @card.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    return render json: @card, status: :ok if @card.destroy

    render json: @card.errors.full_messages, status: :unprocessable_entity
  end

  def show
    render json: @card, status: :ok
  end

  private

  def card_params
    params.permit(:title, :description)
  end

  def find_card
    @card = current_user.cards.find_by(id: params[:id])

    render json: {}, status: :not_found unless @card.present?
  end

  def find_column
    @column = current_user.columns.find_by(id: params[:column_id])

    render json: {}, status: :not_found unless @column.present?
  end
end
