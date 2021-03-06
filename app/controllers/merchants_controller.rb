class MerchantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant, only: %i[show edit update destroy]

  # GET /merchants or /merchants.json
  def index
    @merchants = Merchant.search(params[:search])
  end

  # GET /merchants/1 or /merchants/1.json
  def show; end

  # GET /merchants/new
  def new
    @merchant = Merchant.new
  end

  # GET /merchants/1/edit
  def edit
    if current_user.role_admin?
      @merchant = Merchant.find_by_id(params[:id])
    else
      redirect_to @merchant, alert: 'Admin not authrized'
    end
  end

  # POST /merchants or /merchants.json
  def create
    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to merchants_url(@merchants), notice: 'Merchant was successfully created.' }
        format.json { render :index, status: :created, location: @merchants }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1 or /merchants/1.json
  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to merchants_url(@merchants), notice: 'Merchant was successfully updated.' }
        format.json { render :index, status: :ok, location: @merchants }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1 or /merchants/1.json
  def destroy
    if current_user.role_admin?
      @merchant.destroy

      respond_to do |format|
        format.html { redirect_to merchants_url, notice: 'Merchant was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to merchants_url, alert: 'Admin not authrized'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def merchant_params
    params.require(:merchant).permit(:name, :city, :street, :country_code, :extra_info)
  end
end
