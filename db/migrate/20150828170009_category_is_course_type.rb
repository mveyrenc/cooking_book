class CategoryIsCourseType < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :is_course_type, :boolean, null: false, default: false
  end
end
