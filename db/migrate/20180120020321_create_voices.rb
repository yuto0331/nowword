class CreateVoices < ActiveRecord::Migration[5.1]
  def change
    create_table :voices do |t|
      t.text :content
      t.timestamps
    end
  end
end
