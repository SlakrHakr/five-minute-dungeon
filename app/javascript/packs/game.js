function onUpdateGameSuccess(response) {
  console.log(response);
}

function onUpdateGameError(response) {
  console.log("ERROR: " + response);
}

function updateGame(selected) {
  $.ajax({
    url: '/games/' + $("body").data('game') + '.js',
    type: 'PUT',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { selected: selected },
    success: function(response) {
      onUpdateGameSuccess(response);
    },
    error: function(response) {
      onUpdateGameError(response);
    }
  });
}

document.addEventListener("turbolinks:load", function() {
  if ($("body").data('game') !== undefined) {
    $( ".hero .hand .card" ).click(function() {
      console.log('card in hand selected: ' + $(this).data("id"));
      updateGame($(this).data("id"));
    });

    $( ".hero .special-ability" ).click(function() {
      console.log('special ability selected: ' + $(this).data("id"));
      updateGame($(this).data("id"));
    });
  }
})
