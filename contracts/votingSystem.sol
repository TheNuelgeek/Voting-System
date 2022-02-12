// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Ballot{
    // Variables

    //vote properties
    struct vote{
        address voteAddress;
        bool choice;
    }

    //voter's properties
    struct voter{
        string voterName;
        bool voted;
    }

    uint private countResult = 0;
    uint public finalResult = 0;
    uint public totalVoters = 0;

    address public ballotOfficalAddress;
    string public ballotOfficalName;
    string public proposal;

    //mapping to find our vote and list of our vote
    mapping(uint => vote) private votes;
    mapping(uint => voter) public voterRegister;

    // created a state of our ballot at any point
    enum State{ created, voting, ended}
    State public state;

    // modifiers

    // events

    // functions

    constructor(){

    }

    function addVoter(){

    }

    function startVote(){

    }

    function doVote(){

    }

    function endVote(){

    }
}

