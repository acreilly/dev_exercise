class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.belongs_to :organization, index: true, null: false
      t.belongs_to :user, index: true, null: false
    end
  end
end
