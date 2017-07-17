
require "spec_helper"


describe Twit do

  subject(:twitter) { described_class.new }
  let(:client) {double("Client")}
  let(:collator) { double("Collator") }
  let(:parser) { double("Parser") }
  let(:tweet) { double("Tweet")}

  describe "#get_tweets_for" do
    before do
      allow(twitter).to receive(:client).and_return(client)
      allow(parser).to receive(:find_twitter_handle_of).with("nobody").and_return(nil)
      allow(client).to receive(:user_timeline).with(screen_name: parser.find_twitter_handle_of("nobody"), count: 10)
    end
    it "invoke twitter API's user_timeline" do
      expect(client).to receive(:user_timeline).with(screen_name: nil, count: 10)
      twitter.get_tweets_for("nobody")
    end
    it "collects the user's ten most recent tweets" do
      tweets = []; 10.times { tweets << tweet}
      allow(client).to receive(:user_timeline).and_return(tweets)
      expect{twitter.get_tweets_for("nobody")}.to change{twitter.tweets}.from([]).to([tweets])
    end
  end

end
