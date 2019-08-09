module TagsHelper
  def category_label item
    if item.is_course_type
      content_tag :span, item, {:class => "tag is-cyan"}
    else
      content_tag :span, item, {:class => "tag is-blue"}
    end
  end

  def additional_category_label item
    content_tag :span, item, {:class => "tag is-blue is-outlined"}
  end

  def main_ingredient_label item
    content_tag :span, item, {:class => "tag is-purple"}
  end

  def additional_main_ingredient_label item
    content_tag :span, item, {:class => "tag is-purple is-outlined"}
  end
end