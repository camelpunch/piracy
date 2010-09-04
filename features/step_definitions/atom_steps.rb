Then /^I should see the atom feed$/ do
  response.body.should include('atom')
end

