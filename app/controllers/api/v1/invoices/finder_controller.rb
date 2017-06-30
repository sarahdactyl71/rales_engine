class Api::V1::Invoices::FinderController < ApplicationController

  def index
    render json: Invoice.where(finder_params)
  end

  def show
    render json: Invoice.find_by(finder_params)
  end
end
