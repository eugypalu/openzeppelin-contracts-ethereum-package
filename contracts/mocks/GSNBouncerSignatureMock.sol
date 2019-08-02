pragma solidity ^0.5.0;

import "@openzeppelin/upgrades/contracts/Initializable.sol";
import "../gsn/GSNRecipient.sol";
import "../gsn/bouncers/GSNBouncerSignature.sol";

contract GSNBouncerSignatureMock is Initializable, GSNRecipient, GSNBouncerSignature {
    function initialize(address trustedSigner) initializer public { 
        GSNBouncerSignature.initialize(trustedSigner);
        GSNRecipient.initialize();
    }

    event MockFunctionCalled();

    function mockFunction() public {
        emit MockFunctionCalled();
    }
}
