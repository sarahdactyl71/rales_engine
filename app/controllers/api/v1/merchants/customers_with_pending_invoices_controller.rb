class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController

  def show
    render json: Merchant.find(params[:id]).pending_invoices
  end
end
