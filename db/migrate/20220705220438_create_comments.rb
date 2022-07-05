# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
