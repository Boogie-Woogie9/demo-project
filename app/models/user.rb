# frozen_string_literal: true

# user validation
class User < ApplicationRecord
  has_secure_password

  validates :email, {
    presence: {
      message: I18n.t(:emailempty)
    },
    uniqueness: {
      message: I18n.t(:alreadyexists)
    },
    format: {
      with: /(?:[a-z0-9!#$%&'*+=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/,
      message: I18n.t(:invalidemail)
    }
  }

  validates :password, {
    presence: {
      message: I18n.t(:passempty)
    },
    length: {
      minimum: 8,
      message: I18n.t(:minlen)
    }
  }

  validates :birth_date, {
    presence: {
      message: I18n.t(:birthempty)
    },
    date: {
      after: Time.now - 100.year, before: Time.now - 14.year,
      message: I18n.t(:young)
    }
  }

  before_save :check_email

  private

  def check_email; end
end
