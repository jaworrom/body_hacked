class CreateHackTips < ActiveRecord::Migration
  def change
    create_table :hack_tips do |t|
      t.string :title
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
