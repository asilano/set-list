require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      :title => "MyText"
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "textarea#song_title[name=?]", "song[title]"
    end
  end
end
