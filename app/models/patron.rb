class Patron < ActiveRecord::Base

  validates :barcode, :presence => { :message => "Please enter a barcode" }
  validates :barcode, :format => { :with => /^4\d{13,13}$/, :message => "Invalid patron barcode" }

end
