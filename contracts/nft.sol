// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721, Pausable, Ownable, ERC721Burnable {
    // Inherits Burn function from ERC721Burnable
    // Basically transfers ownership to address(0)

    // Declare a Counter for incremental ID
    // Counter values starts from 0 by default
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    /** 
      @dev _baseTokenURI for computing {tokenURI}. If set, the resulting URI for each token will be the concatenation of the `baseURI` and the `tokenId`.
    **/
    string _baseTokenURI;

    // Constructor to the define token Name, Symbol, and baseURI
    constructor(string memory baseURI) ERC721("PHILSON", "PHIL") {
        _baseTokenURI = baseURI;
    }

    /**
        @dev _baseURI overides the Openzeppelin's ERC721 implementation which by default returned an empty string for the baseURI
    **/
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    // Functions to pause/unpause Token Transfers
    // Basically just sets "paused" to true/false
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // Function to Mint new NFT tokens to an address
    // Reverts if token ID already exists (safeMint)
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    // Function to check whether "paused" before token transfers
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId,
        uint256 batchSize
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }
}
