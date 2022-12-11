// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Just a simple erc20 token 
contract Token is ERC20 {
    constructor() ERC20("PHILSON", "PHIL") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }
}
