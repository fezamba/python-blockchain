// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ZambaCoinICO {
    uint public constant max_zambacoins = 1000000;
    uint public constant usd_to_zambacoins = 1000;
    uint public total_zambacoins_bought = 0;

    mapping(address => uint) private equity_zambacoins;
    mapping(address => uint) private equity_usd;

    event ZambacoinsBought(address indexed investor, uint zambacoins_bought);
    event ZambacoinsSold(address indexed investor, uint zambacoins_sold);

    modifier can_buy_zambacoins(uint usd_invested) {
        uint zambacoins_bought = usd_invested * usd_to_zambacoins;
        require(total_zambacoins_bought + zambacoins_bought <= max_zambacoins, "purchase exceeds limit");
        _;
    }

    function equity_in_zambacoins(address investor) external view returns (uint) {
        return equity_zambacoins[investor];
    }

    function equity_in_usd(address investor) external view returns (uint) {
        return equity_usd[investor];
    }

    function buy_zambacoins(uint usd_invested) external can_buy_zambacoins(usd_invested) {
        uint zambacoins_bought = usd_invested * usd_to_zambacoins;

        uint new_equity = equity_zambacoins[msg.sender] + zambacoins_bought;
        equity_zambacoins[msg.sender] = new_equity;
        equity_usd[msg.sender] = new_equity / usd_to_zambacoins;
        total_zambacoins_bought += zambacoins_bought;

        emit ZambacoinsBought(msg.sender, zambacoins_bought);
    }

    function sell_zambacoins(uint zambacoins_to_sell) external {
        uint current_balance = equity_zambacoins[msg.sender];

        require(current_balance >= zambacoins_to_sell, "insufficient balance");

        uint new_balance = current_balance - zambacoins_to_sell;
        equity_zambacoins[msg.sender] = new_balance;
        equity_usd[msg.sender] = new_balance / usd_to_zambacoins;
        total_zambacoins_bought -= zambacoins_to_sell;

        emit ZambacoinsSold(msg.sender, zambacoins_to_sell);
    }
}
