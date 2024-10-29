package library;
 
import java.util.ArrayList;
import java.util.List;
 
public class Library {
    private List<Book> books;
    private List<Patron> patrons;
 
    public Library() {
        books = new ArrayList<>();
        patrons = new ArrayList<>();
    }
 
    public void addBook(Book book) {
        books.add(book);
        System.out.println("Book added: " + book.getTitle());
    }
 
    public void addPatron(Patron patron) {
        patrons.add(patron);
        System.out.println("Patron added: " + patron.getName());
    }
 
    public Book searchBookByISBN(String isbn) {
        for (Book book : books) {
            if (book.getIsbn().equals(isbn)) {
                return book;
            }
        }
        return null;
    }
 
    public void borrowBook(String isbn, String patronId) {
        Book book = searchBookByISBN(isbn);
        if (book != null && book.isAvailable()) {
            Patron patron = getPatronById(patronId);
            if (patron != null) {
                book.setAvailable(false);
                patron.borrowBook(book);
                System.out.println(patron.getName() + " borrowed " + book.getTitle());
            }
        } else {
            System.out.println("Book not available.");
        }
    }
 
    public void returnBook(String isbn, String patronId) {
        Patron patron = getPatronById(patronId);
        if (patron != null) {
            Book book = patron.returnBook(isbn);
            if (book != null) {
                book.setAvailable(true);
                System.out.println("Book returned: " + book.getTitle());
            } else {
                System.out.println("Patron has not borrowed this book.");
            }
        }
    }
 
    private Patron getPatronById(String patronId) {
        for (Patron patron : patrons) {
            if (patron.getPatronId().equals(patronId)) {
                return patron;
            }
        }
        return null;
    }
}
