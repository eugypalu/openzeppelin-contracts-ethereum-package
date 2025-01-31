pragma solidity ^0.5.2;

import "../token/ERC20/IERC20.sol";
import "../crowdsale/validation/CappedCrowdsale.sol";

contract CappedCrowdsaleImpl is CappedCrowdsale {
    constructor (uint256 rate, address payable wallet, IERC20 token, uint256 cap)
        public
    {
        Crowdsale.initialize(rate, wallet, token);
        CappedCrowdsale.initialize(cap);
    }
}
