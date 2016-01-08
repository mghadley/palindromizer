class CreatePalindromes < ActiveRecord::Migration
  def change
    create_table :palindromes do |t|
    	t.integer :input_value
    	t.integer :palindrome

      t.timestamps null: false
    end
  end
end
