class CreateSenators < ActiveRecord::Migration
  def change
    create_table :senators do |t|
      t.string :name
      t.integer :score
      t.string :gender
      t.string :state
      t.string :party

      t.timestamps
    end
  end
end
