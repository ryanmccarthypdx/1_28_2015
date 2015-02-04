require 'spec_helper'

describe Session do

  it { should have_many :logged_responses }
  it { should have_many :questions }
  it { should have_many :responses }

end
