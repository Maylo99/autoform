class AddStatutoryBodyMemberToCodeValue < ActiveRecord::Migration[7.0]
  require 'csv'
  def up
    CSV.foreach('lib/csvs/CL010470.csv', headers: true,liberal_parsing: true, col_sep: "|") do |row|
      row_hash=row.to_hash
      CodeValue.create!(codelistCode: "CL010470",code: row_hash["code"],value: row_hash["officialTitle"])
    end
  end

  def down
    CodeValue.where(codelistCode: "CL010470" ).delete_all
  end
end
