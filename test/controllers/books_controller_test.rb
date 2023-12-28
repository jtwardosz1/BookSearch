require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  # chatgpt helped show that creating a person here for the controller test would help them pass yaml validation
  test "should create book" do
    new_person = Person.create!(name: 'Test Person', email: 'fake@email.com', address: 'fake street', phone: '123', library_card: '123')
    assert_difference("Book.count") do
      post books_url, params: { book: { isbn: "ISBN 978-3-163-14840-1", person_id: new_person.id, title: "Amazing Book" } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    new_person = Person.create!(name: 'Test Person', email: 'fake@email.com', address: 'fake street', phone: '123', library_card: '123')
    patch book_url(@book), params: { book: { isbn: "ISBN 978-3-163-14840-2", person: new_person, title: "Amazing Book" } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
