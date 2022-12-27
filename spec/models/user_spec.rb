# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'If adding with similar params' do
    before do
      if User.find_by(email: 'bauman@mail.ru').nil?
        User.create!(email: 'bauman@mail.ru', password: '12345678', password_confirmation: '12345678',
                     birth_date: '12-01-2001')
      end
    end
    it 'should return error if passwords are not equal' do
      expect do
        User.create!(email: 'bauman@mail.ru', password: '12345678', password_confirmation: '12345678',
                     birth_date: '12-01-2001')
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    context 'check existance' do
      it 'exists in database' do
        expect(User.find_by(email: 'bauman@mail.ru').nil?).to eq(false)
      end
    end

    context 'check removed record' do
      User.delete_by(email: 'bauman@mail.ru')
      it 'removed from database' do
        expect(User.find_by(email: 'bauman@mail.ru').nil?).to eq(false)
      end
    end
  end
end
