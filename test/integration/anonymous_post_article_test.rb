require 'test_helper'

class AnonymousPostArticleTest < ActionDispatch::IntegrationTest
  test "browse articles" do
    Post.create!(title: "First Post!!", body: "This is awkward...I have nothing to say :(")
    Post.create!(title: "Wow, it's been a while!", body: "And yet, I;m still not a writter :( :(")
    
    visit '/'
    click_link "View All Posts"
    assert_current_path '/posts'
    #assume we have a page variable
    assert_include page.content, "First Post!!"
    assert_include page.content, "Wow, it's been a while!"
  end
end
