require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
