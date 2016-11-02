require 'rails_helper'

RSpec.describe "gigs/index", type: :view do
  before(:each) do
    assign(:gigs, [
      Gig.create!(
        :name => "Name"
      ),
      Gig.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of gigs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
