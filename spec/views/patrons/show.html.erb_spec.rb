require 'spec_helper'

describe "patrons/show" do
  before(:each) do
    @patron = assign(:patron, stub_model(Patron,
      :barcode => "Barcode",
      :count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Barcode/)
    rendered.should match(/1/)
  end
end
