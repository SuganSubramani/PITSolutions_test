require 'spec_helper'


RSpec.describe User, :type => :model do
  subject { User.new }

  it "is valid with valid attributes" do
    subject.name = "Anything"
    subject.email = "test@gmail.com"
    subject.gender = "Male"
    expect(subject).to be_valid
  end
  

end