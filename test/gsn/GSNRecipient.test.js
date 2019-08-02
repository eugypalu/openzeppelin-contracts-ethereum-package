const { balance, ether, expectEvent, shouldFail } = require('openzeppelin-test-helpers');
const gsn = require('@openzeppelin/gsn-helpers');

const { expect } = require('chai');

const GSNRecipientMock = artifacts.require('GSNRecipientMock');

contract('GSNContext', function ([_, payee]) {
  beforeEach(async function () {
    this.recipient = await GSNRecipientMock.new();
    await this.recipient.initialize();
  });

  it('returns the RelayHub address address', async function () {
    expect(await this.recipient.getHubAddr()).to.equal('0x537F27a04470242ff6b2c3ad247A05248d0d27CE');
  });

  it('returns the compatible RelayHub version', async function () {
    expect(await this.recipient.relayHubVersion()).to.equal('1.0.0');
  });

  context('with deposited funds', async function () {
    const amount = ether('1');

    beforeEach(async function () {
      await gsn.fundRecipient(web3, { recipient: this.recipient.address, amount });
    });

    it('funds can be withdrawn', async function () {
      expect(await balance.difference(payee, () => 
        this.recipient.withdrawDeposits(amount, payee))
      ).to.be.bignumber.equal(amount);
    });

    it('logs when funds are withdrawn', async function () {
      const { logs }  = await this.recipient.withdrawDeposits(amount, payee);
      expectEvent.inLogs(logs, 'GSNDepositsWithdrawn', { amount, payee });
    });

    it('partial funds can be withdrawn', async function () {
      expect(await balance.difference(payee, async () => 
        this.recipient.withdrawDeposits(amount.divn(2), payee))
      ).to.be.bignumber.equal(amount.divn(2));
    });

    it('logs when partial funds are withdrawn', async function () {
      const { logs } = await this.recipient.withdrawDeposits(amount.divn(2), payee);
      expectEvent.inLogs(logs, 'GSNDepositsWithdrawn', { amount: amount.divn(2), payee });
    });

    it('reverts on overwithdrawals', async function () {
      await shouldFail.reverting(
        this.recipient.withdrawDeposits(amount.addn(1), payee)
        // , 'insufficient funds'
      );
    });
  });
});
