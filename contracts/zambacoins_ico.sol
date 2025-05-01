// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZambaCoinICO {
    uint256 public constant max_zambacoins = 1000;
    uint256 public constant ether_to_zambacoins = 10;
    uint256 public total_zambacoins_bought = 0;

    mapping(address => uint256) private equity_zambacoins;
    mapping(address => uint256) private equity_ether;

    event ZambacoinsBought(address indexed investor, uint256 zambacoins_bought);
    event ZambacoinsSold(address indexed investor, uint256 zambacoins_sold);

    function equity_in_zambacoins(address investor) external view returns (uint256) {
        return equity_zambacoins[investor];
    }

    function equity_in_ether(address investor) external view returns (uint256) {
        return equity_ether[investor];
    }

    function buy_zambacoins(uint256 ether_invested) external {
        uint256 zambacoins_bought = ether_invested * ether_to_zambacoins;
        
        require(total_zambacoins_bought + zambacoins_bought <= max_zambacoins, "purchase exceeds limit");

        equity_zambacoins[msg.sender] += zambacoins_bought;
        equity_ether[msg.sender] = equity_zambacoins[msg.sender] / ether_to_zambacoins;
        total_zambacoins_bought += zambacoins_bought;

        emit ZambacoinsBought(msg.sender, zambacoins_bought);
    }

    function sell_zambacoins(uint256 zambacoins_to_sell) external {
        uint256 current_balance = equity_zambacoins[msg.sender];

        require(current_balance >= zambacoins_to_sell, "insufficient balance");

        equity_zambacoins[msg.sender] -= zambacoins_to_sell;
        equity_ether[msg.sender] = equity_zambacoins[msg.sender] / ether_to_zambacoins;
        total_zambacoins_bought -= zambacoins_to_sell;

        emit ZambacoinsSold(msg.sender, zambacoins_to_sell);
    }

    function zambacoins_left_for_sale() view public returns (uint256) {
    return max_zambacoins - total_zambacoins_bought;
    }
}