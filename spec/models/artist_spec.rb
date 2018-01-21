require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe 'validations' do

      let(:nofx) { build :artist, name: "" }

      it 'is invalid without a name' do
        nofx.valid?
        expect(nofx.errors).to have_key(:name)
      end
  end

end
