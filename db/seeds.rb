
true_false = ResponseSet.create({ :name => "True/false", :canned => true })
yes_no = ResponseSet.create({ :name => "Yes/No", :canned => true })
satisfied_spectrum = ResponseSet.create({ :name => "Satisfaction Spectrum", :canned => true })
agree_spectrum = ResponseSet.create({ :name => "Agreement Spectrum", :canned => true })

Response.create({ :answer => "True", :response_set_ids => true_false.id() })
Response.create({ :answer => "False", :response_set_ids => true_false.id() })

Response.create({ :answer => "Yes", :response_set_ids => yes_no.id() })
Response.create({ :answer => "No", :response_set_ids => yes_no.id() })

Response.create({ :answer => "Very Satisfied", :response_set_ids => satisfied_spectrum.id() })
Response.create({ :answer => "Somewhat Satisfied", :response_set_ids => satisfied_spectrum.id() })
Response.create({ :answer => "Neutral", :response_set_ids => satisfied_spectrum.id() })
Response.create({ :answer => "Somewhat Unsatisfied", :response_set_ids => satisfied_spectrum.id() })
Response.create({ :answer => "Very Unsatisfied", :response_set_ids => satisfied_spectrum.id() })

Response.create({ :answer => "Strongly Agree", :response_set_ids => agree_spectrum.id() })
Response.create({ :answer => "Somewhat Agree", :response_set_ids => agree_spectrum.id() })
Response.create({ :answer => "Neutral", :response_set_ids => agree_spectrum.id() })
Response.create({ :answer => "Somewhat Disagree", :response_set_ids => agree_spectrum.id() })
Response.create({ :answer => "Strongly Disagree", :response_set_ids => agree_spectrum.id() })
