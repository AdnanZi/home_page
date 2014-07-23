class CreateMyInfos < ActiveRecord::Migration
  def change
    create_table :my_infos do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
