// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // 状態変数を使用して_fを呼び出す
        _f(arr, map, myStructs[1]);

        // マッピングから構造体を取得
        MyStruct storage myStruct = myStructs[1];
        // メモリに構造体を作成
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // ストレージ変数を使用して何かを行う
    }

    // メモリ変数を返すことができます
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // メモリ配列で何かを行う
    }

    function h(uint[] calldata _arr) external {
        // calldata配列で何かを行う
    }
}
