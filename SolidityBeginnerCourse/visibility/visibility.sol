// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Base {
    // private関数は次の場所でのみ呼び出せます
    // - このコントラクト内
    // ※ このコントラクトを継承するコントラクトはこの関数を呼び出せません。
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // internal関数は次の場所で呼び出せます
    // - このコントラクト内
    // - このコントラクトを継承するコントラクト内
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // public関数は次の場所で呼び出せます
    // - このコントラクト内
    // - このコントラクトを継承するコントラクト内
    // - 他のコントラクトおよびアカウントから
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // external関数は次の場所でのみ呼び出せます
    // - 他のコントラクトおよびアカウントから
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // この関数はコンパイルされません。ここでexternal関数を呼び出そうとしているためです。
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // ステート変数
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // ステート変数はexternalにすることはできないので、このコードはコンパイルされません。
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // 継承されたコントラクトはprivate関数とステート変数にアクセスできません。
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // internal関数は子コントラクト内で呼び出すことができます。
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}