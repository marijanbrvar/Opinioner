require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Like Association tests' do
    it 'User has many likes' do
      assc = User.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end

    it 'Opinion has many likes' do
      assc = Opinion.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end

    it 'Like belongs to' do
      assc = Like.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'Like belongs to' do
      assc = Like.reflect_on_association(:opinion)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
