
require "spec_helper"


describe Parser do

  subject(:parser) { described_class.new }

  describe "#find_twitter_handle_of" do
    context "when the target pol isn't in the data" do
      it "will return nil" do
        expect(parser.find_twitter_handle_of("anon")).to eq(nil)
      end
    end
    context "when target politician is present" do
      it "will return return their twitter handle" do
        expect(parser.find_twitter_handle_of("Thangam Debbonaire")).to eq("thangammp")
      end
    end
  end

end
