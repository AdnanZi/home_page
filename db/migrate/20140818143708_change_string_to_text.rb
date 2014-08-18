class ChangeStringToText < ActiveRecord::Migration
  def change
  	change_column :my_infos, :content, :text
  end
end
