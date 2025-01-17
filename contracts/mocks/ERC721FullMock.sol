pragma solidity ^0.5.2;

import "../token/ERC721/ERC721Full.sol";
import "../token/ERC721/ERC721Mintable.sol";
import "../token/ERC721/ERC721MetadataMintable.sol";
import "../token/ERC721/ERC721Burnable.sol";

/**
 * @title ERC721FullMock
 * This mock just provides public functions for setting metadata URI, getting all tokens of an owner,
 * checking token existence, removal of a token from an address
 */
contract ERC721FullMock is ERC721Full, ERC721Mintable, ERC721MetadataMintable, ERC721Burnable {
    constructor (string memory name, string memory symbol) public {
        ERC721.initialize();
        ERC721Metadata.initialize(name, symbol);
        ERC721Enumerable.initialize();
        ERC721Mintable.initialize(msg.sender);
        ERC721MetadataMintable.initialize(msg.sender);
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

    function tokensOfOwner(address owner) public view returns (uint256[] memory) {
        return _tokensOfOwner(owner);
    }

    function setTokenURI(uint256 tokenId, string memory uri) public {
        _setTokenURI(tokenId, uri);
    }
}
