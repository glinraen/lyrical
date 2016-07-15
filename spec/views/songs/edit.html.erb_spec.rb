require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "MyString",
      :lyrics => "MyString",
      :origin => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input#song_title[name=?]", "song[title]"

      assert_select "input#song_lyrics[name=?]", "song[lyrics]"

      assert_select "input#song_origin[name=?]", "song[origin]"

      assert_select "input#song_image[name=?]", "song[image]"
    end
  end
end
