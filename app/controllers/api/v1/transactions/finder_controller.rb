class Api::V1::Transactions::FinderController < ApplicationController

  def index
    render json: Transaction.where(finder_params)
  end

  def show
    render json: Transaction.find_by(finder_params)
  end
end
