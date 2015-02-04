require 'spec_helper'

describe(Response) do
  it { should have_and_belong_to_many(:response_sets) }
  it { should have_many :logged_responses }
  it { should have_many :questions }
  it { should have_many :sessions }
end
