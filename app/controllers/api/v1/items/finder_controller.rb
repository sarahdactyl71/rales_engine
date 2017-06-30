class Api::V1::Items::FinderController < ApplicationController

  def index
    render json: Item.where(finder_params)
  end

  def show
    render json: Item.find_by(finder_params)
  end

end
