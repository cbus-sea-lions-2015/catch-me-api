class AddFields < ActiveRecord::Migration
  def change
    add_column :courses,   :favorite, :boolean, :default => false
    add_column :courses, :catch_me_course_id, :integer
  end
end
