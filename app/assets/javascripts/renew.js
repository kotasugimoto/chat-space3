function auto_insert(data) {

  for (var i = 0; i < data.messages.length; i++) {

    var appended_html = "<div class = 'chat-message__header clearfix'>\
    <p class = 'chat-message__name'>"+data.name+"</p>\
    <p class = 'chat-message__time'>"+data.messages[i].created_at+"</p></div>\
    <p class = 'chat-message__body'>"+data.messages[i].body+"</p>"

    if (data.messages[i].image.url != null) {

      $('.chat-message').append(appended_html, '<img class = "chat-message__image" src=' + data.messages[i].image.url + '>');

    } else {

      $('.chat-message').append(appended_html);

    };

  };

};

$(function(){
    setInterval(function(){

      $.ajax({
        url: 'messages.json',
        type: 'GET',
        dataType: 'json',
      })
      .done(function(data) {
        $('.chat-message').empty();
        auto_insert(data);
      })
      .fail(function() {
        console.log("error");
      });

    },3000);
});
