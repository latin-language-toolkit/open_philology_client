require 'spec_helper'

describe OpenPhilologyClient::Morphology do
  describe "#get" do
    it "gets a response" do
      subject.get("homo").should_not be_nil
    end

    it "returns an Array of entries as Hashes" do
      subject.get("multa").should be_kind_of Array
    end

    it "returns an Array of entries as Hashes even for single entries" do
      subject.get("homo").should be_kind_of Array
    end
  end
end
