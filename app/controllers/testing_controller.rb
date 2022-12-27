# frozen_string_literal: true

# testing controller
class TestingController < ApplicationController
  # before_action :set_params
  before_action :set_params, only: :test_choose

  def index; end

  def test_choose
    redirect_to testing_test1_path(num: 'test1') if @test == 'test1'
    redirect_to testing_test_process_path(num: 'test2') if @test == 'test2'
    redirect_to testing_test_process_path(num: 'test3') if @test == 'test3'
  end

  def set_score
    User.find_by_id(session[:current_user_id]).avrg_rate += 1
  end

  private

  def set_params
    @test = params[:num]
  end
end
