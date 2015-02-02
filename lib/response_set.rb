class ResponseSet < ActiveRecord::Base
  has_and_belongs_to_many :responses
  has_and_belongs_to_many :questions

  scope(:canned?, -> do
    where({:canned => true})
  end)

end
