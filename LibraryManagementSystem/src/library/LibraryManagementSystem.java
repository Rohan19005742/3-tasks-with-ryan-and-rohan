package library;
 
public class LibraryManagementSystem {
    public static void main(String[] args) {
        Library library = new Library();
 
        library.addBook(new Book("1984", "George Orwell", "1234567890"));
        library.addBook(new Book("To Kill a Mockingbird", "Harper Lee", "1234567891"));
 
        library.addPatron(new Patron("Alice", "P1"));
        library.addPatron(new Patron("Bob", "P2"));
 
        library.borrowBook("1234567890", "P1");
 
        library.borrowBook("1234567890", "P2");
 
        library.returnBook("1234567890", "P1");
    }
}
