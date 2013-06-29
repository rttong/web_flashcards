$(document).ready(function() {
  var counter = 0;
  var length = $('.card').length;
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
      if ($('.card').length !== 0) {
        $('.card').first().remove();
        $('.card').first().show();
        counter++
      }
      if (counter === length) {
        $('.game').append('<h1>FUCK YOU</h1>');
      }
      console.log($(this));
      console.log(response);
    });
  });
 });
