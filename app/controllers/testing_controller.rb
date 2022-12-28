# frozen_string_literal: true

# testing controller
class TestingController < ApplicationController
  # before_action :set_params
  before_action :set_params, only: :test_choose
  before_action :set_answers, only: %i[set_score_test1 set_score_test2]

  def index; end

  def test_choose
    redirect_to testing_test_process_path(num: 'test1') if @test == 'test1'
    redirect_to testing_test_process_path(num: 'test2') if @test == 'test2'
    redirect_to testing_test_process_path(num: 'test3') if @test == 'test3'
  end

  def set_score_test1
    score_add if @commit == "#{t(:answer)} 1" && @ans == '1'
    score_add if @commit == "#{t(:answer)} 2" && @ans == '4'
    score_add if @commit == "#{t(:answer)} 3" && @ans == '2'
    score_add if @commit == "#{t(:answer)} 4" && @ans == '3'
    score_add if @commit == "#{t(:answer)} 5" && @ans == '3'
    score_add if @commit == "#{t(:answer)} 6" && @ans == '2'
  end

  def set_score_test2
    score_add if @commit == "#{t(:answer)} 1" && @ans == '2'
    score_add if @commit == "#{t(:answer)} 2" && @ans == '1'
    score_add if @commit == "#{t(:answer)} 3" && @ans == '4'
    score_add if @commit == "#{t(:answer)} 4" && @ans == '2'
    score_add if @commit == "#{t(:answer)} 5" && @ans == '1'
    score_add if @commit == "#{t(:answer)} 6" && @ans == '3'
  end

  def score_add
    @user.update_attribute(:rating, @user.rating + 10)
  end

  private

  def set_params
    @test = params[:num]
  end

  def set_answers
    @ans = params[:ans]
    @commit = params[:commit]
    @user = User.find_by_id(session[:current_user_id])
  end
end
