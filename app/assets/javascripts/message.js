function insert_html(data) {

  var html = "<div class = 'chat-message__header clearfix'>\
  <p class = 'chat-message__name'>"+data.name+"</p>\
  <p class = 'chat-message__time'>"+data.date+"</p></div>\
  <p class = 'chat-message__body'>"+data.body+"</p>"

  var image = "<img src=" + data.image + ">"

  if (data.image != null) {

    $('.chat-message').append(html,'<img class = "chat-message__image" src = ' + data.image +'>');

  } else {

    $('.chat-message').append(html);

  };
};

$(function(){
  $('#new_message').on('submit', function(e){
    e.preventDefault();

    var form = $(this);
    var group_id = form.prop('action');
    var formdata = new FormData($('#new_message').get(0));

    $.ajax({
      url: group_id + '.json',
      type: 'POST',
      dataType: 'json',
      data: formdata,
      cache       : false,
      contentType : false,
      processData : false,
    })
    .done(function(data) {
      insert_html(data);
    })
    .fail(function() {
      console.log(data);
    });
  });
});
