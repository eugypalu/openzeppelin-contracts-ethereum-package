pragma solidity ^0.5.2;

import "../lifecycle/Pausable.sol";
import "./PauserRoleMock.sol";

// mock class using Pausable
contract PausableMock is Pausable, PauserRoleMock {
    bool public drasticMeasureTaken;
    uint256 public count;

    constructor () public {
        Pausable.initialize(msg.sender);

        drasticMeasureTaken = false;
        count = 0;
    }

    function normalProcess() external whenNotPaused {
        count++;
    }

    function drasticMeasure() external whenPaused {
        drasticMeasureTaken = true;
    }
}
