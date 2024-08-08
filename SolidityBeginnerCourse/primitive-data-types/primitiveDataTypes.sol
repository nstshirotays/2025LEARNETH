// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Primitives {
    bool public boo = true;

    /*
    uintは符号なし整数を意味し、負の数を持たない整数です。
    異なるサイズが利用可能です。
        uint8   は0から2 ** 8 - 1までの範囲
        uint16  は0から2 ** 16 - 1までの範囲
        ...
        uint256 は0から2 ** 256 - 1までの範囲
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uintはuint256の別名です

    /*
    int型では負の数も許可されます。
    uintと同様に、int8からint256まで異なる範囲が利用可能です。
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // intはint256と同じです

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // デフォルト値
    // 未初期化の変数にはデフォルト値があります
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
