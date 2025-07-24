// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SimpleStorage {
    // 数値を保存するための状態変数
    uint public num;

    // 状態変数に書き込むにはトランザクションを送信する必要があります。
    function set(uint _num) public {
        num = _num;
    }

    // 状態変数から読み取るにはトランザクションを送信する必要はありません。
    function get() public view returns (uint) {
        return num;
    }
}
