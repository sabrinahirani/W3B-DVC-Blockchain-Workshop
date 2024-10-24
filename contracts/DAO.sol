// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A simple implementation of a DAO.
// This implementation is for demonstration/educational purposes only.

import "./ERC20.sol";

contract DAO {

    ERC20 public votes;

    struct Proposal {
        uint id;
        string description; // i.e. send $5 to a charity in switzerland
        bool executed;
        uint256 count;
    }

    Proposal[] public proposals;

    mapping(address => mapping(uint256 => bool)) public voters;

    event ProposalCreated(uint256 proposalId, string description);
    event Voted(uint256 proposalId, address voter);
    event ProposalExecuted(uint256 proposalId);

    constructor(address tokenAddress) {
        votes = ERC20(tokenAddress);
    }

    function createProposal(string memory description) public {
        proposals.push(Proposal({
            id: proposals.length,
            description: description,
            executed: false,
            count: 0
        }));

        emit ProposalCreated(proposals.length - 1, description);
    }

    function vote(uint256 proposalId) public {
        require(proposalId < proposals.length, "Invalid Proposal ID");

        Proposal storage proposal = proposals[proposalId];
        require(!voters[msg.sender][proposal.id], "Already Voted");

        require(votes.balanceOf(msg.sender) > 0, "Insufficient Votes");

        // note: transfer a vote to the smart contract to vote on a proposal
        require(votes.transferFrom(msg.sender, address(this), 1), "Transfer Failed");

        proposal.count += 1;
        voters[msg.sender][proposal.id] = true;

        emit Voted(proposalId, msg.sender);
    }

    function executeProposal(uint256 proposalId) public {
        require(proposalId < proposals.length, "Invalid Proposal ID");

        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Proposal Already Executed");

        // note: must have number of votes > 100 to execute proposal
        require(proposal.count > 100, "Not Enough Votes"); 

        // TODO logic to execute proposal

        proposal.executed = true;
        emit ProposalExecuted(proposalId);
    }
}
