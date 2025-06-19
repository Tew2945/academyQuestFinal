Given("I am on the brags page") do
  visit brag_path
end

When("I click the link with testid {string}") do |testid|
  find("[data-testid='#{testid}']").click
end

Then("I should see the brags main section") do
  expect(page).to have_css('[data-testid="intro-card"]')
  expect(page).to have_css('[data-testid="goal-section"]')
end

Then("I should see the intro card") do
  expect(page).to have_css('[data-testid="intro-card"]')
end

Then("I should see a goal item with text {string}") do |text|
  expect(page).to have_css('[data-testid="goal-item"]', text: text)
end
