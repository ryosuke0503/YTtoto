require "application_system_test_case"

class MatchResultsTest < ApplicationSystemTestCase
  setup do
    @match_result = match_results(:one)
  end

  test "visiting the index" do
    visit match_results_url
    assert_selector "h1", text: "Match Results"
  end

  test "creating a Match result" do
    visit match_results_url
    click_on "New Match Result"

    fill_in "Away", with: @match_result.away_id
    fill_in "Awayscore", with: @match_result.awayscore
    fill_in "Broadcasts", with: @match_result.broadcasts
    fill_in "Date", with: @match_result.date
    fill_in "Home", with: @match_result.home_id
    fill_in "Homescore", with: @match_result.homescore
    fill_in "Kind", with: @match_result.kind
    fill_in "League", with: @match_result.league
    fill_in "Stadium", with: @match_result.stadium
    fill_in "Time", with: @match_result.time
    fill_in "Viewers", with: @match_result.viewers
    fill_in "Year", with: @match_result.year
    click_on "Create Match result"

    assert_text "Match result was successfully created"
    click_on "Back"
  end

  test "updating a Match result" do
    visit match_results_url
    click_on "Edit", match: :first

    fill_in "Away", with: @match_result.away_id
    fill_in "Awayscore", with: @match_result.awayscore
    fill_in "Broadcasts", with: @match_result.broadcasts
    fill_in "Date", with: @match_result.date
    fill_in "Home", with: @match_result.home_id
    fill_in "Homescore", with: @match_result.homescore
    fill_in "Kind", with: @match_result.kind
    fill_in "League", with: @match_result.league
    fill_in "Stadium", with: @match_result.stadium
    fill_in "Time", with: @match_result.time
    fill_in "Viewers", with: @match_result.viewers
    fill_in "Year", with: @match_result.year
    click_on "Update Match result"

    assert_text "Match result was successfully updated"
    click_on "Back"
  end

  test "destroying a Match result" do
    visit match_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Match result was successfully destroyed"
  end
end
