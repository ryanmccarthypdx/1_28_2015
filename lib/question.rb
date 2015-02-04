class Question < ActiveRecord::Base
  belongs_to(:survey)
  belongs_to(:response_set)

  has_many :logged_responses
  has_many :sessions, through: :logged_responses
  has_many :responses, through: :logged_responses
end
