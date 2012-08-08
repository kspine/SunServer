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

describe ApksController do

  # This should return the minimal set of attributes required to create a valid
  # Apk. As you add validations to Apk, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ApksController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all apks as @apks" do
      apk = Apk.create! valid_attributes
      get :index, {}, valid_session
      assigns(:apks).should eq([apk])
    end
  end

  describe "GET show" do
    it "assigns the requested apk as @apk" do
      apk = Apk.create! valid_attributes
      get :show, {:id => apk.to_param}, valid_session
      assigns(:apk).should eq(apk)
    end
  end

  describe "GET new" do
    it "assigns a new apk as @apk" do
      get :new, {}, valid_session
      assigns(:apk).should be_a_new(Apk)
    end
  end

  describe "GET edit" do
    it "assigns the requested apk as @apk" do
      apk = Apk.create! valid_attributes
      get :edit, {:id => apk.to_param}, valid_session
      assigns(:apk).should eq(apk)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Apk" do
        expect {
          post :create, {:apk => valid_attributes}, valid_session
        }.to change(Apk, :count).by(1)
      end

      it "assigns a newly created apk as @apk" do
        post :create, {:apk => valid_attributes}, valid_session
        assigns(:apk).should be_a(Apk)
        assigns(:apk).should be_persisted
      end

      it "redirects to the created apk" do
        post :create, {:apk => valid_attributes}, valid_session
        response.should redirect_to(Apk.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved apk as @apk" do
        # Trigger the behavior that occurs when invalid params are submitted
        Apk.any_instance.stub(:save).and_return(false)
        post :create, {:apk => {}}, valid_session
        assigns(:apk).should be_a_new(Apk)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Apk.any_instance.stub(:save).and_return(false)
        post :create, {:apk => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested apk" do
        apk = Apk.create! valid_attributes
        # Assuming there are no other apks in the database, this
        # specifies that the Apk created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Apk.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => apk.to_param, :apk => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested apk as @apk" do
        apk = Apk.create! valid_attributes
        put :update, {:id => apk.to_param, :apk => valid_attributes}, valid_session
        assigns(:apk).should eq(apk)
      end

      it "redirects to the apk" do
        apk = Apk.create! valid_attributes
        put :update, {:id => apk.to_param, :apk => valid_attributes}, valid_session
        response.should redirect_to(apk)
      end
    end

    describe "with invalid params" do
      it "assigns the apk as @apk" do
        apk = Apk.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Apk.any_instance.stub(:save).and_return(false)
        put :update, {:id => apk.to_param, :apk => {}}, valid_session
        assigns(:apk).should eq(apk)
      end

      it "re-renders the 'edit' template" do
        apk = Apk.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Apk.any_instance.stub(:save).and_return(false)
        put :update, {:id => apk.to_param, :apk => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested apk" do
      apk = Apk.create! valid_attributes
      expect {
        delete :destroy, {:id => apk.to_param}, valid_session
      }.to change(Apk, :count).by(-1)
    end

    it "redirects to the apks list" do
      apk = Apk.create! valid_attributes
      delete :destroy, {:id => apk.to_param}, valid_session
      response.should redirect_to(apks_url)
    end
  end

end
