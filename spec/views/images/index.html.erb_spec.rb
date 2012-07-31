require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :title => "Title",
        :intro => "Intro",
        :gallery_activity_id => 1
      ),
      stub_model(Image,
        :title => "Title",
        :intro => "Intro",
        :gallery_activity_id => 1
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Intro".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
