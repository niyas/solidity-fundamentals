//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // State Variables (Saved in the Blockchain)
    uint public myUint   = 1;
    uint256 public myUint256  = 1;
    uint8 public myUint8  = 1;

    string public myString = "Hello World!!";
    bytes32 public myByte32 = "Hello, World!";

    address public myAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;

    struct MyStruct {
        uint256 myUint256;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello, World!!");
    // Local Variables
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }
}