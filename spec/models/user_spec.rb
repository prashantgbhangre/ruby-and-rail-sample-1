  require 'spec_helper'

describe User do
  before { @user = User.new(name: "Ex User",email: "ex1_email@test.com" ,
            password: "foobar", password_confirmation: "foobar") }
            
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to(:microposts) }
  it { should respond_to(:feed) }

  it { should be_valid }
  it { should_not be_admin }
  
  describe "with admin attribute set to 'true'" do
      before do
        @user.save!
        @user.toggle!(:admin)
      end

      it { should be_admin }
    end
    
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid}
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "whent email address is alredy taken" do
    before {
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    }
      it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before { @user = User.new(name: "Ex User",email:"ex_mail@test.com",
              password:" ",password_confirmation:" ")
  }
  it { should_not be_valid }
  end
  
  describe "when password does'not match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
  end
  
  describe "with a password that too small" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
      
  describe "return value from authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by( email: @user.email ) }
    
    describe "with valid password " do
      it { should eq found_user.authenticate(@user.password) }
    end
    
    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("Invalid") }
      
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
    
  describe "remember token" do
        before { @user.save }
        its(:remember_token) { should_not be_blank }
    end
    
  describe "micropost associations" do

        before { @user.save }
        let!(:older_micropost) do
          FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
        end
        let!(:newer_micropost) do
          FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
        end

        it "should have the right microposts in the right order" do
          expect(@user.microposts.to_a).to eq [newer_micropost, older_micropost]
        end
      
        it "should destroy associated microposts" do
              microposts = @user.microposts.to_a
              @user.destroy
              expect(microposts).not_to be_empty
              microposts.each do |micropost|
                expect(Micropost.where(id: micropost.id)).to be_empty
              end
        end
  end

end