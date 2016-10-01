module ApplicationHelper
  def tick_or_cross(bool)
    content_tag(:span, '', :class => bool ? 'icon-checkmark' : 'icon-cross', 'aria-hidden' => true)
  end
end
