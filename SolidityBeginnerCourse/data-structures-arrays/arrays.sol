// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Array {
    // 配列を初期化するいくつかの方法
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // 固定サイズの配列、すべての要素は0に初期化されます
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidityは全体の配列を返すことができます。
    // しかし、この関数は無限に長くなる可能性がある配列には避けるべきです。
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // 配列に追加
        // これにより配列の長さが1増えます。
        arr.push(i);
    }

    function pop() public {
        // 配列の最後の要素を削除
        // これにより配列の長さが1減ります。
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // 削除は配列の長さを変更しません。
        // インデックスの値をデフォルト値にリセットします、
        // この場合は0です。
        delete arr[index];
    }
}

contract CompactArray {
    uint[] public arr;

    // 要素を削除すると配列にギャップが生じます。
    // 配列をコンパクトに保つ1つのトリックは、
    // 削除する場所に最後の要素を移動することです。
    function remove(uint index) public {
        // 削除する場所に最後の要素を移動
        arr[index] = arr[arr.length - 1];
        // 最後の要素を削除
        arr.pop();
    }

    function test() public {
        arr.push(1);
        arr.push(2);
        arr.push(3);
        arr.push(4);
        // [1, 2, 3, 4]

        remove(1);
        // [1, 4, 3]

        remove(2);
        // [1, 4]
    }
}
