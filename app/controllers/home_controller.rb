# frozen_string_literal: true

# homepage
class HomeController < ApplicationController
  def index; end

  def inline_pdf
    File.expand_path('Instruction.pdf')
    send_data 'Instruction.pdf', disposition: 'inline', type: 'application/pdf'
  end
end
