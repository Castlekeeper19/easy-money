class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def show
    @holdings = Holding.where(account_id: @account.id)
    @completed = Goal.where(completed: true, account_id: @account.id)
    @incompleted = Goal.where(completed: false, account_id: @account.id)
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to acounts_path
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:category, :location, :name)
  end
end
