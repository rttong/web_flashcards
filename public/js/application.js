$(document).ready(function() {
  $('.card1').first().show();
  $('.guess').on("submit", function(e){
    e.preventDefault();
    var request = $(this).serialize();
    $.ajax({
      url: $(this).attr('action'),
      method: 'post',
      data: request
    })
    .done(function(response) {
      // console.log($('.card' + response.cardId));
      console.log(response.cardId);
      $('.card' + response.cardId).remove();
      $('.card' + response.nextCard).show();
      console.log($(this));
      console.log(response);
    });
    // console.log($(this).attr('action'));
  });
 });
