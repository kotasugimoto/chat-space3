$(function(){
  $('#user-search-result').on('click', '.chat-group-user__btn--add', function(e){
    e.preventDefault();
    $(this).parent().remove();
    var user_name = $(this).data('user_name');
    var user_id = $(this).data('user_id');
    console.log(user_name)
    $('#chat-group-users').append("<div class= 'chat-group-user clearfix'><input multiple='multiple' type='hidden' name='group[user_ids][]', value="+ user_id + ">\
      <p class='chat-group-user__name'>"+ user_name +"</p>\
      <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove', data-user-id="+ user_id +">削除</a></div>");
  });
});


$(function(){
  $('#chat-group-users').on('click',".chat-group-user__btn--remove", function(e) {
    e.preventDefault();
    parent = $(this).parent();
    $(parent).remove();
    console.log(this);
  });
});

function List(data){
  $("#user-search-result").children().remove();
  console.log(data)
  var list = ('#user-search-result')
  for (var i = 0; i < data.length; i++) {
    $(list).append('<div class = "chat-group-user clearfix"><p class="chat-group-user__name">' + data[i].name + '</p>\
      <a class = "user-search-add chat-group-user__btn chat-group-user__btn--add" \
      data-user_id = "' + data[i].id + '"\
      data-user_name = "' + data[i].name + '">追加</a></div>')
  }
}

$(function(){
  $('.chat-group-form__input').on('keyup', function(){

    var input = $(this).val();
    var preWord;

    if(input !== preWord) {
      $.ajax({
        url: 'http://localhost:3000/users.json',
        type: 'GET',
        dataType: 'json',
        data: { name: input
        }
      })
      .done(function(data) {
        List(data)
      })
      .fail(function() {
        console.log("error");
      });
    };
    preWord = input;
  });
});
