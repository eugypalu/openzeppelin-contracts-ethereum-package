pragma solidity ^0.5.2;

import "../crowdsale/Crowdsale.sol";

contract CrowdsaleMock is Crowdsale {
    constructor (uint256 rate, address payable wallet, IERC20 token) public {
        Crowdsale.initialize(rate, wallet, token);
    }
}
