# frozen_string_literal: true

class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.string :name, limit: 255, null: false, index: true
      t.string :description, limit: 255
      t.string :owner_login, limit: 255, null: false, index: true
      t.boolean :private, default: false
      t.string :html_url, limit: 2083, null: false, index: true
      t.string :clone_url, limit: 255, null: false, index: true

      t.timestamps null: false
    end
  end
end
