class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:capitalize_title)

private

  define_method(:capitalize_title) do
    self.title=(title().capitalize())
  end
end
