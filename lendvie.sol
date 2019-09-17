pragma solidity >=0.4.22 <0.6.0; //version currently used by Remix, so we can change later
contract Lendvie {
  struct Loan {
    address lender;   //wallet providing the loan
    address borrower; //wallet recieving the loan
    uint amount; //how much the loan is for (TODO find out how big is max value?)
    //TODO add additional information about the loan
  }
  //TODO add class variables and observer/mutator methods
}
