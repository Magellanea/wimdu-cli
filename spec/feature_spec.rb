require "spec_helper"

describe "Wimdu CLI" do
  let(:exe) { File.expand_path('../../bin/wimdu', __FILE__) }

  describe "new" do
    let(:cmd) { "#{exe} new" }

    it "allows for entering data" do
      process = run_interactive(cmd)
      expect(process.output).to include("Starting with new property")
      expect(process.output).to include("Title: ")
      type "My Title"
      expect(process.output).to include("Address: ")
    end

    it "validates numbers before save" do
      process = run_interactive(cmd)
      expect(process.output).to include("Starting with new property")
      expect(process.output).to include("Title: ")
      type "My Title"
      expect(process.output).to include("Address: ")
      type "My Address"
      expect(process.output).to include("Nightly Rate EUR: ")
      type "Two"
      expect(process.output).to include("Error")
    end

    it "validates emails" do
      process = run_interactive(cmd)
      expect(process.output).to include("Starting with new property")
      expect(process.output).to include("Title: ")
      type "My Title"
      expect(process.output).to include("Address: ")
      type "My Address"
      expect(process.output).to include("Nightly Rate EUR: ")
      type "2"
      expect(process.output).to include("Max guests")
      type "2"
      expect(process.output).to include("Email")
      type "invalid@com"
      expect(process.output).to include("Error")
    end

    it "saves an offer when everything is fine" do
      process = run_interactive(cmd)
      type "My title"
      type "My address"
      type "2"
      type "2"
      type "user@wimdu.com"
      type "123015"
      expect(process.output).to include("Great job!")
    end


    # Please extend!
  end
end
