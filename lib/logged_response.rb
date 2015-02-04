class LoggedResponse < ActiveRecord::Base
  belongs_to :question
  belongs_to :session
  belongs_to :response
end
