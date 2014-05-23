# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:send', 'form#new_event', (evt) ->
  $(this).find('fieldset').prop('disabled', true)
  $(this).find('input[type="submit"]').button('loading')


$(document).on 'ajax:complete', 'form#new_event', (evt) ->
  $(this).find('fieldset').prop('disabled', false)
  $(this).find('input[type="submit"]').button('reset')