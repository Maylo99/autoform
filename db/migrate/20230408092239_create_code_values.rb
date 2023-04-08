class CreateCodeValues < ActiveRecord::Migration[7.0]
  def change
    create_table :code_values do |t|
      t.string :value
      t.string :code, limit: 50
      t.string :codelistCode, limit: 50
    end
  end
end
