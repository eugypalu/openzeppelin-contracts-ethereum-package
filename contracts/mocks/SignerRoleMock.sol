pragma solidity ^0.5.2;

import "../access/roles/SignerRole.sol";

contract SignerRoleMock is SignerRole {
    constructor() public {
        SignerRole.initialize(msg.sender);
    }

    function removeSigner(address account) public {
        _removeSigner(account);
    }

    function onlySignerMock() public view onlySigner {
        // solhint-disable-previous-line no-empty-blocks
    }

    // Causes a compilation error if super._removeSigner is not internal
    function _removeSigner(address account) internal {
        super._removeSigner(account);
    }
}
