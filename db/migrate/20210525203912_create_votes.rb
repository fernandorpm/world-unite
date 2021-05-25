class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.belongs_to :article_id, null: false

      t.timestamps
    end
  end
end
