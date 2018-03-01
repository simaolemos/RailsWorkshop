class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.references :following,
        foreign_key: { to_table: :users }

      t.references :followed,
        foreign_key: { to_table: :users }

      # t.belongs_to :user, foreign_key: true
      # t.integer :followed_id, foreign_key: true
      t.timestamps
    end
  end
end


# t.belongs_to :user,
#   foreign_key: true,
#   index: true
#
# t.belongs_to :followed_user,
#   foreign_key: { to_table: :users },
#   index: true
