// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3

contract Counter {
    uint public count;

    // 現在のカウントを取得する関数
    function get() public view returns (uint) {
        return count;
    }

    // カウントを1増加させる関数
    function inc() public {
        count += 1;
    }

    // カウントを1減少させる関数
    function dec() public {
        count -= 1;
    }
}
