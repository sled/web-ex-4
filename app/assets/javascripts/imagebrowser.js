$(document).ready(function() {

  $(document).on('ajax:before', '#image-search-form', function(evt, data, status, xhr) {
    $(this).find('input[type="submit"]').button('loading');
  });

  $(document).on('ajax:complete', '#image-search-form', function(evt, data, status, xhr) {
    $(this).find('input[type="submit"]').button('reset');
  });

  $(document).on('ajax:success', '#image-search-form', function(evt, data, status, xhr) {
    $(this).find('#image-search-results').html(data);
  });

  $(document).on('ajax:success', '[data-behaviour="openimagebrowser"]', function(evt, data, status, xhr) {
    var input = $(this).find(':input');
    var image = $(this).find('img');

    var dialog = bootbox.dialog({
      closeButton: true,
      title: 'Search Flickr',
      className: 'image-search-dialog',
      message: data
    });

    dialog.on('shown.bs.modal', function() { 
      $('#image-search-form').on('click', '#image-search-results li', function(evt) {
        input.val($(this).data('photo-id'));
        image.prop('src', $(this).find('img.flickr').prop('src'));
        dialog.modal('hide');
      });
    });
  });
});