class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.total_revenue_on(params[:date])
  end

  def show
    if params.has_key?(:date)
      render json: Merchant.find(params[:id]).most_revenue_per(params[:date])
    else
      render json: Merchant.find(params[:id]).merchant_revenue
    end
  end
end
