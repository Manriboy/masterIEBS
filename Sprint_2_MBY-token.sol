// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MomBreY_3 is ERC20 {
    constructor() ERC20("MomBreY_3.0", "MB3") {
        _mint(msg.sender, 1000000 * 10 ** 18);
    }

    function mas_monedas(uint256 monto) external {
        _mint(msg.sender, monto * 10 ** 18);
    }
}

