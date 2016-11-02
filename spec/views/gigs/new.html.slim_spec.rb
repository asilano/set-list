require 'rails_helper'

RSpec.describe "gigs/new", type: :view do
  before(:each) do
    assign(:gig, Gig.new(
      :name => "MyString"
    ))
  end

  it "renders new gig form" do
    render

    assert_select "form[action=?][method=?]", gigs_path, "post" do

      assert_select "input#gig_name[name=?]", "gig[name]"
    end
  end
end
