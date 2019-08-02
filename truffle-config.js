require('chai/register-should');
const { GSNProvider } = require('@openzeppelin/gsn-provider');

module.exports = {
  networks: {
    development: {
      provider: () => new GSNProvider('http://localhost:8545', { txfee: 70, useGSN: false }),
      network_id: '*', // eslint-disable-line camelcase
    },
    coverage: {
      host: 'localhost',
      network_id: '*', // eslint-disable-line camelcase
      port: 8555,
      gas: 0xfffffffffff,
      gasPrice: 0x01,
    },

    mainnet: {
      host: 'localhost',
      port: 8565,
      network_id: '1',
      gasPrice: 20000000000,
      from: '0x6Bf917B4725aD736B33Dbd493Ad7a4B992150DAb',
    },

    ropsten: {
      host: 'localhost',
      port: 8565,
      network_id: '3',
      gasPrice: 2000000000,
    },

    rinkeby: {
      host: 'localhost',
      port: 8565,
      network_id: '4',
      gasPrice: 0,
    },

    kovan: {
      host: 'localhost',
      port: 8565,
      network_id: '42',
      gasPrice: 0,
    },

  },

  compilers: {
    solc: {
      version: '0.5.2',
    },
  },

  mocha: {
    bail: true
  }
};
