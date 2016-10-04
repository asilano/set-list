require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Original Artist/)
    expect(rendered).to match(/Aka/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/Speed/)
    expect(rendered).to match(/MyText/)
  end
end
