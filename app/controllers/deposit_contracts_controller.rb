class DepositContractsController < BaseController
  # POST /deposit_contracts
  def create
    @deposit_contract, @transactions = DepositContractService.create(deposit_contract_params)
    create_or_update_response
  end

  private

  def deposit_contract_params
    params.require(:deposit_contract).permit(:client_id, :deposit_id, :starts_at, :sum)
  end

  def create_or_update_response
    if @deposit_contract.valid?
      render json: { deposit_contract: @deposit_contract, transactions: @transactions }
    else
      render json: @deposit_contract.errors, status: :unprocessable_entity
    end
  end
end
