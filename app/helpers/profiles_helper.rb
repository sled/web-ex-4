module ProfilesHelper
  def user_avatar_xs(user)
    gravatar_image_tag(user.email, :alt => user.name, :class => 'img-circle', :gravatar => { :size => 24 })
  end

  def user_avatar_sm(user)
    gravatar_image_tag(user.email, :alt => user.name, :class => 'img-circle', :gravatar => { :size => 32 })
  end

  def user_avatar_md(user)
    gravatar_image_tag(user.email, :alt => user.name, :class => 'img-circle', :gravatar => { :size => 48 })
  end

  def user_avatar_lg(user)
    gravatar_image_tag(user.email, :alt => user.name, :class => 'img-circle', :gravatar => { :size => 64 })
  end

  def user_avatar_lg_square(user)
    gravatar_image_tag(user.email, :alt => user.name, :gravatar => { :size => 64 })
  end

  def user_avatar_xl(user)
    gravatar_image_tag(user.email, :alt => user.name, :gravatar => { :size => 200 })
  end
end
