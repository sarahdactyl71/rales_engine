class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.total_revenue_on(params[:date])
  end

  def show
    render json: Merchant.find(params[:id]).merchant_revenue
  end

end
