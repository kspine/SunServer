require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TagBundlesController do

  # This should return the minimal set of attributes required to create a valid
  # TagBundle. As you add validations to TagBundle, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TagBundlesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all tag_bundles as @tag_bundles" do
      tag_bundle = TagBundle.create! valid_attributes
      get :index, {}, valid_session
      assigns(:tag_bundles).should eq([tag_bundle])
    end
  end

  describe "GET show" do
    it "assigns the requested tag_bundle as @tag_bundle" do
      tag_bundle = TagBundle.create! valid_attributes
      get :show, {:id => tag_bundle.to_param}, valid_session
      assigns(:tag_bundle).should eq(tag_bundle)
    end
  end

  describe "GET new" do
    it "assigns a new tag_bundle as @tag_bundle" do
      get :new, {}, valid_session
      assigns(:tag_bundle).should be_a_new(TagBundle)
    end
  end

  describe "GET edit" do
    it "assigns the requested tag_bundle as @tag_bundle" do
      tag_bundle = TagBundle.create! valid_attributes
      get :edit, {:id => tag_bundle.to_param}, valid_session
      assigns(:tag_bundle).should eq(tag_bundle)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TagBundle" do
        expect {
          post :create, {:tag_bundle => valid_attributes}, valid_session
        }.to change(TagBundle, :count).by(1)
      end

      it "assigns a newly created tag_bundle as @tag_bundle" do
        post :create, {:tag_bundle => valid_attributes}, valid_session
        assigns(:tag_bundle).should be_a(TagBundle)
        assigns(:tag_bundle).should be_persisted
      end

      it "redirects to the created tag_bundle" do
        post :create, {:tag_bundle => valid_attributes}, valid_session
        response.should redirect_to(TagBundle.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tag_bundle as @tag_bundle" do
        # Trigger the behavior that occurs when invalid params are submitted
        TagBundle.any_instance.stub(:save).and_return(false)
        post :create, {:tag_bundle => {}}, valid_session
        assigns(:tag_bundle).should be_a_new(TagBundle)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TagBundle.any_instance.stub(:save).and_return(false)
        post :create, {:tag_bundle => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tag_bundle" do
        tag_bundle = TagBundle.create! valid_attributes
        # Assuming there are no other tag_bundles in the database, this
        # specifies that the TagBundle created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TagBundle.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => tag_bundle.to_param, :tag_bundle => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested tag_bundle as @tag_bundle" do
        tag_bundle = TagBundle.create! valid_attributes
        put :update, {:id => tag_bundle.to_param, :tag_bundle => valid_attributes}, valid_session
        assigns(:tag_bundle).should eq(tag_bundle)
      end

      it "redirects to the tag_bundle" do
        tag_bundle = TagBundle.create! valid_attributes
        put :update, {:id => tag_bundle.to_param, :tag_bundle => valid_attributes}, valid_session
        response.should redirect_to(tag_bundle)
      end
    end

    describe "with invalid params" do
      it "assigns the tag_bundle as @tag_bundle" do
        tag_bundle = TagBundle.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TagBundle.any_instance.stub(:save).and_return(false)
        put :update, {:id => tag_bundle.to_param, :tag_bundle => {}}, valid_session
        assigns(:tag_bundle).should eq(tag_bundle)
      end

      it "re-renders the 'edit' template" do
        tag_bundle = TagBundle.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TagBundle.any_instance.stub(:save).and_return(false)
        put :update, {:id => tag_bundle.to_param, :tag_bundle => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tag_bundle" do
      tag_bundle = TagBundle.create! valid_attributes
      expect {
        delete :destroy, {:id => tag_bundle.to_param}, valid_session
      }.to change(TagBundle, :count).by(-1)
    end

    it "redirects to the tag_bundles list" do
      tag_bundle = TagBundle.create! valid_attributes
      delete :destroy, {:id => tag_bundle.to_param}, valid_session
      response.should redirect_to(tag_bundles_url)
    end
  end

end
