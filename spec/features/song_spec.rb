require 'rails_helper'

feature 'song tests', js: true do
  let(:artist1) { create :artist, name: 'metallica' }

  let!(:song1) { create :song, title: 'song test1', artist: artist1 }
  let!(:song2) { create :song, title: 'song test2', artist: artist1 }
  let!(:song3) { create :song, title: 'song test3', artist: artist1 }

  it ' should have metallica in page' do
    visit artist_path(artist1)

    expect(page).to have_content('metallica')
  end

  it ' should saves the song' do
    visit artist_path(artist1)

    fill_in 'title', with: 'new song inserted'

    click_on('save song')

    # expect(page).to have_text('new song inserted')
    expect(page).to have_content('new song inserted')
  end

  it ' should delete all songs' do
    visit artist_path(artist1)

    click_on('delete_all_songs')

    expect(page).to have_no_text(['song test1', 'song test2', 'song test3'])
  end

  it ' should delete one song' do
    visit artist_path(artist1)

    sleep(5)
    page.find('#song-list > div:first-child > .col-xs-5 > button').click
    sleep(5)

    expect(page).to have_no_text('song test1')
  end
end
