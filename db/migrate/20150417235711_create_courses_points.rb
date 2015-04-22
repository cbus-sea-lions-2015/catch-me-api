class CreateCoursesPoints < ActiveRecord::Migration
  def change
    create_table :courses_points do |t|
      t.float :longitude
      t.float :latitude
      t.integer :course_id
      t.integer :distance_from_previous
   

      t.timestamps null: false
    end
  end
end
