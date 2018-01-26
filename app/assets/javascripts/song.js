function submitSong(e) {
  e.preventDefault();
  const formData = $("#new_song").serializeArray();


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

function deleteSong(e) {
   e.preventDefault();

   const artistId = e.currentTarget.attributes[0].value;
   const songId = e.currentTarget.attributes[1].value;
  $.ajax(
    {
      type : 'DELETE',
      url : `/api/artists/${artistId}/songs/${songId}`,
      contentType: "application/json",
      dataType: "json"
    }
  ).done( response => {
     console.log(response);
  })
}

$(document).ready(function() {

  $("#new_song").bind('submit', submitSong);

  $(".delete-song").click(deleteSong);
});
