module FontAwesomeHelper
  def font_awesome_icon icon
    content_tag :span, {:class => "icon"} do
      content_tag(:i, "", {:class => "fa fa-" + icon})
    end
  end
end