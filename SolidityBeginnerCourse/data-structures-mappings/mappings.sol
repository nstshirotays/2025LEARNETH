// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Mapping {
    // addressからuintへのマッピング
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // マッピングは常に値を返します。
        // 値が設定されていない場合、デフォルト値を返します。
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // このアドレスの値を更新
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // 値をデフォルト値にリセット
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // ネストされたマッピング（アドレスから別のマッピングへのマッピング）
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // ネストされたマッピングから値を取得できます
        // 初期化されていない場合でも
        return nested[_addr1][_i];
    }

    function set(
        address _addr1,
        uint _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}
