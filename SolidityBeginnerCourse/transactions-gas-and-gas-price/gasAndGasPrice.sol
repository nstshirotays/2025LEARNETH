// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Gas {
    uint public i = 0;

    // 送信されたすべてのガスを使い果たすと、トランザクションが失敗します。
    // 状態の変更は元に戻されます。
    // 使用されたガスは返金されません。
    function forever() public {
        // ここでガスがすべて消費されるまでループを実行し、
        // トランザクションが失敗します。
        while (true) {
            i += 1;
        }
    }
}
