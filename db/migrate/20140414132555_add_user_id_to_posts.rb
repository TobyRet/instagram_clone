class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :User, index: true
  end
end
