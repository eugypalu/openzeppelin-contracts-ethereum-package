pragma solidity ^0.5.2;

import "../access/roles/CapperRole.sol";

contract CapperRoleMock is CapperRole {
    constructor() public {
        CapperRole.initialize(msg.sender);
    }

    function removeCapper(address account) public {
        _removeCapper(account);
    }

    function onlyCapperMock() public view onlyCapper {
        // solhint-disable-previous-line no-empty-blocks
    }

    // Causes a compilation error if super._removeCapper is not internal
    function _removeCapper(address account) internal {
        super._removeCapper(account);
    }
}
