class AddCountryToCodeValue < ActiveRecord::Migration[7.0]
  require "csv"
  def change
    CSV.foreach('lib/csvs/CL000086_MetaIS.csv', headers: true) do |row|
      row_hash=row.to_hash
      CodeValue.create!(codelistCode: row_hash["Kód číselnika"],code: row_hash["Kód položky"],value: row_hash["Názov položky"])
    end
  end

  def down
    CodeValue.where(codelistCode: "CL000086").delete_all
  end
end
