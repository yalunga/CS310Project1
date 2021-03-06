Given(/^the user is in Results Page 1$/) do
  visit "http://localhost:8080/CSCI310Project1/results.html"
end
Then(/^display a collage of photos with search term$/) do
  page.find(".is-four-fifths")
end


Given(/^the user is in Results Page 2$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
  fill_in 'query', with: 'Chinese'
  page.find(".btn").click
end
Then(/^display a title of the form “Results for F”$/) do
  expect(page.find(".title")).to have_content("Results for Chinese")
end

Given(/^the user is in Results Page 3$/) do
  visit "http://localhost:8080/CSCI310Project1/results.html"
end
Then(/^display a drop down box$/) do
  expect(page).to have_select("dropdown")
end
And(/^default value for it will be empty$/) do
  expect(page).to have_select("dropdown", selected: "")
end

Given(/^the user is in Results Page 4$/) do
  visit "http://localhost:8080/CSCI310Project1/results.html"
end
Then(/^display a ManageList Button$/) do
  expect(page).to have_content("Manage List")
end

Given(/^the user is in Results Page 4a$/) do
  visit "http://localhost:8080/CSCI310Project1/results.html"
end
And(/^a list is selected from the drop down menu$/) do
  select "Explore", :from => "dropdown"
end
When(/^the ManageList Button is clicked$/) do
  page.find('.button', match: :first).click
end
Then(/^direct the user to the List Management Page$/) do
  expect(page).to have_title("ImHungry | ManageList")
end

Given(/^the user is in Results Page 5$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
  fill_in 'query', with: 'Chinese'
  page.find(".btn").click
end
Then(/^display a column of results of restaurant$/) do
  page.find_by_id("restaurants")
end

Given(/^the user is in Results Page 5b$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
  fill_in 'query', with: 'Chinese'
  page.find(".btn").click
end
Then(/^the Results Page displays the column of restaurants$/) do
  page.find_by_id("restaurants")
end
And(/^the restaurants must include the following information: i. Name of the restaurant; ii. Address of the restaurant; iv. Minutes of driving to get to the restaurant ;v. Price range of the restaurant$/) do
  expect(page).to have_css(".card-content")
end

Given(/^the user is in Results Page 5c$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
    fill_in 'query', with: 'Chinese'
    page.find(".btn").click
end
When(/^the user clicks on the restaurant$/) do
  page.find_by_id("restaurants").find('.card', match: :first).find('.card-content').click
end
Then(/^the user should be directed to the Restaurant Page$/) do
  expect(page).to have_title("ImHungry | Restaurant")
end

Given(/^the user is in Results Page 6$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
    fill_in 'query', with: 'Chinese'
    page.find(".btn").click
end
Then(/^display a column of results of recipe$/) do
  page.find_by_id("recipes")
end

Given(/^the user is in Results Page 6b$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
  fill_in 'query', with: 'Chinese'
  page.find(".btn").click
end
Then(/^the Results Page displays the column of recipes$/) do
  page.find_by_id("recipes")
end
And(/^the recipes must include the following information: i. Name of the recipe; iii. Stars received by the restaurant by reviewers$/) do
  expect(page).to have_css(".card-content")
end

Given(/^the user is in Results Page 6c$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
    fill_in 'query', with: 'Chinese'
    page.find(".btn").click
end
When(/^the user clicks on the recipe$/) do
  page.find_by_id("recipes").find('.card', match: :first).find('.card-content').click
end
Then(/^the user should be directed to the Recipe Page$/) do
  expect(page).to have_title("ImHungry | Recipe")
end

Given(/^the user is in Results Page 8$/) do
  visit "http://localhost:8080/CSCI310Project1/results.html"
end
When(/^the user clicks on the "Return to Search" button$/) do
  page.all(class: 'button')[1].click
end
Then(/^the user should be directed back to the Search Page$/) do
  expect(page).to have_title("ImHungry | Search")
end

Given(/^the user is in the Search Page App2$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
    fill_in 'query', with: 'Chinese'
    page.find(".btn").click
end
When(/^the Search Page displays the results$/) do
  page.find_by_id("recipes")
  page.find_by_id("restaurants")
end
Then(/^Rows in the results lists must alternate their background color between two different shades of gray$/) do
  expect(page).to have_css("has-background-white-ter")
end

Given(/^the user is in the Search Page App 3c$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
    fill_in 'query', with: 'Chinese'
    page.find(".btn").click
end
And(/^the Search Page displays the photo collage of the search term$/) do
  page.find(".image-container")
end
Then(/^the photo collage should be in rectangular shape$/) do
  page.find(".columns")
end
And(/^the size of the collage must be between 40 and 60% of the browser viewport width, and the height must be between 35 and 50% of the browser viewport height$/) do
  page.find(".is-multiline")
end

Given(/^the user is in the Search Page APP 3p$/) do
  visit "http://localhost:8080/CSCI310Project1/index.html"
    fill_in 'query', with: 'Chinese'
    page.find(".btn").click
end
And(/^the Search Page displays the photo collage of the search term$/) do
  page.find_by_id(".image0")
end
Then(/^there is no photo frames for individual photos$/) do
  page.find(".food-image")
end
And(/^all photos should be scaled to fit within the space allocated for the collage$/) do
  page.find(".image-container").find(".food-image")
end
And(/^photos should be displayed in the collage with a random rotation of -45 to 45 degrees$/) do
  expext(page.find(".image-container").find(".food-image")).to have_css("#style")
end
