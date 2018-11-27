class CreditContractsController < ApplicationController
  # POST /credit_contracts
  def create
    @credit_contract, @transactions = CreditContractService.create(credit_contract_params)
    create_or_update_response
  end

  private

  def credit_contract_params
    params.require(:credit_contract).permit(:client_id, :credit_id, :starts_at, :sum)
  end

  def create_or_update_response
    if @credit_contract.valid?
      render json: { credit_contract: @credit_contract, transactions: @transactions }
    else
      render json: @credit_contract.errors, status: :unprocessable_entity
    end
  end
end
