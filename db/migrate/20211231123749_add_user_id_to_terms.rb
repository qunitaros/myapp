class AddUserIdToTerms < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM terms;'
    add_reference :terms, :user, null: false, index: true
  end

  def down
    remove_reference :terms, :user, index: true
  end
end
