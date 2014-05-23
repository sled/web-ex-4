module ApplicationHelper
  def active_if(*args)
    current_page?(*args) ? 'active' : ''
  end
end
