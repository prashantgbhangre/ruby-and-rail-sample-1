require 'spec_helper'

describe "UserTests" do
  subject { page }
  describe "User Pages" do
    before { visit user_new_path }
        it { should have_content('Sign up') }
        it { should have_title('Welcome to parami soft | Sign up') }
  end
end
