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
    initData: Init;

    yesCount: Int as uint32 = 0;
    noCount: Int as uint32 = 0;

    init(data: Init) {
        self.initData = data;
    }

    // deploy
    receive() {}

    receive(msg: Vote) {
        require(now() <= self.initData.votingEndingAt, "Voting ended");

        deploy(DeployParameters {
            value: 0,
            mode: SendRemainingValue,
            body: msg.toCell(),
            init: initOf VoteInternal(VoteInternalInit {
                voterAddress: sender(),
                proposalInit: self.initData,
            }),
        });
    }

    receive(msg: VoteAccepted) {
        let expectedVoteAddress = contractAddress(initOf VoteInternal(VoteInternalInit {
            voterAddress: msg.voterAddress,
            proposalInit: self.initData,
        }));
        require(sender() == expectedVoteAddress, "Only vote contract can send vote accepted to proposal contract");

        if msg.value {
            self.yesCount += 1;
        } else {
            self.noCount += 1;
        }
    }

    get fun proposalState(): ProposalState {
        return ProposalState {
            yesCount: self.yesCount,
            noCount: self.noCount,
        };
    }
}

struct VoteInternalInit {
    voterAddress: Address;
    proposalInit: Init;
}

message VoteAccepted {
    value: Bool;
    voterAddress: Address;
}

contract VoteInternal {
    proposalAddress: Address;
    voterAddress: Address;

    // TODO(mkl): #PERFORMANCE: do we need this field? Should it be just a flag that we responded?
    value: Bool?;

    init(data: VoteInternalInit) {
        self.proposalAddress = contractAddress(initOf Proposal(data.proposalInit));
        self.voterAddress = data.voterAddress;
    }

    // deploy
    receive() {}

    receive(msg: Vote) {
        require(sender() == self.proposalAddress, "Only proposal can send vote to internal vote contract");
        require(self.value == null, "Vote already accepted");

        self.value = msg.value;

        message(MessageParameters {
            to: self.proposalAddress,
            value: 0,
            mode: SendRemainingValue,
            body: VoteAccepted {
                value: msg.value,
                voterAddress: self.voterAddress,
            }.toCell(),
        });
    }
}
