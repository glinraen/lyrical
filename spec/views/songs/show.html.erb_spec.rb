require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "Title",
      :lyrics => "Lyrics",
      :origin => "Origin",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Lyrics/)
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Image/)
  end
end
