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
  visit('/')
  fill_in 'your_name', with: 'Chris'
  click_button 'register'
end

Then(/^I should go to the play game page$/) do
  expect(page).to have_content("Let's play")
end

When(/^I enter nothing$/) do
  visit('/')
  fill_in 'your_name', with: ''
  click_button 'register'
end

Then(/^I should be asked for my name again$/) do
  expect(page).to have_content('enter your name')
end