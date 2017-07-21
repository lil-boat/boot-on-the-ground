
$(document).ready(function() {
  addkudosEventListener();
  addListenerToNewPostForm();
  addkudosCommentEventListener();
  postCommentEventListener();
  addCommentEventListener();

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
  $("#new-post-form").on('submit', '#new_post', function(e){
    console.log('INSIDE $("#new-post-form").submit')
    e.preventDefault();
    newPostAjaxCall();
  })
}

var newPostAjaxCall = function(){
  console.log('INSIDE newPostAjaxCall')
  var request = $.ajax({
    url: $("#new_post").attr("action"),
    method: $("#new_post").attr("method"),
    data: $("#new_post").serialize()
  });
  request.done(function(response){
    console.log('INSIDE newPostAjaxCall request.done')

    $('.post-field').prepend(response)
    $('#new_post')[0].reset()
  })

}

//jquery for comment form to slide in

var postCommentEventListener = function(){
  $(".message-board-container").on("click", ".comment-button", function(){
    var clickedComment = $(this).parent().siblings().last().find(".comment-form-container")
    clickedComment.slideDown();
  })
}

// Ajax new comment under post

var addCommentEventListener = function(){
  $(".message-board-container").on("submit", ".new_comment", function(e){
    e.preventDefault();
    var commentForm = $(this).closest(".comment-container")
    console.log(commentForm.find("#new_comment"))

    newCommentAjaxCall(commentForm);
  })
}

var newCommentAjaxCall = function(commentForm){
  var newCommentForm = commentForm.find("#new_comment") 
  console.log($("#new_comment").serialize())
  var request = $.ajax({
    url: newCommentForm.attr("action"),
    method: newCommentForm.attr("method"),
    data: newCommentForm.serialize()
  });

  request.done(function(response){
    console.log("we got a response")
    console.log(response)
    $(commentForm).append(response);
    $(".new_comment").each(function(){
      this.reset();
    });
    $(".comment-form-container").slideUp();

  })
}
