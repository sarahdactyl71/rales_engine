class ApplicationController < ActionController::API
  def finder_params
    if params.has_key?(:unit_price)
      {unit_price: (params[:unit_price].to_f*100).round}
    else
      params.permit(:id,
                    :name,
                    :description,
                    :created_at,
                    :updated_at,
                    :item_id,
                    :invoice_id,
                    :quantity,
                    :customer_id,
                    :merchant_id,
                    :status,
                    :credit_card_number,
                    :credit_card_expiration,
                    :result,
                    :unit_price,
                    :first_name,
                    :last_name
      )
    end
  end
end
