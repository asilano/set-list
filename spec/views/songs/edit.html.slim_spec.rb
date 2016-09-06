require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "MyText"
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "textarea#song_title[name=?]", "song[title]"
    end
  end
end
