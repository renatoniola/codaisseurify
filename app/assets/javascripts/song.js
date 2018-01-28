function submitSong(e) {
  e.preventDefault();
  let formData = $("#new_song").serializeArray();
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

      let deleteBtn = `<button data-artist-id='${data.song.artist_id}' data-song-id='${data.song.id}' placeholder="insert song" class="delete-song btn btn-primary btn-xs">Delete song</button>`;

      let songLi = $(`<div class="row"><div class="col-xs-7">${data.song.title}</div><div class="col-xs-5">${deleteBtn}</div></div>`);

      $('#song-list').append(songLi);
      $(".delete-song").click(deleteSong);
      $("#song_title").val("");
  })
  .fail(function(err){
     console.log(err);
  })
}

function deleteSong(e) {
   e.preventDefault();

   let artistId = e.currentTarget.attributes[0].value;
   let songId = e.currentTarget.attributes[1].value;
  $.ajax(
    {
      type : 'DELETE',
      url : `/api/artists/${artistId}/songs/${songId}`,
      contentType: "application/json",
      dataType: "json"
    }
  ).done( response => {
     console.log(response);
     console.log($(this).parent().parent().remove());
  })
}

function deleteAllSongs(e) {
   e.preventDefault();

   let artistId = e.currentTarget.attributes[0].value;

  $.ajax(
    {
      type : 'DELETE',
      url : `/api/artists/${artistId}/songs/delete_all`,
      contentType: "application/json",
      dataType: "json"
    }
  ).done( response => {
     console.log(response);
     $('#song-list').empty();
  })
}

$(document).ready(function() {

  $("#new_song").bind('submit', submitSong);

  $(".delete-song").click(deleteSong);
  $("#delete_all_songs").click(deleteAllSongs);
});
