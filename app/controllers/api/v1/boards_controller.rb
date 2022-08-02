class Api::V1::BoardsController < ApplicationController
  def update
    render json: [1,2,3], status: :ok
  end
end
