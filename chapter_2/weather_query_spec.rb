require 'rspec'
require_relative 'weather_query'

describe WeatherQuery do
  describe '.forecast' do
    it "raises a NetworkError instead of Timeout::Error" do
      expect(Net::HTTP).to receive(:get).and_raise(Timeout::Error)

      expected_error   = WeatherQuery::NetworkError
      expected_message = "Request timed out"

      expect{
        WeatherQuery.forecast("Antarctica")
      }.to raise_error(expected_error, expected_message)
    end
  end

  it "raises an error" do
    expect{ 1/0 }.to raise_error
    expect{ 1/0 }.to raise_error(ZeroDivisionError)
    expect{ 1/0 }.to raise_error(ZeroDivisionError, /divided/)
    expect{ 1/0 }.to raise_error(ZeroDivisionError, "divided by 0")

    expect{ 1/0 }.to raise_error do |e|
      expect(e.message).to eq("divided by 0")
    end
  end

  it "does not raise an error" do
    expect{
      1/1
    }.to_not raise_error
  end

  it "raises a timeout error" do
    expect(Net::HTTP).to receive(:get).and_raise(Timeout::Error)
    # allow( Net::HTTP ).to receive(:get).with('http://example.org').and_raise(Timeout::Error)
    # expect { WeatherQuery.send(:http, 'http://example.org') }.to raise_error(Timeout::Error)
    expect { Net::HTTP.get('http://example.org') }.to raise_error(Timeout::Error)
  end
end
