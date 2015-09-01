require_relative '../models/address_book'

 RSpec.describe AddressBook do
 # #1
   let(:book) { AddressBook.new }

 # #2
 describe "attributes" do
   it "should respond to entries" do
     expect(book).to respond_to(:entries)
   end

   it "should initialize entries as an array" do
     expect(book.entries).to be_a(Array)
   end

   it "should initialize entries as empty" do
     expect(book.entries.size).to eq 0
   end
 end

 describe "#add_entry" do
   it "adds only one entry to the address book" do
     book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

     expect(book.entries.size).to eq 1
   end

   it "adds the correct information to entries" do
     book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
     new_entry = book.entries[0]

     expect(new_entry.name).to eq 'Ada Lovelace'
     expect(new_entry.phone_number).to eq '010.012.1815'
     expect(new_entry.email).to eq 'augusta.king@lovelace.com'
   end
 end

 # #6
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eql expected_name
        expect(entry.phone_number).to eql expected_number
        expect(entry.email).to eql expected_email
    end


   # Test that AddressBook's .import_from_csv() method is working as expected
   describe "#import_from_csv" do
     it "imports the correct number of entries" do
 # #3
       book.import_from_csv("entries.csv")
       book_size = book.entries.size
 
       # Check the size of the entries in AddressBook
       expect(book_size).to eql 5
     end
     
 # #4  
    it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       # Check the first entry
       entry_one = book.entries[0]

 # #5
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
       # expect(entry_one.name).to eql "Bill"
       # expect(entry_one.phone_number).to eql "555-555-4854"
       # expect(entry_one.email).to eql "bill@blocmail.com"
     end
 
      it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
       # expect(entry_two.name).to eql "Bob"
       # expect(entry_two.phone_number).to eql "555-555-5415"
       # expect(entry_two.email).to eql "bob@blocmail.com"
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
       # expect(entry_three.name).to eql "Joe"
       # expect(entry_three.phone_number).to eql "555-555-3660"
       # expect(entry_three.email).to eql "joe@blocmail.com"
     end
 
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
       # expect(entry_four.name).to eql  "Sally"
       # expect(entry_four.phone_number).to eql "555-555-4646"
       # expect(entry_four.email).to eql "sally@blocmail.com"
     end
 
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
       # expect(entry_five.name).to eql "Sussie"
       # expect(entry_five.phone_number).to eql "555-555-2036"
       # expect(entry.email).to eql "sussie@blocmail.com"
     end
   end
   
   # Test the binary_search method
   describe "#binary_search" do
     it "searches AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Dan")
       expect(entry).to be_nil
     end
 
     it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bill")
       expect(entry).to be_a Entry
       check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
     end
     
         it "searches AddressBook for Bob" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bob")
       expect(entry).to be_a Entry
       check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
     end
 
     it "searches AddressBook for Joe" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Joe")
       expect(entry).to be_a Entry
       check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
     end
 
     it "searches AddressBook for Sally" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Sally")
       expect(entry).to be_a Entry
       check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
     end
 
     it "searches AddressBook for Sussie" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Sussie")
       expect(entry).to be_a Entry
       check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
     
     it "searches AddressBook for Billy" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Billy")
       expect(entry).to be_nil
     end  
  end
   
   # ---------------------------------------------------------------------------
   # Exercise 22
   # Test the iterative_search method
   # ---------------------------------------------------------------------------
   describe "#iterative_search" do
     it "searches AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Dan")
       expect(entry).to be_nil
     end
 
     it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Bill")
       expect(entry).to be_a Entry
       check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
     end
     
         it "searches AddressBook for Bob" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Bob")
       expect(entry).to be_a Entry
       check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
     end
 
     it "searches AddressBook for Joe" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Joe")
       expect(entry).to be_a Entry
       check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
     end
 
     it "searches AddressBook for Sally" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Sally")
       expect(entry).to be_a Entry
       check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
     end
 
     it "searches AddressBook for Sussie" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Sussie")
       expect(entry).to be_a Entry
       check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
     
     it "searches AddressBook for Billy" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Billy")
       expect(entry).to be_nil
     end  
  end 
   
 end
