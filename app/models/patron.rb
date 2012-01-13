class Patron < ActiveRecord::Base

  validates :barcode, :presence => { :message => "Please enter a barcode" }
  validates :barcode, :format => { :with => /^4\d{13,13}$/, :message => "Invalid patron barcode" }

  def self.find_by_barcode(barcode)
    self.find(:first, :conditions => [ "barcode = ?", barcode ])
  end

  def increment
    self.count = self.count + 1
    self.save
  end


end
