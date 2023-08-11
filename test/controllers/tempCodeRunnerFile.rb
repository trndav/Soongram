  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end
