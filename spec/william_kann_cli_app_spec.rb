RSpec.describe WilliamKannCliApp do
  it "has a version number" do
    expect(WilliamKannCliApp::VERSION).not_to be nil
  end

  it "has a call method" do
    expect(WilliamKannCliApp::CLI.new.call).not_to be nil
  end
end
