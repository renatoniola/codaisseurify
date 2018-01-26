require 'rails_helper'

feature 'song tests', js: true do
  scenario 'add a new song' do
    # Point your browser towards the todo path
    visit api_artist_song_path(4)

    # Enter description in the text field
    fill_in 'song[title]', with: 'newsonginserted'
    #find("input[id$='title']").set "Vostro 2017"
    #fill_in 'song[artist_id]', with: '1'
    #first('input#id.class', visible: false).set("1")

    # Press enter (to submit the form)
    #page.execute_script('$("#new_song").bind("submit", submitSong)')

    # Expect the new task to be displayed in the list of tasks
    expect(page).to have_content('new song inserted')
  end
end
