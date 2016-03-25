$(document).on('click', '.guide-card-container', function(e) {
  e.stopPropagation();
})

$(document).on('click', '.modal-profile', function() {
  $('.modal-profile').removeClass('is-active')
})
