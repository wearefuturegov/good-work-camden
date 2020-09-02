Given("I'm on the homepage") do
    visit root_path
end

Then("I should be able to see and click the start button") do
    click_link_or_button('Start now')
end

When("I say I am a Camden resident") do
    find('input[value=yes]').click
end

# not quite a perfect test here - the postcode can be entered regardless of which option above is selected

And("I enter a Camden postcode") do
    fill_in('Please enter your postcode', with: 'NW1 2DU')
end

# used several times
Then("I can continue") do
    click_link_or_button('Continue')
end

When("I can select two kinds of support") do
    find('label[for=support-applying]').click
    find('label[for=support-progress-current-job]').click
end

Then("I choose to see my results") do
    choose("I'd like to select a local service myself instead")
end

Then("I can see my results") do
    expect(page).to have_content("Your results")
end