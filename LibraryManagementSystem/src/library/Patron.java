package library;
 
import java.util.ArrayList;
import java.util.List;
 
public class Patron {
    private String name;
    private String patronId;
    private List<Book> borrowedBooks;
 
    public Patron(String name, String patronId) {
        this.name = name;
        this.patronId = patronId;
        this.borrowedBooks = new ArrayList<>();
    }
 
    public String getName() {
        return name;
    }
 
    public String getPatronId() {
        return patronId;
    }
 
    public void borrowBook(Book book) {
        borrowedBooks.add(book);
    }
 
    public Book returnBook(String isbn) {
        for (Book book : borrowedBooks) {
            if (book.getIsbn().equals(isbn)) {
                borrowedBooks.remove(book);
                return book;
            }
        }
        return null;
    }
}
