class CreateTerms < ActiveRecord::Migration[6.1]
  def change
    create_table :terms do |t|
      t.string :name
      t.text :field
      t.text :description

      t.timestamps
    end
  end
end
