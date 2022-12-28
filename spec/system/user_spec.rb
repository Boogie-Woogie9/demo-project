# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'GET ' do
    context 'Should return' do
      before do
        User.create!(email: 'evseenkov@mail.ru', password: '12345678')
      end

      scenario 'success while registration' do
        visit new_user_path
        fill_in :email, with: 'test_user@bmstu.ru'
        fill_in :password, with: '12345678'
        fill_in :password_confirmation, with: '12345678'
        find('#sign-up-btn').click
        sleep(0.1)
        expect(current_path).to eq '/en'
      end

      scenario 'results after success login' do
        visit '/log/sign_in'
        fill_in :email, with: 'evseenkov@mail.ru'
        fill_in :password, with: '12345678'
        find('#btn_input').click
        sleep(0.1)
        visit root_path
        expect(current_path).to eq root_path
      end
    end
  end
end
