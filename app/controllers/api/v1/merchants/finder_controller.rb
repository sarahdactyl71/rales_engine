class Api::V1::Merchants::FinderController < ApplicationController

  def index
    render json: Merchant.where(finder_params)
  end

  def show
    render json: Merchant.find_by(finder_params)
  end
end
