require 'json'
require 'rspec'
require 'rest-client'

describe 'RPN Calculator Service' do

  it "returns usage help when no arguments are passed" do
    response = RestClient.get 'http://localhost:3000/'
    expect(JSON.parse(response)['usage'])
      .not_to be_nil
  end

  it "evaluates an arithmetic expression in postfix form" do
    response = RestClient.get 'http://localhost:3000/calc/2/5/3/+/*/8/2/d/-'
    expect(JSON.parse(response)['rpn']['result'])
      .to eq '12.0'
  end

  it "returns 'invalid input' when it gets confused" do
    response = RestClient.get 'http://localhost:3000/calc/2/-/2/+'
    expect(JSON.parse(response)['rpn']['result'])
      .to eq 'invalid input'
  end

end