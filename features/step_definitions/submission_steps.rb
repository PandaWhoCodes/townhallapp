def verify_submissions_count(count)
  visit series_path(@series)
  page.all('ul li').length.should be(count)
end

Given /^I am creating a new submission for a series$/ do
  @series = Factory(:series)
  visit series_path(@series)
  click_link "New Submission"
end

Given /^no are no submissions for that series$/ do
  # no code needed
end

Given /^the following submissions for that series:$/ do |table|
  table.hashes.each do |hash|
    Factory.create(:submission,
      :name => hash['name'],
      :created_at => Chronic.parse(hash['created']),
      :series => @series)
  end
end

Given /^the following submissions:$/ do |table|
  table.hashes.each do |hash|
    series = Factory.create(:series, :name => hash['series'])
    Factory.create(:submission,
      :name => hash['name'],
      :series => series)
  end
end

Then /^I should see the submissions in the order:$/ do |table|
  actual_submissions = table.raw.flatten
  expected_submissions = page.all('ul li').collect(&:text)
  expected_submissions.should == actual_submissions
end

Then /^(\d+) submissions should exist for that series$/ do |count|
  verify_submissions_count(count.to_i)
end
