require 'rails_helper'
RSpec.describe User, type: :model do
    describe "validations" do
        it {should validate_presence_of(:username)}
        it {should validate_presence_of(:password_digest)}
        it {should validate_presence_of(:session_token)}

        context "when password is not nil" do
            it do 
                should validate_length_of(:password).
                is_at_least(6)
            end
        end
        describe 'uniqueness' do
            before(:each) do
            # before each test in this describe block, we will create
            # a user from factory bot
            # persist it into the testing db.
            create(:user)
            end
            it {should validate_uniqueness_of(:username)}
            it { should validate_uniqueness_of(:session_token) }
        end

    end
    describe "#ensure_session_token" do
        it "calls generate_session_token if session_token is nil" do
        end
        it "does not calls generate_session_token if session_token exists" do
        end
         it "calls ensure_session_token on initialize" do
        end
    end

    describe "#password=" do
    let!(:user) {create(:user)}
        it "saves password_digest to database" do  
            expect(user.password_digest).to_not be_nil
        end
        it "encrypts password in password_digest" do
            
            expect(user.password_digest).to_not eq(user.password)
        end
        
    end

    describe "::find_by_credentials" do
        let!(:user) {create(:user)}
        it "should find user by given params" do
            expect(User.find_by_credentials(user.username,user.password)).to eq(user)
        end
        context "when password does not match" do
            it "returns nil" do
                expect(User.find_by_credentials(user.username,"adfsd")).to eq(" ")
            end
        end

        context "when username does not exist" do
            it "returns nil" do
            end
        end
    end
    
    describe "#is_password?" do
        it "returns true if password is user's password" do
        end
        it "returns false if password is not user's password" do
        end
    end

    describe "::generate_session_token" do
        it "creates new session token" do
            expect(User.generate_session_token).to_not be_nil
        end
    end

    describe "#reset_session_token" do
        it "calls generate_session_token" do
        end
        it "saves session to database" do
        end
    end


    
end