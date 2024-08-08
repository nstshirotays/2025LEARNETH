// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract ReceiveEther {
    /*
    どの関数が呼び出されるか、fallback()かreceive()か？

           Ether送信
               |
         msg.dataは空か？
              /      \
            yes       no
            /           \
receive()は存在するか？  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Etherを受け取るための関数。msg.dataは空でなければなりません
    receive() external payable {}

    // msg.dataが空でない場合に呼び出されるフォールバック関数
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // この関数はEtherを送信するためには推奨されません。
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // sendは成功または失敗を示すブール値を返します。
        // この関数はEtherを送信するためには推奨されません。
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // callは成功または失敗を示すブール値を返します。
        // これは現在推奨されている方法です。
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
