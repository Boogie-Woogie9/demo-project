# frozen_string_literal: true

ActiveRecord::Schema[7.0].define(version: 20_221_224_192_918) do
  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'password_digest', null: false
    t.date 'birth_date', null: false
    t.integer 'rating', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end
end
