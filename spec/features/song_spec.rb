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

    fill_in 'song_title', with: "new song inserted"

    click_on('submit')


    expect(page).to have_text('new song inserted')


  end

  it ' should delete the song' do

    visit artist_path(artist1)

    fill_in 'song_title', with: "new song inserted"

    click_on('submit')


    expect(page).to have_text('new song inserted')


  end



end
