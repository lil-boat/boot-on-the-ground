
$(document).ready(function() {
  $(".comment-form-container").hide();
  addkudosEventListener();
  addListenerToNewPostForm();
  addkudosCommentEventListener();
  postCommentEventListener();
});

// Add Kudos to Post
var addkudosEventListener = function(){
  $(".message-board-container").on("click", ".post-kudos-vote", function(event){
    var clickedKudos = $(this)
    kudosAjaxCall(clickedKudos);
  });
}
var kudosAjaxCall = function(clickedKudos){
  postId = clickedKudos.closest(".post-container").attr('id')

  var request = $.ajax({
    url: "/posts/" + postId +"/likes",
    method: "POST"
  });
  request.done(function(response){
    clickedKudos.text("Kudos " + response.like_count)
  });
}
// Add Kudos to Comment
var addkudosCommentEventListener = function(){
  $(".message-board-container").on("click", ".comment-kudos-vote", function(event){
    var clickedCommentKudos = $(this)
    kudosCommentAjaxCall(clickedCommentKudos);
  });
}

var kudosCommentAjaxCall = function(clickedCommentKudos){
  commentId = clickedCommentKudos.closest(".individual-comment-container").attr('id')

  var request = $.ajax({
    url: "/comments/" + commentId + "/likes",
    method: "POST"
  });
  request.done(function(response){
    clickedCommentKudos.text("Kudos " + response.like_count)
  })
}

// Add New Post
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
    $('.post-field').prepend(response)
    $('#new_post')[0].reset()
  })

}

//Add comment on post

var postCommentEventListener = function(){
  $(".message-board-container").on("click", ".comment-button", function(){
    console.log("clicked comment")
    $(".comment-form-container").slideDown();
  })
  
}