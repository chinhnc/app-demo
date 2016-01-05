class AddPictureToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pictute, :string
  end
end
