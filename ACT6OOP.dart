import 'dart:core';
import 'dart:io';

//Name, Address, Borrowed Book
var usrs = List<String>.filled(0, '', growable: true);
var adrs = List<String>.filled(0, '', growable: true);
var bB = List<String>.filled(0, '', growable: true);

//Title, Author, Genre, ISBN, State, Borrowed By
var bks = List<String>.filled(0, '', growable: true);
var auth = List<String>.filled(0, '', growable: true);
var gen = List<String>.filled(0, '', growable: true);
var isbn = List<String>.filled(0, '', growable: true);
var bState = List<String>.filled(0, '', growable: true);
var bBy = List<String>.filled(0, '', growable: true);

class AddBook {
  var tit;
  var aut;
  var gn;
  var bCode;
  //Add Book
  void addB() {
    print('Enter Title: ');
    tit = stdin.readLineSync()!;
    print('Enter Author: ');
    aut = stdin.readLineSync()!;
    print('''Select Genre:
  1-Computer Science
  2-Philosophy
  3-Pure Science
  4-Arts & Design
  5-History''');
    gn = stdin.readLineSync()!;
    print('Enter ISBN: ');
    bCode = stdin.readLineSync()!;
    if (isbn.contains(bCode)) {
      print('ISBN Book Code ALready Exists');
    } else {
      bks.add(tit);
      auth.add(aut);
      switch (gn) {
        case "1":
          {
            gen.add('Computer Science');
          }
          break;
        case "2":
          {
            gen.add('Philosophy');
          }
          break;
        case "3":
          {
            gen.add('Pure Science');
          }
          break;
        case "4":
          {
            gen.add('Arts & Design');
          }
          break;
        case "5":
          {
            gen.add('History');
          }
          break;
      }
      isbn.add(bCode);
      bState.add('Available');
      bBy.add('None');
      print('Book Added Successfuly');
    }
  }
}

class BorrowBook {
  var fName;
  var uAdrs;
  var bBI;
  //Borrow Book
  void lendB() {
    print('Enter Full Name: ');
    fName = stdin.readLineSync()!;

    print('Enter Address: ');
    uAdrs = stdin.readLineSync()!;

    print('Enter Book ISBN: ');
    bBI = stdin.readLineSync()!;
    int stcheck = isbn.indexOf(bBI);
    if (isbn.contains(bBI)) {
      if (bState[stcheck] == 'Borrowed') {
        print("Book Has Been Borrowed by Another User");
      } else {
        usrs.add(fName);
        adrs.add(uAdrs);
        bB.add(bBI);
        bState[stcheck] = 'Borrowed';
        bBy[stcheck] = fName;
        print('Book Borrowed Successfuly');
      }
    } else {
      print("Book Isn't Available");
    }
  }
}

class TotalLendBooks {
  //Show Total Books Currently Lended
  void totalLentB() {
    int tbl = 0;
    if (isbn.length > 0) {
      for (int i = 0; i <= isbn.length - 1; i++) {
        if (bState[i] == 'Borrowed') {
          tbl = tbl + 1;
        }
      }
      print('Total Books Currently Being Borrowed: ' + tbl.toString());
    } else {
      print('No Books Currently Being Borrowed');
    }
  }
}

class ReturnBook {
  var rCode;
//Return Book
  void returnB() {
    print('Enter ISBN Book Code: ');
    rCode = stdin.readLineSync()!;
    if (isbn.contains(rCode)) {
      int rInx = isbn.indexOf(rCode);
      bState[rInx] = 'Available';
      bBy[rInx] = 'None';
      print('Book Return Successfuly');
    } else {
      print("Book doesn't belong here");
    }
  }
}

class TotalNumOfBooks {
//Count All Books
  void totalB() {
    int bCount = isbn.length;
    print('Number of Books in our Collection: ' + bCount.toString());
  }
}

class PrintAllAvailableBooks {
//Display All Books With Details
  void displayB() {
    var totalCount = isbn.length;
    if (totalCount > 1) {
      for (int i = 0; i <= totalCount + 1; i++) {
        print('Title: ' + bks[i]);
        print('Author: ' + auth[i]);
        print('Genre: ' + gen[i]);
        print('ISBN: ' + isbn[i]);
        print('State: ' + bState[i]);
        print('Borrowed By: ' + bBy[i]);
        print(' ');
      }
    }
    if (totalCount == 1) {
      print('Title: ' + bks[0]);
      print('Author: ' + auth[0]);
      print('Genre: ' + gen[0]);
      print('ISBN: ' + isbn[0]);
      print('State: ' + bState[0]);
      print('Borrowed By: ' + bBy[0]);
    } else {
      print('Library Empty');
    }
  }
}

void main(List<String> args) {
  AddBook ab = new AddBook();
  BorrowBook bb = new BorrowBook();
  TotalLendBooks tlbk = new TotalLendBooks();
  ReturnBook rb = new ReturnBook();
  TotalNumOfBooks tb = new TotalNumOfBooks();
  PrintAllAvailableBooks pab = new PrintAllAvailableBooks();
  for (;;) {
    print('''Options:
  1-Add Book
  2-Borrow Book
  3-Return Book
  4-Total Number of Books
  5-Show Library Collection
  6-Number of Lent Books
  7-Exit''');
    var usrin = stdin.readLineSync();
    if (usrin == '1') {
      ab.addB();
    }
    if (usrin == '2') {
      bb.lendB();
    }
    if (usrin == '3') {
      rb.returnB();
    }
    if (usrin == '4') {
      tb.totalB();
    }
    if (usrin == '5') {
      pab.displayB();
    }
    if (usrin == '6') {
      tlbk.totalLentB();
    }
    if (usrin == '7') {
      print('Exit');
      break;
    }
  }
}
