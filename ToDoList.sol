// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ToDoList {

    // defining struct
    struct ToDo { 
        string text;
        bool completed;
    }

    ToDo[] public todos; // ToDo struct typed variable

    // creating new to-do item
    function create(string calldata _text) external { 
        todos.push(ToDo({
            text: _text,
            completed: false
        }));
    }

    function updateText(uint256 _index, string calldata _text) external { 
        todos[_index].text = _text; // updating text of the item
    }

    function get(uint256 _index) external view returns (string memory, bool) {
        ToDo memory todo = todos[_index]; // getting item details
        return (todo.text, todo.completed); 
    }

    function toggle(uint256 _index) external {
        todos[_index].completed = !todos[_index].completed; // updating completion status of the item
    }
}
