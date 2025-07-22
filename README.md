# Voting_smart_contract

***🗳️ Decentralized Voting System (Smart Contract)***
A secure and transparent Ethereum-based voting system that allows candidates to be registered, votes to be cast, and results to be viewed on-chain. Built with Solidity, leveraging structs, mappings, inheritance, and proper data location (storage, memory, calldata).

***📌 Features***
Candidate Registration: Only the owner can add candidates.
Secure Voting: Prevents double voting using address tracking.
Results Transparency: View candidate details and total votes.
Inheritance-Based Architecture: Separation of concerns via Ownable base contract.


**📜 Smart Contract Specifications**
**1. Data Structures**
solidity
struct Candidate {
    uint id;
    string name;
    uint voteCount;
}

Mappings:
mapping(uint => Candidate) public candidates – Stores candidate details.
mapping(address => bool) public hasVoted – Tracks voters.



**2. Key Functions**
*Function*	                            *Description*                  	*Access Control*
addCandidate(string calldata name)	 Adds a new candidate	          onlyOwner
vote(uint candidateId)	             Casts a vote for a candidate  	Prevents double voting
getCandidate(uint candidateId)	     Returns (name, voteCount)	    public view
getTotalCandidates()	               Returns total candidates	      public view


**3. Inheritance Structure**
Ownable (Base Contract):
Manages contract ownership.
Provides onlyOwner modifier.
VotingSystem (Derived Contract):
Inherits Ownable.
Implements voting logic.


***🛠 Security Considerations***
✅ Restricted Functions: addCandidate is onlyOwner.
✅ Double-Voting Prevention: Checks hasVoted mapping.
✅ Gas Optimization: Uses calldata for function inputs where possible.
✅ Proper Data Handling: Uses memory for return values in view functions.


***🚀 Usage Guide***

**1. Deployment**
Compile and deploy the VotingSystem contract (deployer becomes owner).
Add candidates using addCandidate("Name") (owner-only).

**2. Voting**
Users call vote(candidateId) to cast their vote.
Each address can vote only once.

**3. Viewing Results**
Call getCandidate(id) to see a candidate’s name and vote count.
Call getTotalCandidates() to get the total number of candidates.


