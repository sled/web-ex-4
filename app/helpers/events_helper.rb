module EventsHelper
  def event_thumb_tag(event)
    if event.cached_thumb_url.blank?
      image_tag 'placeholder.png', class: 'flickr img-thumbnail img-responsive'
    else 
      image_tag event.cached_thumb_url, class: 'flickr img-thumbnail img-responsive'
    end
  end
end
