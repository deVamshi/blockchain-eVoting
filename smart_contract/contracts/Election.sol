// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Election {
    
    struct Voter {
        uint256 id;
        string name;
        string fingerPrint;
        bool hasVoted;
    }

    // contains the data of all registered voters
    mapping(string => Voter) public registeredVoters;
    uint256 public votersCount = 0;

    function isRegistered(string memory _fP) public view returns (bool) {
        return registeredVoters[_fP].id > 0;
    }

    function registerVoter(string memory _name, string memory _fingerPrint)
        public
    {
        require(!isRegistered(_fingerPrint));
        votersCount++;
        registeredVoters[_fingerPrint] = Voter(
            votersCount,
            _name,
            _fingerPrint,
            false
        );
    }

    struct Candidate {
        uint256 candidateId;
        string name;
        string party;
        uint256 votes;
    }

    mapping(uint256 => Candidate) public candidates;
    uint256 public candidatesCount;

    function addCandidate(string memory _name, string memory _party) public {
        // Need to prevent from adding duplicate candidates
        candidatesCount++;
        candidates[candidatesCount] = Candidate(
            candidatesCount,
            _name,
            _party,
            0
        );
    }

    event NewVote();

    mapping(string => bool) internal voted;

    function castVote(string memory _fingerPrint, uint256 _candId) public {
        require(!voted[_fingerPrint]);
        require(isRegistered(_fingerPrint));
        require(_candId > 0 && _candId <= candidatesCount);

        candidates[_candId].votes++;
        voted[_fingerPrint] = true;
        registeredVoters[_fingerPrint].hasVoted = true;
        emit NewVote();
    }
}
