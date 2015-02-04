require "spec_helper"

describe LoggedResponse do

  it { should belong_to :question }
  it { should belong_to :session }
  it { should belong_to :response }

end
