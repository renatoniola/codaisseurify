require 'rails_helper'

RSpec.describe Song, type: :model do

  describe 'validations' do

      let(:song1) { build :song, title: "" }

      it 'is invalid without a name' do
        song1.valid?
        expect(song1.errors).to have_key(:title)
      end
  end

end
