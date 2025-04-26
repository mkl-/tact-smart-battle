//
// Public solution template
//

message Vote {
    value: Bool;
}

struct ProposalState {
    yesCount: Int as uint32;
    noCount: Int as uint32;
}

struct Init {
    proposalId: Int as uint32;
    votingEndingAt: Int as uint32;
}

contract Proposal {
    const MAX_VOTES: Int = 100;

    proposalId: Int as uint32;
    votingEndingAt: Int as uint32;

    nVotes: Int as uint8 = 0;
    yesCount: Int as uint8 = 0;
    noCount: Int as uint8 = 0;

    voters: map<Address, Bool>;

    init(data: Init) {
        self.proposalId = data.proposalId;
        self.votingEndingAt = data.votingEndingAt;
    }

    // deploy
    receive() {
    }

    receive(msg: Vote) {
        require(self.nVotes <= self.MAX_VOTES, "Max votes reached");
        require(now() <= self.votingEndingAt, "Voting ended");
        require(!self.voters.exists(sender()), "Already voted");
        
        self.voters.set(sender(), msg.value);
        self.nVotes += 1;
        if (msg.value) {
            self.yesCount += 1;
        } else {
            self.noCount += 1;
        }

        cashback(sender());
    }

    get fun proposalState(): ProposalState {
        return ProposalState {
            yesCount: self.yesCount,
            noCount: self.noCount,
        };
    }
}
