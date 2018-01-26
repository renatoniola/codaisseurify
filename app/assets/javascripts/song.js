function submitSong(event) {
  event.preventDefault();
  const formData = $("#new_song").serializeArray();
  console.log(formData);
  console.log(formData[2].value);

  $.ajax(
    {
      type : 'POST',
      url : `/api/artists/${formData[2].value}/songs`,
      data : JSON.stringify({
          title : formData[3].value
      }),
      contentType: "application/json",
      dataType: "json"
    }
  ).done(function(data){
      console.log(data);
      let songLi = $('<li></li>');
      songLi.append(data.title);
      $('#song-list').append(songLi);
  })
  .fail(function(err){
     console.log(err);
  })
}

function deleteSong(event) {
  event.preventDefault();

}

$(document).ready(function() {

  $("#new_song").bind('submit', submitSong);

  $("#delete-song").click(function(e){
    con
    e.preventDefault();
    console.log('yes delted');
  });
});
