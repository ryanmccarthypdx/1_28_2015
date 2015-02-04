class Session < ActiveRecord::Base
  has_many :logged_responses
  has_many :questions, through: :logged_responses
  has_many :responses, through: :logged_responses
end
