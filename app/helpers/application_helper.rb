module ApplicationHelper
  def nav_bar
    content_tag(:ul, class: 'navbar-nav mr-auto') do
      yield
    end
  end

  def nav_link(text, path)
    options = controller_name == text.downcase ? { class: 'nav-item active' } : { class: 'nav-item' }
    content_tag(:li, options) do
      link_to text, path, class: 'nav-link'
    end
  end
end
