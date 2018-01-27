function submitSong(e) {
  e.preventDefault();
  const formData = $("#new_song").serializeArray();
  //$('h1').append('yes ! it gets cklick');

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

      let deleteBtn = $(`<button data-artist-id='${data.song.artist_id}' data-song-id='${data.song.id}' placeholder="insert song" class="delete-song btn btn-primary btn-xs">delete song</button>`)

      let songLi = $(`<li>${data.song.title}</li>`);
      songLi.append(deleteBtn);
      $(deleteBtn).click(deleteSong);
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
     console.log($(this).parent().remove());
  })
}

$(document).ready(function() {

  $("#new_song").bind('submit', submitSong);

  $(".delete-song").click(deleteSong);
});
