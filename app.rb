require("bundler/setup")
require("pry")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @all_surveys = Survey.all()
  @page_title = "Welcome to Survey Ape"
  erb(:index)
end

post("/survey_post") do
  title = params.fetch("survey_title")
  @survey = Survey.create({:title => title})
  @title = @survey.title()
  @list_of_questions = @survey.questions()
  @page_title = @title
  erb(:survey)
end

get("/survey/:id") do
  id = params.fetch("id")
  @survey = Survey.find(id)
  @list_of_questions = @survey.questions()
  @title = @survey.title()
  @page_title = @title
  erb(:survey)
end

post("/survey/:id/question_post") do
  id = params.fetch("id")
  query = params.fetch("question_query")
  new_question = Question.create({ :query => query, :survey_id => id })
  @survey = Survey.find(id)
  @list_of_questions = @survey.questions()
  @title = @survey.title()
  @page_title = @title
  erb(:survey)
end
