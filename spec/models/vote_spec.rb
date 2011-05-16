require 'spec_helper'

describe Vote do

  # need to create a record for shoulda's validate_uniqueness_of
  subject{ Factory.create(:vote) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:submission) }
  it { should validate_presence_of(:vote) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:submission_id) }
  it { should belong_to(:submission) }
  it { should belong_to(:user) }
  it { should allow_value('PLUS').for(:vote) }
  it { should_not allow_value('plus').for(:vote) }
  it { should allow_value('MINUS').for(:vote) }
  it { should_not allow_value('foo').for(:vote) }

end
