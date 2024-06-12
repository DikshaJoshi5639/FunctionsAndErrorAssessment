// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    address public seller;
    uint256 public itemPrice;
    uint256 public totalItemsInStock;

    constructor(uint256 _itemPrice, uint256 _totalItemsInStock) {
        seller = msg.sender;
        itemPrice = _itemPrice;
        totalItemsInStock = _totalItemsInStock;
    }

    //REQUIRE() METHOD
    function buyItem(uint256 quantity) external payable {
        require(quantity <= totalItemsInStock, "Not enough items in stock");

        totalItemsInStock -= quantity;
    }

    // ASSERT() METHOD
    function restockItems(uint256 quantity) external {
        assert(quantity > 0); 
        
        totalItemsInStock += quantity;
    }

    // REVERT() METHOD
    function setItemPrice(uint256 _itemPrice) external {

        if (_itemPrice == 0) {
            revert("Item price Can Not be Zero");
        }
        
        itemPrice += _itemPrice;
    }
}
