require 'rails_helper'

RSpec.describe "gigs/show", type: :view do
  before(:each) do
    @gig = assign(:gig, Gig.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
