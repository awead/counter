require 'spec_helper'

describe Patron do
 
  before :each do
    @patron = Patron.new
  end

  it "should not save invalid barcodes" do
    @patron.barcode = "foo"
    @patron.save.should be_false
    @patron.errors.messages[:barcode].should == ["Invalid patron barcode"]
  end

  it "should not save blank barcodes" do
    @patron.save.should be_false
    @patron.errors.messages[:barcode].should == ["Please enter a barcode", "Invalid patron barcode"]    
  end

  it "should save valide barcodes" do
    @patron.barcode = "41111111111111"
    @patron.save.should be_true
    @patron.barcode.should == "41111111111111"
  end

  describe "::to_csv" do
    it "should return a csv file" do
      @patron.barcode = "41111111111111"
      @patron.save
      time = @patron.created_at.strftime("%D %T")
      Patron.to_csv.should match("Barcode,Count,Date\n41111111111111,1,"+time+"\n")
    end

  end
  
end
