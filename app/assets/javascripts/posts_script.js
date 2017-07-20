
$(document).ready(function() {
  addkudosEventListener();
  console.log("hi");
});

var addkudosEventListener = function(){
  $(".message-board-container").on("click", ".kudos-vote", function(event){
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
