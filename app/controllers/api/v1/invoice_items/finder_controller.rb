class Api::V1::InvoiceItems::FinderController < ApplicationController

  def index
    render json: InvoiceItem.where(finder_params)
  end

  def show
    render json: InvoiceItem.find_by(finder_params)
  end
end
