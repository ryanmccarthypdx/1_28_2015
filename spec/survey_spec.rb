require('spec_helper')

describe("Survey") do
  describe('#capitalize') do
    it("switches uncapitalized survey names to capitalized") do
      new_survey = Survey.create({:title => "loudness"})
      expect(new_survey.title()).to(eq("Loudness"))
    end

    it("works for multiword survey names also") do
      new_survey = Survey.create({:title => "loudness survey"})
      expect(new_survey.title()).to(eq("Loudness survey"))
    end
  end
end
