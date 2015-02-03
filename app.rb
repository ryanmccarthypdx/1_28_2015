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
  survey = Survey.create({:title => title})
  # @title = @survey.title()
  @survey_id = survey.id()
  # @list_of_questions = @survey.questions()
  # @page_title = @title
  redirect '/survey/'.concat(@survey_id.to_s)
end

get("/survey/:id") do
  id = params.fetch("id")
  @survey = Survey.find(id)
  @list_of_questions = @survey.questions()
  @title = @survey.title()
  @page_title = @title
  erb(:survey)
end

post("/survey/:id/new_question") do
  @survey_id = params.fetch("id")
  query = params.fetch("question_query")
  new_question = Question.create({ :query => query, :survey_id => @survey_id })
  @question_id = new_question.id()
  redirect '/survey/'.concat(@survey_id.to_s).concat('/question/').concat(@question_id.to_s)
end

get("/survey/:survey_id/question/:question_id") do
  @survey_id = params.fetch("survey_id")
  @question_id = params.fetch('question_id')
  @question = Question.find(@question_id)
  @query = @question.query()
  @page_title = @query
  @canned_response_sets = ResponseSet.canned?.all
  erb(:question)
end

delete("/delete_everything") do
  Survey.delete_all
  Question.delete_all
  ResponseSet.delete_all
  Response.delete_all
  redirect '/'
end
