
require 'rails_helper'

describe 'artist page shows his song but not others' do

  let(:artist1) { create :artist, name: 'metallica' }
  let(:artist2) { create :artist, name: 'metallica' }

  let!(:song1) { create :song, title: 'song test1', artist: artist1 }
  let!(:song2) { create :song, title: 'song test2', artist: artist1 }
  let!(:song3) { create :song, title: 'song test3', artist: artist2 }

  it ' shows all the songs from artist' do
    visit artist_url(artist1)

    expect(page).to have_text('song test1')
    expect(page).to have_text('song test2')
  end

  it 'does not show other artist song' do
    visit artist_url(artist1)

    expect(page).not_to have_text('song test3')
  end


end
