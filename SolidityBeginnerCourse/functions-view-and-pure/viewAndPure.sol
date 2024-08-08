// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract ViewAndPure {
    uint public x = 1;

    // 状態を変更しないことを約束します。
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // 状態を変更せず、また状態から読み取らないことを約束します。
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}
