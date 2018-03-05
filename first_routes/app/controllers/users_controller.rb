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
    begin
      result = User.find(params[:id])
      render json: result
    rescue Exception => e
      render plain: "No such user #{params[:id]}", status: :unprocessable_entity
    end
  end

  def destroy
    begin
      result = User.find(params[:id])
      result.destroy
      render plain: "User #{params[:id]} destroy"
    rescue Exception => e
      render plain: "No such user #{params[:id]}"
    end
  end

  def update
    begin
      result = User.find(params[:id])
      result.update(user_params)
      render json: result
    rescue StandardError => e
      render plain:  "No such user #{params[:id]}", status: :unprocessable_entity
    end
  end

    def user_params
      params[:user].permit(:name, :email)
    end
end
