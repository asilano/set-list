require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      :title => "MyString",
      :original_artist => "MyString",
      :aka => "MyString",
      :georgie_main => false,
      :chris_main => false,
      :backing_vocals => false,
      :lead_guitar => false,
      :key => "MyString",
      :genre => "MyString",
      :speed => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input#song_title[name=?]", "song[title]"

      assert_select "input#song_original_artist[name=?]", "song[original_artist]"

      assert_select "input#song_aka[name=?]", "song[aka]"

      assert_select "input#song_georgie_main[name=?]", "song[georgie_main]"

      assert_select "input#song_chris_main[name=?]", "song[chris_main]"

      assert_select "input#song_backing_vocals[name=?]", "song[backing_vocals]"

      assert_select "input#song_lead_guitar[name=?]", "song[lead_guitar]"

      assert_select "input#song_key[name=?]", "song[key]"

      assert_select "input#song_genre[name=?]", "song[genre]"

      assert_select "input#song_speed[name=?]", "song[speed]"

      assert_select "textarea#song_notes[name=?]", "song[notes]"
    end
  end
end
