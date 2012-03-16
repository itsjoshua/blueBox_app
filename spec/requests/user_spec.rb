require 'spec_helper'

describe "UserSpecs" do

	describe "sign in/out" do

		describe "failure" do
		  it "should not sign a trainer in" do
		    visit new_user_session_path
		    fill_in :email,    :with => ""
		    fill_in :password, :with => ""
		    click_button
		    controller.should_not be_signed_in
		  end
		end

		describe "success" do
			it "should sign a trainer in and out" do
				user1 = Factory(:user)
				integration_sign_in(user1)
				controller.should be_signed_in
				click_link "Sign out"
				controller.should_not be_signed_in
			end
		end
	  
	end

	describe "ram and disk space limit" do
		
		before :each do
			user = Factory(:user)
			host = Factory(:host)
			virtual_server = Factory(:virtual_server)
			integration_sign_in(user)
		end
		
		describe "success" do
			it "should be able to create new virtual server" do
				lambda do
					visit new_user_host_virtual_server_path(user, host)
					fill_in "Name", :with => "v2"
					fill_in "Ram", :with => "4"
					fill_in "Disk size", with => "100"
					click_button
				end.should change(VirtualServer, :count).by(1)
			end
		end

	end


end
