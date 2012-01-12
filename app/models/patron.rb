class Patron < ActiveRecord::Base

  def self.find_by_barcode(barcode)
    self.find(:first, :conditions => [ "barcode = ?", barcode ])
  end

  def increment
    self.count = self.count + 1
    self.save
  end


end
