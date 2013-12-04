require 'spec_helper'

describe StoresController, "sending json request" do

  it "results should be empty if no data is passed" do
    @expected = {
      "results" => []
    }.to_json

    get :index

    response.body.should eq @expected
  end
  
end