require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :title => "Title",
        :original_artist => "Original Artist",
        :aka => "Aka",
        :georgie_main => false,
        :chris_main => false,
        :backing_vocals => false,
        :lead_guitar => false,
        :key => "Key",
        :genre => "Genre",
        :speed => "Speed",
        :notes => "MyText"
      ),
      Song.create!(
        :title => "Title",
        :original_artist => "Original Artist",
        :aka => "Aka",
        :georgie_main => false,
        :chris_main => false,
        :backing_vocals => false,
        :lead_guitar => false,
        :key => "Key",
        :genre => "Genre",
        :speed => "Speed",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Original Artist".to_s, :count => 2
    assert_select "tr>td", :text => "Aka".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
    assert_select "tr>td", :text => "Speed".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
