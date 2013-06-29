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
      if ($('.card').length !== 0) {
        $('.card').first().remove();
        $('.card').first().show();
        $('.correct').text('Correct: ' + response.correct);
        $('.incorrect').text('Incorrect: ' + response.incorrect);
        var percent = Math.round(((response.correct / (response.correct + response.incorrect)) * 100));
        $('.percent').text('Percent: ' + percent + '%');
        console.log(response.incorrect);
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
