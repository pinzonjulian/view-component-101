class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :state, default: 0
      t.string :comment
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :party, null: false, foreign_key: true
      t.timestamps
    end
  end
end
