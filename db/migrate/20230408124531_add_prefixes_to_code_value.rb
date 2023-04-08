class AddPrefixesToCodeValue < ActiveRecord::Migration[7.0]
  require 'csv'

  def up
    CSV.foreach('lib/csvs/CL000062_MetaIS.csv', headers: true) do |row|
      row_hash=row.to_hash
      CodeValue.create!(codelistCode: row_hash["Kód číselnika"],code: row_hash["Kód položky"],value: row_hash["Názov položky"])
    end
  end

  def down
    CodeValue.where(:codelistCode => "CL000062").delete_all
  end
end
