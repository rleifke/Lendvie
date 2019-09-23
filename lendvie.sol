pragma solidity >=0.4.22 <0.6.0; //version currently used by Remix, so we can change later
contract Lendvie {
  uint public loanCount; //this is just informational so it can be deleted later
  uint public userCount;
  struct User {
    address userAddress;
    bool isActive; //this should never be false once initialized, it is used to check if user exists
    uint16 creditScore; //16 bits should be more than enough to store credit score
    mapping (address => Loan) credits;
    mapping (address => Loan) debts;
  }
  mapping (address => User) public users;
  struct Loan {
    address lender;
    address borrower;
    bool isPaid;
    uint origAmount; //maximum value is 2^256-1
    uint remainingAmount;
    //TODO add additional information about the loan
  }
  function createUser() public {
    require(!userExists(msg.sender));
    users[msg.sender].isActive = true;
    users[msg.sender].userAddress = msg.sender;
  }
  function userExists(address addr) public constant returns(bool exists) {
    return users[addr].isActive;
  }
  //TODO add more class variables and observer/mutator methods
}
