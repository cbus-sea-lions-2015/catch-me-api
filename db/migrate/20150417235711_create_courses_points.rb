class CreateCoursesPoints < ActiveRecord::Migration
  def change
    create_table :courses_points do |t|
      t.integer :longitude
      t.integer :latitude
      t.integer :course_id
      t.integer :altitude
      t.integer :speed
      t.integer :distance_from_previous

      t.timestamps null: false
    end
  end
end
