// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // 'Todo'構造体の配列
    Todo[] public todos;

    function create(string memory _text) public {
        // 構造体を初期化する3つの方法
        // - 関数のように呼び出す
        todos.push(Todo(_text, false));

        // キーバリューマッピング
        todos.push(Todo({text: _text, completed: false}));

        // 空の構造体を初期化してから更新
        Todo memory todo;
        todo.text = _text;
        // todo.completedはfalseに初期化されます

        todos.push(todo);
    }

    // Solidityは'todos'のゲッターを自動的に作成するため、
    // 実際にはこの関数は必要ありません。
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // テキストを更新
    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // 完了状態を更新
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
