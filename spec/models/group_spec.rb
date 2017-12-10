require 'spec_helper'


RSpec.describe Group, :type => :model do
  subject { Group.new }

  it "is valid with valid attributes" do
    subject.name = "Anything"
    subject.details = "Anything"
    expect(subject).to be_valid
  end
  it "is valid with name and details" do
    subject.name = "Anything"
    subject.details = ''
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = ""
    expect(group).to_not be_valid
  end

end