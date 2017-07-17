
require "spec_helper"

describe Collator do

  subject(:collator) { described_class.new }
  let(:dataset) { double("BlankData") }

  before do
    allow(dataset).to receive(:body).and_return("Mock, data, here")
    allow(collator).to receive(:get_term_data).and_return(dataset)
  end

  describe "#csv_term_data" do
    it "will open a new csv file in write mode" do
      expect(CSV).to receive(:open).with("../term_data.csv", "w")
      collator.csv_term_data
    end
    it "will grab term data from everypolitician" do
      expect(collator).to receive(:get_term_data)
      collator.csv_term_data
    end
    it "will export term data to a csv file" do
       values = nil
       collator.csv_term_data
       File.readlines("../term_data.csv").each {|line| values = line}
       expect(values).to eq("\"Mock, data, here\"\n")
    end
  end

end
