pragma solidity ^0.5.2;

import "@openzeppelin/upgrades/contracts/Initializable.sol";
import "./IERC721.sol";

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
contract IERC721Metadata is Initializable, IERC721 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function price() external view returns (uint256);
    function info() external view returns (bytes32);
    function tokenURI(uint256 tokenId) external view returns (string memory);
}
