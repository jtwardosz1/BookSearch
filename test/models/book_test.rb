require "test_helper"

class BookTest < ActiveSupport::TestCase
    test 'good book' do
        person = Person.create!(name: 'Test Person', email: 'fake@email.com', address: 'fake street', phone: '123', library_card: '123')
        book = Book.create!(person: person, title: 'The Great Gatsby', isbn: 'ISBN 978-3-163-14840-1')
        assert_equal('The Great Gatsby', book.title)
        assert_equal('ISBN 978-3-163-14840-1', book.isbn)
        assert_equal(person, book.person) 
        end
        
    test 'bad book no title' do
        person = Person.create!(name: 'Test Person', email: 'fake@email.com', address: 'fake street', phone: '123', library_card: '123')
    
        exception = assert_raise(ActiveRecord::RecordInvalid) do
        
        Book.create!(person: person, title: nil, isbn: 'ISBN 978-3-163-14840-1')
        end
    
        assert_match(/Title can't be blank/, exception.message)
    end

    test 'bad book no isbn' do
        person = Person.create!(name: 'Test Person', email: 'fake@email.com', address: 'fake street', phone: '123', library_card: '123')
    
        exception = assert_raise(ActiveRecord::RecordInvalid) do
        
        Book.create!(person: person, title: "Sprawlball", isbn: nil)
        end
    
        assert_match(/Validation failed: Isbn can't be blank, Isbn Must be official ISBN Format: ISBN 000-0-000-00000-0/, exception.message)
    end

    test 'incorrect ISBN format' do
        person = Person.create!(name: 'Test Person', email: 'fake@email.com', address: 'fake street', phone: '123', library_card: '123')

        exception = assert_raise(ActiveRecord::RecordInvalid) do
            
            Book.create!(person: person, title: "Sprawlball", isbn: '123456789')
            end

        assert_match(/Validation failed: Isbn Must be official ISBN Format: ISBN 000-0-000-00000-0/, exception.message)

        end

    test 'bad book no person' do
        exception = assert_raise(ActiveRecord::RecordInvalid) do
        
        Book.create!(person: nil, title: "Sprawlball", isbn: 'ISBN 978-3-163-14840-1')
        end
    
        assert_match(/Validation failed: Person must exist/, exception.message)
    end
end
