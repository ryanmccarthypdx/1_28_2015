ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
    Response.all().each() do |response|
      response.destroy()
    end
    ResponseSet.all().each() do |response_set|
      response_set.destroy()
    end
  end
end
