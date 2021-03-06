require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^I have not visited before$/) do
  @session = RockPaper.new
end

When(/^I visit the home page$/) do
  visit('/')
end

Then(/^I should be asked for my name$/) do
  expect(page).to have_content('enter your name')
end

Given(/^I am a new user$/) do
  @session = RockPaper.new
end

When(/^I enter my name$/) do
  fill_in 'your_name', with: 'Chris'
end

Then(/^I should go to the play game page$/) do
  expect(page).to have_content('Let us play')
end

When(/^I enter nothing$/) do
  visit('/')
  fill_in 'your_name', with: ''
  click_button 'register'
end

Then(/^I should be asked for my name again$/) do
  expect(page).to have_content('enter your name')
end


When(/^I click register$/) do
  click_button 'register'
end

Given(/^I have entered my name$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I see the play game page$/) do
  visit('/player_make_choice')
end

Then(/^I should see a choice of choose Rock, Paper or Scissors$/) do
  expect(page.find("#Rock")).not_to be nil
end

When(/^I am playing the game$/) do
  step 'I visit the home page'
  step 'I enter my name'
  step 'I click register'
end

When(/^I have not made a choice$/) do
  #nothing to do here
end

When(/^I click on 'rock'$/) do
  #click 'Rock'
  page.find("#Rock").click
end

Then(/^I should see a Game Result page$/) do
  expect(page).to have_content("Game Result")
end
