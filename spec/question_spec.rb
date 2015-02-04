require("spec_helper")

describe(Question) do

  it { should belong_to(:survey) }
  it { should belong_to(:response_set) }
  it { should have_many :logged_responses }
  it { should have_many(:responses)}
  it { should have_many(:sessions)}

end
