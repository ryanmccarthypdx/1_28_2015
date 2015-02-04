require 'spec_helper'

describe(ResponseSet) do
  it { should have_and_belong_to_many(:responses) }
  it { should have_many(:questions) }

  describe('.canned?') do
    it("returns only the responsesets marked as canned") do
      agree = Response.create({:answer => "I agree"})
      disagree = Response.create({:answer => "I disagree"})
      agree_id = agree.id()
      disagree_id = disagree.id()
      responses_array = []
      responses_array.push(agree_id)
      responses_array.push(disagree_id)
      respset1 = ResponseSet.create({:response_ids => responses_array, :canned => true})
      dunno = Response.create({:answer => "I don't know"})
      privacy = Response.create({:answer => "That's private"})
      dunno_id = dunno.id()
      privacy_id = privacy.id()
      responses_array2 = []
      responses_array2.push(dunno_id)
      responses_array2.push(privacy_id)
      respset2 = ResponseSet.create({:response_ids => responses_array2, :canned => false})
      expect(ResponseSet.canned?.all).to(eq([respset1]))
    end
  end

end
