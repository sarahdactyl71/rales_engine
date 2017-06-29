class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
      render json: Merchant.most_revenue_top(params[:quantity])
  end
end
