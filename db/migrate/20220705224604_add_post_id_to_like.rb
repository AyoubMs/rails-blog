class AddPostIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :post_id_integer_index, :string
  end
end