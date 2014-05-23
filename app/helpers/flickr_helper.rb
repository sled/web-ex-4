module FlickrHelper
  def flickr_image_tag(photo_id, format=:m)
    if photo_id.blank?
      image_tag 'placeholder.png', class: 'flickr'
    else
      image_tag FlickRaw.url_m(flickr.photos.getInfo(photo_id: photo_id)), class: 'flickr img-thumbnail img-responsive'
    end
  end

  def flickr_thumb_tag(photo_id, format=:m)
    if photo_id.blank?
      image_tag 'placeholder.png', class: 'flickr img-thumbnail'
    else
      image_tag FlickRaw.url_q(flickr.photos.getInfo(photo_id: photo_id)), class: 'flickr img-thumbnail img-responsive'
    end
  end

  def flickr_author_tag(author, profile_url)
    if author.present? && profile_url.present?
      link_to(author.titleize, profile_url, class: 'flickr-author', target: '_blank').html_safe
    elsif author.present?
      content_tag(:span, author.titleize, class: 'flickr-author').html_safe
    else 
      content_tag(:span, 'Author Unknown', class: 'flickr-author').html_safe
    end
  end
end
