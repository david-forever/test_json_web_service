require 'rest-client'
require 'json'

def retrieve_json url
  response = RestClient.get url
  data = JSON.parse(response)
  data
end

describe "#score" do
  it "returns title scorched rocks for dog" do
    data = retrieve_json 'http://localhost:9393/articles/dog'
    data['title'].should eq('Scorched Rocks')
  end
end
