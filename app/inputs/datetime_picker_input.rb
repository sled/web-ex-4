class DatetimePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options=nil)
    value = object.send(attribute_name) if object.respond_to? attribute_name
    display_pattern = I18n.t('datepicker.dformat', :default => '%m/%d/%Y') + ' ' + I18n.t('timepicker.dformat', :default => '%H:%M %p')
    input_html_options[:value] ||= I18n.localize(value, :format => display_pattern) if value.present?

    input_html_options[:type] = 'text'
    picker_pattern = I18n.t('datepicker.pformat', :default => 'MM/dd/yyyy') + ' ' + I18n.t('timepicker.pformat', :default => 'hh:mm')
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ format: picker_pattern, language: I18n.locale.to_s,
                                       date_weekstart: I18n.t('datepicker.weekstart', :default => 0) })

    template.content_tag :div, class: 'input-group date datetimepicker' do
      input = super(class: 'form-control') # leave StringInput do the real rendering
      input += template.content_tag :span, class: 'input-group-addon' do
        template.content_tag :i, '', class: 'glyphicon glyphicon-calendar', data: { 'time-icon' => 'icon-time', 'date-icon' => 'icon-calendar' }
      end
      input
    end
  end
end