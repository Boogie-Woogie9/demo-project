# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /index' do
    it 'returns http status 200' do
      get '/inline_pdf/:name'
      expect(response)
    end
  end
end
