# frozen_string_literal: true

# log controller
class LogController < ApplicationController
  before_action :set_params, only: %i[sign_in log]
  def sign_in
    user = User.find_by(email: @email)
    if user.nil?
      @msg << 'Аккаунта с таким логином не существует!'
      return
    end
    if user.authenticate(@password)
      session[:current_user_id] = user.id
      redirect_to root_path
      return
    else
      @msg << 'Неверный пароль!'
    end
  end

  def sign_out; end

  def log
    if @commit == t(:login)
      sign_in
      # redirect_to(root_path) and return
    else
      session[:current_user_id] = 0
      redirect_to root_path
    end
    
  end

  private

  def set_params
    @email = params[:email]
    @password = params[:password]
    @commit = params[:commit]
    @msg = []
  end
end
