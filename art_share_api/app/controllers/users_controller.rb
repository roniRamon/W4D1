class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    result = User.find_by(:id => params[:id])
    unless result.nil?
      render json: result
    else
      render plain: "No such user #{params[:id]}", status: 404
    end
  end

  def destroy
    result = User.find_by(:id => params[:id])
    unless result.nil?
      result.destroy
      render plain: "User #{params[:id]} destroy"
    else
      render plain: "No such user #{params[:id]}", status: 404
    end
  end

  def update
    result = User.find_by(:id => params[:id])
    unless result.nil?
      result.update(user_params)
      render json: result
    else
      render plain: "No such user #{params[:id]}", status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
