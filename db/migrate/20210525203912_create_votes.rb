class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :article, null: false

      t.timestamps
    end
  end
end
