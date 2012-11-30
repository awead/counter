class Patron < ActiveRecord::Base

  validates :barcode, :presence => { :message => "Please enter a barcode" }
  validates :barcode, :format => { :with => /^4\d{13,13}$/, :message => "Invalid patron barcode" }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["Barcode", "Count", "Date"]
      all.each do |patron|
        csv << [patron.barcode, patron.count, patron.created_at.strftime("%D %T")]
      end
    end
  end

end
