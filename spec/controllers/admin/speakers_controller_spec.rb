require 'spec_helper'

describe Admin::SpeakersController do

  # This should return the minimal set of attributes required to create a valid
  # Speaker. As you add validations to Admin::Speaker, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => "John Doe",
      :event_id => 1
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpeakersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all admin_speakers as @admin_speakers" do
      speaker = Speaker.create! valid_attributes
      get :index, {}, valid_session
      assigns(:admin_speakers).should eq([speaker])
    end
  end

  describe "GET show" do
    it "assigns the requested admin_speaker as @admin_speaker" do
      speaker = Speaker.create! valid_attributes
      get :show, {:id => speaker.to_param}, valid_session
      assigns(:admin_speaker).should eq(speaker)
    end
  end

  describe "GET new" do
    it "assigns a new admin_speaker as @admin_speaker" do
      get :new, {}, valid_session
      assigns(:admin_speaker).should be_a_new(Speaker)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_speaker as @admin_speaker" do
      speaker = Speaker.create! valid_attributes
      get :edit, {:id => speaker.to_param}, valid_session
      assigns(:admin_speaker).should eq(speaker)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Speaker" do
        expect {
          post :create, {:admin_speaker => valid_attributes}, valid_session
        }.to change(Speaker, :count).by(1)
      end

      it "assigns a newly created admin_speaker as @admin_speaker" do
        post :create, {:admin_speaker => valid_attributes}, valid_session
        assigns(:admin_speaker).should be_a(Speaker)
        assigns(:admin_speaker).should be_persisted
      end

      it "redirects to the created admin_speaker" do
        post :create, {:admin_speaker => valid_attributes}, valid_session
        response.should redirect_to(Speaker.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_speaker as @admin_speaker" do
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        post :create, {:admin_speaker => {}}, valid_session
        assigns(:admin_speaker).should be_a_new(Speaker)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        post :create, {:admin_speaker => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_speaker" do
        speaker = Speaker.create! valid_attributes
        # Assuming there are no other admin_speakers in the database, this
        # specifies that the Speaker created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Speaker.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => speaker.to_param, :admin_speaker => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested admin_speaker as @admin_speaker" do
        speaker = Speaker.create! valid_attributes
        put :update, {:id => speaker.to_param, :admin_speaker => valid_attributes}, valid_session
        assigns(:admin_speaker).should eq(speaker)
      end

      it "redirects to the admin_speaker" do
        speaker = Speaker.create! valid_attributes
        put :update, {:id => speaker.to_param, :admin_speaker => valid_attributes}, valid_session
        response.should redirect_to(speaker)
      end
    end

    describe "with invalid params" do
      it "assigns the admin_speaker as @admin_speaker" do
        speaker = Speaker.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        put :update, {:id => speaker.to_param, :admin_speaker => {}}, valid_session
        assigns(:admin_speaker).should eq(speaker)
      end

      it "re-renders the 'edit' template" do
        speaker = Speaker.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        put :update, {:id => speaker.to_param, :admin_speaker => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_speaker" do
      speaker = Speaker.create! valid_attributes
      expect {
        delete :destroy, {:id => speaker.to_param}, valid_session
      }.to change(Speaker, :count).by(-1)
    end

    it "redirects to the admin_speakers list" do
      speaker = Speaker.create! valid_attributes
      delete :destroy, {:id => speaker.to_param}, valid_session
      response.should redirect_to(admin_speakers_url)
    end
  end

end
