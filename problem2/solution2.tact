struct ProposalInit {
    master: Address;
    proposalId: Int as uint32;
}

message DeployNewProposal {
    votingEndingAt: Int as uint32;
}

contract ProposalMaster {
    nextProposalId: Int as uint32 = 0;

    // deploy
    receive() {}

    receive(msg: DeployNewProposal) {
        require(msg.votingEndingAt >= now(), "Voting must end in the future");

        deploy(DeployParameters {
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: msg.toCell(),
            init: initOf Proposal(ProposalInit {
                master: myAddress(),
                proposalId: self.nextProposalId,
            }),
        });

        self.nextProposalId += 1;
    }

    get fun nextProposalId(): Int { return self.nextProposalId }

    get fun proposalState(): Int { return self.nextProposalId }
}

// ==============================================================================

message Vote {
    value: Bool;
}

struct ProposalState {
    yesCount: Int as uint32;
    noCount: Int as uint32;
    master: Address;
    proposalId: Int as uint32;
    votingEndingAt: Int as uint32;
}

contract Proposal {
    const MAX_VOTES: Int = 100;

    proposalId: Int as uint32;
    votingEndingAt: Int as uint32 = 0;

    yesCount: Int as uint8 = 0;
    noCount: Int as uint8 = 0;

    voters: map<Address, Bool>;

    masterAddress: Address;

    init(data: ProposalInit) {
        self.proposalId = data.proposalId;
        self.masterAddress = data.master;
    }

    receive(msg: Vote) {
        require(self.yesCount + self.noCount < self.MAX_VOTES, "Max votes reached");
        require(now() <= self.votingEndingAt, "Voting ended");
        require(!self.voters.exists(sender()), "Already voted");

        self.voters.set(sender(), msg.value);
        if (msg.value) {
            self.yesCount += 1;
        } else {
            self.noCount += 1;
        }

        cashback(sender());
    }

    receive(msg: DeployNewProposal) {
        throwIf(2025, sender() != self.masterAddress);

        self.votingEndingAt = msg.votingEndingAt;
    }

    get fun proposalState(): ProposalState {
        return ProposalState {
            yesCount: self.yesCount,
            noCount: self.noCount,
            master: self.masterAddress,
            proposalId: self.proposalId,
            votingEndingAt: self.votingEndingAt,
        };
    }
}
