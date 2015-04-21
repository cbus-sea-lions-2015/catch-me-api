class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.float :average_speed
      t.string :duration
      t.float :distance
      t.string :country
      t.string :city
      t.string :name

      t.timestamps null: false
    end
  end
end
