require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe 'validations' do

      let(:nofx) { build :artist, name: "" }

      it 'is invalid without a name' do
        nofx.valid?
        expect(nofx.errors).to have_key(:name)
      end
  end

  describe "association with song" do
    let(:artist) { create :artist }
    let!(:song) { create :song, artist: artist }

    it "has many songs" do
      song1 = artist.songs.new(title: "Wonderful")
      song2 = artist.songs.new(title: "Extraordinary")

      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)
    end

    it "deletes associated songs" do
      expect { artist.destroy }.to change(Song, :count).by(-1)
    end
  end

end
