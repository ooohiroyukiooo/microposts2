class CreateFrelationships < ActiveRecord::Migration
  def change
    create_table :frelationships do |t|
      t.references :fmicropost, index: true #, foreign_key: true
      t.references :fuser, index: true #, foreign_key: true

      t.timestamps #null: false
      
      t.index [:fmicropost_id, :fuser_id], unique: true # この行を追加
    end
  end
end
