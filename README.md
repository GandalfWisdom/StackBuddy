# StackBuddy

A simple stack data structure class for roblox.


## Features
StackBuddy allows you to utilize a stack data structure ([LIFO](## 'Last in first out')).

* Supports all standard stack implementation functions and more such as: Push, Pop, Peek, IsEmpty and Size.
* Perfect for use with state machines, pathfinding systems, undo systems, NPC AI behavior, and much more!

## Usage
Initialize your StackBuddy object:
```lua
local stack_buddy = StackBuddy.new();
```
Push, Pop, and Peek at your data to your heart's content:
```lua
    local function set_undo(last_input: Enum.Keycode)
        stack_buddy:Push(last_input);
    end;

    local function undo()
        local undo_input: Enum.Keycode = stack_buddy:Pop();
        print(undo_input.Name, " has been undone");
    end;

    set_undo(Enum.Keycode.A);
    set_undo(Enum.Keycode.B);
    set_undo(Enum.Keycode.C);

    undo();
    undo();
```
Output should be:
```
C has been undone
B has been undone
```

## Installation
StackBuddy supports [Nevermore's](https://github.com/Quenty/NevermoreEngine) npm package installation method. 

Simply type ```npm install @gandalfwisdom/stackbuddy``` in your CLI on your project to install.