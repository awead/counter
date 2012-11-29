require 'spec_helper'

describe "patrons/new" do
  before(:each) do
    assign(:patron, stub_model(Patron,
      :barcode => "MyString",
      :count => 1
    ).as_new_record)
  end

  it "renders new patron form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => patrons_path, :method => "post" do
      assert_select "input#patron_barcode", :name => "patron[barcode]"
      assert_select "input#patron_count", :name => "patron[count]"
    end
  end
end
