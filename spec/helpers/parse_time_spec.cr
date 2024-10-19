require "../spec_helper"
require "../../src/frozen_layer/helpers/parse_time"

describe "parse_time" do
  it "parses days correctly" do
    span = parse_time("1d")
    span.total_seconds.should eq(86400) # 1 day = 86400 seconds
  end

  it "parses hours correctly" do
    span = parse_time("2h")
    span.total_seconds.should eq(7200) # 2 hours = 7200 seconds
  end

  it "parses minutes correctly" do
    span = parse_time("30m")
    span.total_seconds.should eq(1800) # 30 minutes = 1800 seconds
  end

  it "parses seconds correctly" do
    span = parse_time("45s")
    span.total_seconds.should eq(45) # 45 seconds = 45 seconds
  end

  it "raises an error on invalid format" do
    expect_raises(Exception, "Invalid input format") do
      parse_time("abc")
    end
  end
end
