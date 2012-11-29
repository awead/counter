require 'spec_helper'

describe "patrons/edit" do
  before(:each) do
    @patron = assign(:patron, stub_model(Patron,
      :barcode => "MyString",
      :count => 1
    ))
  end

  it "renders the edit patron form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => patrons_path(@patron), :method => "post" do
      assert_select "input#patron_barcode", :name => "patron[barcode]"
      assert_select "input#patron_count", :name => "patron[count]"
    end
  end
end
