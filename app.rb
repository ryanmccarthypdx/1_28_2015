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
  @survey_id = survey.id()
  redirect("/survey/#{@survey_id}")
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
  redirect("/survey/#{@survey_id}/question/#{@question_id}")
end

get("/survey/:survey_id/question/:question_id") do
  @survey_id = params.fetch("survey_id")
  @survey = Survey.find(@survey_id)
  @question_id = params.fetch('question_id')
  @question = Question.find(@question_id)
  @query = @question.query()
  @page_title = @query
  @canned_response_sets = ResponseSet.canned?.all
  erb(:question)
end

post("/survey/:survey_id/question/:question_id") do
  @survey_id = params.fetch("survey_id")
  @survey = Survey.find(@survey_id)
  @question_id = params.fetch('question_id')
  question = Question.find(@question_id)
  selected_response_set = params.fetch("chosen_response_set")
  if selected_response_set == "choose_custom"
    new_response_set = ResponseSet.create()
    new_response_set_id = new_response_set.id()
    5.times() do |counter|
      counter_normalize = counter.+(1)
      fetched_response = params.fetch("response_#{counter_normalize}")
      if !fetched_response.==("")
        Response.create({ :answer => fetched_response, :response_set_ids => new_response_set_id })
      end
    end
    question.update({ :response_set_id => new_response_set_id })
  else
    question.update({ :response_set_id => (selected_response_set.to_i) })
  end
  redirect("/survey/#{@survey_id}/question/#{@question_id}")
end

delete("/delete_everything") do
  Survey.delete_all
  Question.delete_all
  ResponseSet.delete_all
  Response.delete_all
  redirect '/'
end
