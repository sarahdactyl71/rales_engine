class Api::V1::Customers::FinderController < ApplicationController

  def index
    render json: Customer.where(finder_params)
  end

  def show
    render json: Customer.find_by(finder_params)
  end
end
