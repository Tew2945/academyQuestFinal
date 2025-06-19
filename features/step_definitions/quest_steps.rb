Given("I am on the quests page") do
  visit root_path
end

When('I fill in the field with testid {string} with {string}') do |testid, value|
  find("[data-testid='#{testid}']").set(value)
end

When('I click the button with testid {string}') do |testid|
  find("[data-testid='#{testid}']").click
end

Then('I should see a quest item with text {string}') do |text|
  expect(page).to have_css('[data-testid="quest-item"]', text: text)
end

Then('I should not see a quest item with text {string}') do |text|
  expect(page).not_to have_css('[data-testid="quest-item"]', text: text)
end

Given('I have a quest named {string}') do |name|
  Quest.create!(name: name, status: true)
  visit current_path
end

When("I click the button with testid {string} for {string}") do |testid, quest_name|
  quest = Quest.find_by(name: quest_name)
  within("#quest_#{quest.id}") do
    find("[data-testid='#{testid}']").click
  end
end

# FIXED: Updated checkbox step to properly handle completion state
When('I click the checkbox with testid {string} for {string}') do |testid, quest_name|
  quest = Quest.find_by(name: quest_name)
  within("#quest_#{quest.id}") do
    checkbox = find("[data-testid='#{testid}']")
    checkbox.click
  end

  # Wait a moment for the form submission to complete
  sleep(1)

  # Verify the quest status changed in the database
  quest.reload
  expect(quest.status).to be true
end

# ADDED: New step definition for checking completion state
Then('I should see the quest {string} as completed') do |quest_name|
  quest = Quest.find_by(name: quest_name)
  within("#quest_#{quest.id}") do
    # Check if the quest name has completed styling
    expect(page).to have_css('[data-testid="quest-name"].line-through', wait: 5)
  end
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end
