class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.total_revenue_on(params[:date]), serializer: TotalRevenueSerializer
  end

  def show
    if params.has_key?(:date)
      render json: Merchant.find(params[:id]).most_revenue_per(params[:date]), serializer: RevenueSerializer
    else
      render json: Merchant.find(params[:id]).merchant_revenue, serializer: RevenueSerializer
    end
  end
end
