// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Variables {
    // 状態変数はブロックチェーンに保存されます。
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public {
        // ローカル変数はブロックチェーンに保存されません。
        uint i = 456;

        // いくつかのグローバル変数
        uint timestamp = block.timestamp; // 現在のブロックのタイムスタンプ
        address sender = msg.sender; // 呼び出し元のアドレス
    }
}
