// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }
}

contract VotingSystem is Ownable {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;
    uint public candidatesCount;

    event CandidateAdded(uint indexed candidateId, string name);
    event Voted(address indexed voter, uint indexed candidateId);

    function addCandidate(string calldata _name) public onlyOwner {
        candidatesCount++;
        candidates[candidatesCount] = Candidate({
            id: candidatesCount,
            name: _name,
            voteCount: 0
        });
        emit CandidateAdded(candidatesCount, _name);
    }
 function vote(uint _id) public {
        require(!voters[msg.sender], "You have already voted");
        require(_id > 0 && _id <= candidatesCount, "Invalid candidate ID");

        Candidate storage candidate = candidates[_id];
        candidate.voteCount += 1;
        voters[msg.sender] = true;

        emit Voted(msg.sender, _id);
    }

    function getCandidate(uint _id) public view returns (string memory
name, uint voteCount) {
        Candidate memory c = candidates[_id];
        return (c.name, c.voteCount);
    }

    function getTotalCandidates() public view returns (uint) {
        return candidatesCount;
    }
}
