class FlickrPhotoInput < SimpleForm::Inputs::Base
  def input(wrapper_options=nil)
    # depends heavily on custom naming conventions, for the sake of simplicity
    photo_id    = object.send(attribute_name) if object.respond_to? attribute_name
    thumb_url   = object.try(:cached_thumb_url)

    # UGLY
    thumb_url   = template.asset_path('placeholder.png') unless thumb_url.present?

    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    # EVEN UGLIER
    template.link_to template.flickr_path, class: 'flickr-input', data: {behaviour: 'openimagebrowser'}, remote: true do
      input = template.image_tag thumb_url, class: 'img-thumbnail'
      input += @builder.hidden_field(attribute_name, merged_input_options)
      input
    end
  end
end