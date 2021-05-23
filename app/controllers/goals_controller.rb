class GoalsController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.account = Account.find(params[:account_id])
    if @goal.save
      redirect_to account_path(@goal.account)
    else
      render :new
    end
  end

  def edit
    @account = Account.find(params[:id])
    @goal = Goal.find(params[:account_id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to account_path(@goal.account)
    else
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to account_path(@goal.account)
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :goal_amount, :goal_balance, :end_date, :completed, :photo)
  end

end
