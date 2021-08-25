// SPDX-License-Identifier: MIT
pragma solidity =0.8.7;

import "OpenZeppelin/openzeppelin-contracts@4.3.0/contracts/token/ERC1155/ERC1155.sol";

contract E1155 is ERC1155 {
    uint256 private tokenId;
    uint256 public constant GOLD = 1000;
    uint256 public constant SILVER = 1001;
    uint256 public constant THORS_HAMMER = 1002;
    uint256 public constant SWORD = 1003;
    uint256 public constant SHIELD = 1004;
    uint256 public constant GUN = 1005;

    constructor(
    ) ERC1155("https://api.bccg.digital/api/bccg/{id}.json") {
        _mint(msg.sender, GOLD, 1, "");
        _mint(msg.sender, SILVER, 10, "");
        _mint(msg.sender, THORS_HAMMER, 20, "");
        _mint(msg.sender, SWORD, 1, "");
        _mint(msg.sender, SHIELD, 20, "");
        _mint(msg.sender, GUN, 30, "");
    }

    function award() public returns (uint256) {
        tokenId++;
        _mint(msg.sender, tokenId, 1, "");
        return tokenId;
    }

    function faucet(uint256 _amount) public {
        require(_amount < 11, "too many");
        tokenId++;
        _mint(msg.sender, tokenId, _amount, "");
    }
}