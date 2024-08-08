// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract FunctionModifier {
    // 修飾子の使い方を示すためにこれらの変数を使用します。
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // トランザクションの送信者をコントラクトの所有者として設定します。
        owner = msg.sender;
    }

    // コントラクトの呼び出し元が所有者であることを確認する修飾子。
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // アンダースコアは、関数修飾子内でのみ使用される特殊な文字で、
        // Solidityに残りのコードを実行するよう指示します。
        _;
    }

    // 修飾子は入力を取ることができます。この修飾子は、
    // 渡されたアドレスがゼロアドレスでないことを確認します。
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // 修飾子は関数の前後に呼び出すことができます。
    // この修飾子は、関数が実行中に再度呼び出されるのを防ぎます。
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
