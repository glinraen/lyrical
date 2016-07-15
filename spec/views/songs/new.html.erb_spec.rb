require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      :title => "MyString",
      :lyrics => "MyString",
      :origin => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input#song_title[name=?]", "song[title]"

      assert_select "input#song_lyrics[name=?]", "song[lyrics]"

      assert_select "input#song_origin[name=?]", "song[origin]"

      assert_select "input#song_image[name=?]", "song[image]"
    end
  end
end
