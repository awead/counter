class Patron < ActiveRecord::Base

  acts_as_xlsx

  validates :barcode, :presence => { :message => "Please enter a barcode" }
  validates :barcode, :format => { :with => /^4\d{13,13}$/, :message => "Invalid patron barcode" }

end
