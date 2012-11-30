require 'spec_helper'

describe PatronsController do

  # This should return the minimal set of attributes required to create a valid
  # Patron. As you add validations to Patron, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { 
      "barcode" => "41111111111111"
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PatronsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all patrons as @patrons" do
      patron = Patron.create! valid_attributes
      get :index, {}, valid_session
      assigns(:patrons).should eq([patron])
    end

    it "returns csv" do
      get :index, :format => :csv
      response.should be_success
    end
  end

  describe "GET checkin" do
    it "assigns a new patron as @patron" do
      get :checkin, {}, valid_session
      assigns(:patron).should be_a_new(Patron)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Patron" do
        expect {
          post :create, {:patron => valid_attributes}, valid_session
        }.to change(Patron, :count).by(1)
      end

      it "assigns a newly created patron as @patron" do
        post :create, {:patron => valid_attributes}, valid_session
        assigns(:patron).should be_a(Patron)
        assigns(:patron).should be_persisted
      end

      it "redirects to checkin" do
        post :create, {:patron => valid_attributes}, valid_session
        response.should redirect_to(checkin_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patron as @patron" do
        # Trigger the behavior that occurs when invalid params are submitted
        Patron.any_instance.stub(:save).and_return(false)
        post :create, {:patron => { "barcode" => "invalid value" }}, valid_session
        assigns(:patron).should be_a_new(Patron)
      end
    end
  end
  
end
