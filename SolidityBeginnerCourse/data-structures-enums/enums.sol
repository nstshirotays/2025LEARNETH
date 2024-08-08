// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Enum {
    // Enumで配送状況を表現
    enum Status {
        Pending,   // 保留中
        Shipped,   // 発送済み
        Accepted,  // 受け入れ済み
        Rejected,  // 拒否済み
        Canceled   // キャンセル済み
    }

    // デフォルト値は列挙型の定義で最初にリストされている要素、
    // この場合は"Pending"になります
    Status public status;

    // uintを返します
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // 引数としてuintを渡してステータスを更新します
    function set(Status _status) public {
        status = _status;
    }

    // このように特定のenum値に更新することができます
    function cancel() public {
        status = Status.Canceled;
    }

    // deleteはenumをその最初の値、0にリセットします
    function reset() public {
        delete status;
    }
}
