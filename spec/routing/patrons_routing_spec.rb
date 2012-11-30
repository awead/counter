require "spec_helper"

describe PatronsController do
  describe "routing" do

    it "patron list" do
      get("/patrons").should route_to("patrons#index")
    end

    it "checkin form" do
      get("/checkin").should route_to("patrons#checkin")
    end

    it "checking in patron" do
      post("/patrons").should route_to("patrons#create")
    end

    it "home page" do
      get("/").should route_to("patrons#checkin")
    end 

  end
end
