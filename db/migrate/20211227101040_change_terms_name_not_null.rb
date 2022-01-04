class ChangeTermsNameNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :terms, :name, false
  end
end
