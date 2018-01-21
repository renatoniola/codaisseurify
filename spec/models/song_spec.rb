require 'rails_helper'

RSpec.describe Song, type: :model do

  describe 'validations' do

      let(:song1) { build :song, title: "" }

      it 'is invalid without a name' do
        song1.valid?
        expect(song1.errors).to have_key(:title)
      end
  end


  describe "association with artist" do
    let(:artist) { create :artist }

    it "belongs to a artist" do
      #room = user.rooms.build(home_type: "Shared")
      song = artist.songs.build(title: "song test" )
      expect(song.artist).to eq(artist)
    end


  end

end
