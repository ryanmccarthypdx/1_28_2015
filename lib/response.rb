class Response < ActiveRecord::Base
  has_and_belongs_to_many :response_sets

  has_many :logged_responses
  has_many :sessions, through: :logged_responses
  has_many :questions, through: :logged_responses 
end
