$(document).ready(function() {
  $('.game div:nth-child(1)').show();
  $('.guess').on("submit", function(e){
    e.preventDefault();
    var request = $(this).serialize();
    $.ajax({
      url: $(this).attr('action'),
      method: 'post',
      data: request
    })
    .done(function(response) {
      console.log(response.cardId);
      if ($('.card').length === 1) {
        $('.card').first().remove();
        $('.card').first().show();
        console.log("LAST CARD");
      } else {
        $('.card').first().remove();
        $('.card').first().show();
      }
      console.log($(this));
      console.log(response);
    });
  });
 });
