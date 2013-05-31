require 'scorched'
require 'rest-client'
require 'json'

class App < Scorched::Controller

  # From the most simple route possible...
  get '/' do
    "Hello World"
  end

  # To something that gets the muscle's flexing
  route '/articles/:title/::opts', 2, method: ['GET', 'POST'], content_type: :json do
    # Do what you want in here. Note, the second argument is the optional route priority.
  end

  # Anonymous controllers allow for convenient route grouping to which filters and conditions can be applied
  controller conditions: {media_type: 'application/json'} do
    get '/articles/*' do |page|
      {title: 'Scorched Rocks', body: '...', created_at: '27/08/2012', created_by: 'Bob'}
    end

    after do
      response.body = response.body.to_json
    end
  end

  # The things you get for free by using Classes for Controllers (...that's directed at you Padrino)
  def my_little_helper
    # Do some crazy awesome stuff that no route can resist using.
  end
end
run App

