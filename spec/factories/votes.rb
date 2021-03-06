FactoryGirl.define do
  factory :vote do
    vote "PLUS"
    association :submission
    association :user
  end
  
  factory :plus_vote, :parent => :vote do
    vote 'PLUS'
  end
  
  factory :minus_vote, :parent => :vote do
    vote 'MINUS'
  end  
end
