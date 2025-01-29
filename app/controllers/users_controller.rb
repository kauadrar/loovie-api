# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :me ]

  def me
    @user = current_user
    render :show
  end

  def exists
    if user_params[:email].blank? && user_params[:username].blank?
      render json: { error: "You must provide an email or a username" }, status: :bad_request
      return
    end

    user_exists = User.exists?(user_params)

    render json: { exists: user_exists }, status: :ok
  end

  def user_params
    params.permit(:email, :username)
  end
end
