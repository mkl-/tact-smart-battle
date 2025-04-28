import '@ton/test-utils';
import { Blockchain, SandboxContract, TreasuryContract  } from '@ton/sandbox';
import { toNano } from '@ton/core';
import { Proposal } from '../output/solution4_Proposal';
import { ProposalMaster } from '../output/solution4_ProposalMaster';
import { before } from 'node:test';


describe("solution4", () => {
    let blockchain: Blockchain;
    let masterDeployer: SandboxContract<TreasuryContract>;
    let proposalMaster: SandboxContract<ProposalMaster>;

    beforeEach(async () =>  {
        blockchain = await Blockchain.create();
        masterDeployer = await blockchain.treasury('deployer');

        // init master contract
        proposalMaster = blockchain.openContract(
            await ProposalMaster.fromInit(),
        );
        await proposalMaster.send(
            masterDeployer.getSender(),
            {
                value: toNano('0.01'),
            },
            null, // empty message, handled by `receive()` without parameters
        );

    });


    it('basic test', async () => {
        // create proposal
        const currentTime = BigInt(Math.floor(Date.now() / 1000));
        await proposalMaster.send(
            masterDeployer.getSender(),
            {
                value: toNano('0.1'),
                bounce: false,
            },
            {
                $$type: 'DeployNewProposal',
                votingEndingAt: currentTime + 24n * 60n * 60n,
            },
        );

        // vote
        const voter = await blockchain.treasury('voter');
        const proposal = blockchain.openContract(
            await Proposal.fromInit({
                $$type: 'ProposalInit',
                master: proposalMaster.address,
                proposalId: 0n,
            }),
        );
        await proposal.send(
            voter.getSender(),
            { value: toNano('0.1') },
            {
                $$type: 'Vote',
                value: true,
            },
        );

        // the vote was counted
        expect(await proposal.getProposalState()).toMatchObject({ yesCount: 1n, noCount: 0n });
    });

});
