# frozen_string_literal: true

# helper app
module ApplicationHelper
  def score_adder(scores)
    user = User.find_by_id(session[:current_user_id])
    user.avrg_rate += scores
    user.save
  end
end
