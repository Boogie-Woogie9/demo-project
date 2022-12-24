# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, {
    presence: {
      message: ': Вы пропустили поле для почты'
    },
    uniqueness: {
      message: ': Этот email уже занят'
    },
    format: {
      with: /(?:[a-z0-9!#$%&'*+=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/,
      message: ': Некорректный адрес почты'
    }
  }

  validates :password, {
    presence: {
      message: ': Вы пропустили поле для пароля'
    },
    length: {
      minimum: 8,
      message: ': Минимальная длина пароля - 8 символов'
    }
  }

  before_save :check_email

  private

  def check_email; end
end
