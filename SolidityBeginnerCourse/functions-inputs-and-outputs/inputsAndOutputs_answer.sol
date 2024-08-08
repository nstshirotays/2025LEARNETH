// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Function {
    // 複数の値を返却する
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    // 複数の値を順番で変数に割り当てて返却する
    function named() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);
    }

    // 複数の変数をその名前で返却する（return文を使わない）
    function assigned() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Use destructing assignment when calling another
    // function that returns multiple values.
    function destructingAssigments() public pure returns (uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany();

        // Values can be left out.
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Cannot use map for neither input nor output

    // Can use array for input
    function arrayInput(uint[] memory _arr) public {}

    // Can use array for output
    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
    
    function returnTwo() public pure returns (int i, bool b) {
        i = -2;
        b = true;
    }
}