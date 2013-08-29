require 'spec_helper'

describe OpenPhilologyClient::Morphology, :vcr do
  describe "#analyse_word" do
    it "gets a response" do
      subject.analyse_word("homo").should_not be_nil
    end

    it "returns an Array of entries as Hashes" do
      subject.analyse_word("multa").should be_kind_of Array
    end

    it "returns an Array of entries as Hashes even for single entries" do
      subject.analyse_word("homo").should be_kind_of Array
    end

    it "returns nil if the word was not found" do
      subject.analyse_word("notexisting").should be_nil
    end
  end
end
