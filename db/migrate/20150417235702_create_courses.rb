class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :name
      t.boolean :favorite, :default => false
      t.integer :catch_me_course_id

      t.timestamps null: false
    end
  end
end
