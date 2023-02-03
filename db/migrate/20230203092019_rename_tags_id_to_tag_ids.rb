class RenameTagsIdToTagIds < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :tags_id, :tag_ids
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
