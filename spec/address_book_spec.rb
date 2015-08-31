require_relative '../models/address_book.rb'

RSpec.describe AddressBook do  
    context "attributes" do
        it "should respond to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end

        it "should initialize entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_a(Array)
        end

        it "should initialize entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq 0
        end
    end

    context "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq 1
        end
 
        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            expect(new_entry.name).to eq 'Ada Lovelace'
            expect(new_entry.phone_number).to eq '010.012.1815'
            expect(new_entry.email).to eq 'augusta.king@lovelace.com'
        end
    end
    context "#remove_entry" do
        it "removes only one entry from the beginning of address book" do
            #create a few entries
            book = AddressBook.new
            book.add_entry('Ada Lovelace',   '111.111.1111', 'al@lovelace.com')
            book.add_entry('Mindy Lovelace', '222.222.2222', 'ml@lovelace.com')
            book.add_entry('Zeda Lovelace',  '333.333.3333', 'zl@lovelace.com')
            
            #Remove the entry
            initial_size = book.entries.size #Get the array size before deletion
            book.remove_entry('Ada Lovelace','111.111.1111', 'al@lovelace.com')
            expect(book.entries.size).to eq (initial_size - 1)
            
            #Make sure the correct element was deleted
            new_entry = book.entries[0]
            expect(new_entry.name).to eq 'Mindy Lovelace'
            expect(new_entry.phone_number).to eq '222.222.2222'
            expect(new_entry.email).to eq 'ml@lovelace.com'
            new_entry = book.entries[1]
            expect(new_entry.name).to eq 'Zeda Lovelace'
            expect(new_entry.phone_number).to eq '333.333.3333'
            expect(new_entry.email).to eq 'zl@lovelace.com'
        end
        it "removes only one entry from the middle of address book" do
            #create a few entries
            book = AddressBook.new
            book.add_entry('Ada Lovelace',   '111.111.1111', 'al@lovelace.com')
            book.add_entry('Mindy Lovelace', '222.222.2222', 'ml@lovelace.com')
            book.add_entry('Zeda Lovelace',  '333.333.3333', 'zl@lovelace.com')
            
            #Remove the entry
            initial_size = book.entries.size #Get the array size before deletion
            book.remove_entry('Mindy Lovelace', '222.222.2222', 'ml@lovelace.com')
            expect(book.entries.size).to eq (initial_size - 1)
            
            #Make sure the correct element was deleted
            new_entry = book.entries[0]
            expect(new_entry.name).to eq 'Ada Lovelace'
            expect(new_entry.phone_number).to eq '111.111.1111'
            expect(new_entry.email).to eq 'al@lovelace.com'
            new_entry = book.entries[1]
            expect(new_entry.name).to eq 'Zeda Lovelace'
            expect(new_entry.phone_number).to eq '333.333.3333'
            expect(new_entry.email).to eq 'zl@lovelace.com'
        end
        it "removes only one entry from the end of address book" do
            #create a few entries
            book = AddressBook.new
            book.add_entry('Ada Lovelace',   '111.111.1111', 'al@lovelace.com')
            book.add_entry('Mindy Lovelace', '222.222.2222', 'ml@lovelace.com')
            book.add_entry('Zeda Lovelace',  '333.333.3333', 'zl@lovelace.com')
            
            #Remove the entry
            initial_size = book.entries.size #Get the array size before deletion
            book.remove_entry('Zeda Lovelace',  '333.333.3333', 'zl@lovelace.com')
            expect(book.entries.size).to eq (initial_size - 1)
            
            #Make sure the correct element was deleted
            new_entry = book.entries[0]
            expect(new_entry.name).to eq 'Ada Lovelace'
            expect(new_entry.phone_number).to eq '111.111.1111'
            expect(new_entry.email).to eq 'al@lovelace.com'
            new_entry = book.entries[1]
            expect(new_entry.name).to eq 'Mindy Lovelace'
            expect(new_entry.phone_number).to eq '222.222.2222'
            expect(new_entry.email).to eq 'ml@lovelace.com'
        end
        it "removes nothing if the entry can not be found" do
            #create a few entries
            book = AddressBook.new
            book.add_entry('Ada Lovelace',   '111.111.1111', 'al@lovelace.com')
            book.add_entry('Mindy Lovelace', '222.222.2222', 'ml@lovelace.com')
            book.add_entry('Zeda Lovelace',  '333.333.3333', 'zl@lovelace.com')
            
            #Remove the entry
            initial_size = book.entries.size #Get the array size before deletion
            book.remove_entry('Alfred Lovelace',  '333.333.3333', 'zl@lovelace.com') #not in the array
            expect(book.entries.size).to eq (initial_size)
            
            #Make sure the original entries remain
            new_entry = book.entries[0]
            expect(new_entry.name).to eq 'Ada Lovelace'
            expect(new_entry.phone_number).to eq '111.111.1111'
            expect(new_entry.email).to eq 'al@lovelace.com'
            new_entry = book.entries[1]
            expect(new_entry.name).to eq 'Mindy Lovelace'
            expect(new_entry.phone_number).to eq '222.222.2222'
            expect(new_entry.email).to eq 'ml@lovelace.com'
            new_entry = book.entries[2]
            expect(new_entry.name).to eq 'Zeda Lovelace'
            expect(new_entry.phone_number).to eq '333.333.3333'
            expect(new_entry.email).to eq 'zl@lovelace.com'
        end        
    end
end