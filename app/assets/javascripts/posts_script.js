
$(document).ready(function() {
  addkudosEventListener();
  addListenerToNewPostForm();
  console.log("hi");
});

var addkudosEventListener = function(){
  $(".message-board-container").on("click", ".post-kudos-vote", function(event){
    console.log("is this on??");
    var clickedKudos = $(this)
    kudosAjaxCall(clickedKudos);
  });
}

var kudosAjaxCall = function(clickedKudos){
  postId = clickedKudos.closest(".post-container").attr('id')

  var request = $.ajax({
    url: "/posts/" + postId +"/likes",
    method: "POST",


  });

  request.done(function(response){
    console.log("we got a response")
    clickedKudos.text("Kudos " + response.like_count)
    console.log(response)
  });
}


var addListenerToNewPostForm = function(){
  $("#new-post-form").submit(function(e){
    e.preventDefault(); 
    var formContainer = $(this); 
    newPostAjaxCall();
  })
  
}

var newPostAjaxCall = function(){ 
  var request = $.ajax({
    url: $("#new_post").attr("action"),
    method: $("#new_post").attr("method"),
    data: $("#new_post").serialize()
  }); 

  request.done(function(response){ 
    console.log(response);
    $('.post-field').prepend(response)
    $('#new_post')[0].reset()
  })

}