class CreateEmployments < ActiveRecord::Migration[5.0]
  def change
    create_table :employments do |t|
      t.integer :profile_id
      t.string :industry
      t.string :title
      t.string :company
      t.string :companyimg
      t.string :city
      t.string :state
      t.string :summary
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps null: false
    end
  end
end
