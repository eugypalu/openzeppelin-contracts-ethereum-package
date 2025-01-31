pragma solidity ^0.5.2;

import "../access/roles/MinterRole.sol";

contract MinterRoleMock is MinterRole {
    constructor() public {
        MinterRole.initialize(msg.sender);
    }

    function removeMinter(address account) public {
        _removeMinter(account);
    }

    function onlyMinterMock() public view onlyMinter {
        // solhint-disable-previous-line no-empty-blocks
    }

    // Causes a compilation error if super._removeMinter is not internal
    function _removeMinter(address account) internal {
        super._removeMinter(account);
    }
}
