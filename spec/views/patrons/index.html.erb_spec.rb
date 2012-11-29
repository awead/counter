require 'spec_helper'

describe "patrons/index" do
  before(:each) do
    assign(:patrons, [
      stub_model(Patron,
        :barcode => "Barcode",
        :count => 1
      ),
      stub_model(Patron,
        :barcode => "Barcode",
        :count => 1
      )
    ])
  end

  it "renders a list of patrons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Barcode".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
