$(function() {
  $('button.reply').click(function() {
    $(this).parent().siblings('.reply-form').slideToggle();
  });
});