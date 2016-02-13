require 'rails_helper'

RSpec.describe MediaItem, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:link) }

  it "is private by default" do
    expect(MediaItem.new).to be_private
  end
end
