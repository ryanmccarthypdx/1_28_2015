require 'spec_helper'

describe(Response) do
  it { should have_and_belong_to_many(:response_sets) }
end
