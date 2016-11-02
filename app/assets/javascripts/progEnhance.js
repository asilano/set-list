$(document).on('turbolinks:load', function () {
  if (Modernizr.inputtypes.date)
  {
    $('.old-date').remove();
    $('.new-date').show().removeAttr('disabled');
  }
});
