// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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
    mapping(address => voter) public voterRegister;

    // created a state of our ballot at any point
    enum State{ created, voting, ended}
    State public state;

    // modifiers
    
    modifier condition(bool _condition){
        require(_condition);
        _;
    }

    modifier onlyOffical(){
        require(msg.sender == ballotOfficalAddress);
        _;
    }

    modifier inState(State _state){
        require(state == _state);
        _;
    }

    // events

    // functions

    constructor(
        string memory _ballotOfficalName,
        string memory _proposal
    )
    {
        ballotOfficalAddress = msg.sender;
        ballotOfficalName = _ballotOfficalName;
        proposal = _proposal;

        state = State.created;
    }

    function addVoter(address _voterAddress, string memory _voterName) public inState(State.created) onlyOffical {
        voter memory v;
        v.voterName = _voterName;
        v.voted = false;
        voterRegister[_voterAddress] =v;
        totalVoters++;
    }

    function startVote() public inState(State.created) onlyOffical{
        state = State.voting;
    }

    function doVote(bool _choice) public inState(State.voting) returns(bool voted){
        bool found = false;

        if(voterRegister[msg.sender].voterName.length != 0 && !voterRegister[msg.sender].voted){
            voterRegister[msg.sender].voted = true;
            vote memory v;
            v.voteAddress = msg.sender;
            v.choice = _choice;
            if(_choice) {
                countResult++;
            }
            votes[totalVoters] = v;
            totalVoters++;
            found = true;
        }
        return found;

    }

    function endVote(){

    }
}

