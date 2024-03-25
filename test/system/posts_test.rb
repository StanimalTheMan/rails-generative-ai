require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:first)
  end

  test "Creating a new post" do
    visit posts_path
    assert_selector "h1", text: "Posts"

    click_on "New post"
    assert_selector "h1", text: "New post"

    fill_in "Title", with: "Superdog flying in space"
    click_on "Create post"

    assert_selector "h1", text: "Posts"
    assert_text "Superdog flying in space"
  end

  test "Showing a post" do
    visit posts_path
    click_link @post.title

    assert_selector "h1", text: @post.title
  end

  test "Updating a post" do
    visit posts_path
    assert_selector "h1", text: "Posts"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit post"

    fill_in "Title", with: "Updated post"
    click_on "Update post"

    assert_selector "h1", text: "Posts"
    assert_text "Updated post"
  end

  test "Destroying a post" do
    visit posts_path
    assert_text @post.title

    click_on "Delete", match: :first
    assert_no_text @post.title
  end
end
