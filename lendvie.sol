pragma solidity >=0.4.22 <0.6.0; //version currently used by Remix, so we can change later
contract Lendvie {

  struct User {
    address userAddress;
    bool isActive; //this should never be false once initialized,
                   //it is just used to check if user exists
    uint16 creditScore; //16 bits should be more than enough to store credit score
    mapping (address => Loan[]) credits; //uses Loan[] so a user can have more than
                                         //one active loan with the same user
    mapping (address => Loan[]) debts;
  }
//added staker agent to loan
  struct Loan {
    address lender;
    address borrower;
    address staker;
    bool isPaid;
    uint amountBorrowed;
    uint amountDue;
    uint amountRemaining;
    //TODO add additional information about the loan
  }

  uint public loanCount; //this is just informational so it can be deleted later to save gas
  uint public userCount; //also just informational, can delete if we decide it's unnecessary
  mapping (address => User) public users;

  function createUser() external {
    require(!userExists(msg.sender));
    users[msg.sender].isActive = true;
    users[msg.sender].userAddress = msg.sender;
    userCount = userCount + 1; //I don't think solidity has an increment operator yet
  }

  function userExists(address addr) public view returns(bool exists) {
    return users[addr].isActive;
  }

  //TODO examine any potential security vulnerabilities with this function
  function forgiveLoan(address debtor, uint loanNumber) external {
    users[msg.sender].credits[debtor][loanNumber].isPaid = true;
  }

  /**
   *TODO find out how to return all the loans between two users and whether looping over
    an array inside a view function uses gas
   *TODO add a way for both the lender and the creditor to agree on a loan
    maybe with a function requestLoan(address newLender){}
    but we might also need a new struct called TempLoan until the loan is agreed upon
   *TODO add functions to make loan payments
   *TODO make sure contract isn't vulnerable to uint under/overflow, race conditions, etc
   *TODO add more necessary contract class variables and observer/mutator methods
   */
   
   /*
      /* deposit into borrower accounts and will return the balance of the user 
    after the deposit is made */
   function deposit(address receiver, uint amount) returns(uint256) {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        checkLoanPayoff();
        return balances[receiver];
    }

    /* 'constant' prevents function from editing state variables; */
    function getBalance(address receiver) constant returns(uint256){
        return balances[receiver];
    }
    
    //Need to a function that checks if loan payment is fufilled
    
    
    /* Add loan details into the contract */
    function submitLoan(
            bytes32 _borrower,
            bytes32 _staker,
            uint32 _term,
            uint32 _interest,
            uint32 _loanAmount, 
            
    ){
        loan.agreement.borrower = _borrower; 
        loan.agreement.staker = _staker;
        loan.loanTerms.term=_term;
        loan.loanTerms.interest=_interest;
        loan.loanTerms.loanAmount=_loanAmount;
        loan.status = STATUS_SUBMITTED;
    }
    
    /* Gets loan details from the contract */
    function getLoanData() constant returns (
            bytes32 _borrower,
            bytes32 _staker,
            uint32 _term,
            uint32 _interest,
            uint32 _loanAmount,
    {
        _borrower = loan.borrower;
        _term=loan.loanTerms.term;
        _interest=loan.loanTerms.interest;
        _loanAmount=loan.loanTerms.loanAmount;
        _status = loan.status;
    }
    
   // write function to approve loan
    */
}

