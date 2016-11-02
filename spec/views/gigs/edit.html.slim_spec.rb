require 'rails_helper'

RSpec.describe "gigs/edit", type: :view do
  before(:each) do
    @gig = assign(:gig, Gig.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit gig form" do
    render

    assert_select "form[action=?][method=?]", gig_path(@gig), "post" do

      assert_select "input#gig_name[name=?]", "gig[name]"
    end
  end
end
