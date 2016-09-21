class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :author
      t.integer :user_id
      t.integer :friendship_id
      t.string :job_url
      t.string :role
      t.text :body

      t.timestamps null:false
    end
  end
end
