require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :title => "Title",
        :lyrics => "Lyrics",
        :origin => "Origin",
        :image => "Image"
      ),
      Song.create!(
        :title => "Title",
        :lyrics => "Lyrics",
        :origin => "Origin",
        :image => "Image"
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Lyrics".to_s, :count => 2
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
