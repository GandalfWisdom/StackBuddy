--!strict
local StackBuddy = {};
StackBuddy.__index = StackBuddy;
StackBuddy.ClassName = "StackBuddy";

export type StackBuddy = typeof(setmetatable(
    {} :: {
        _data: {any},
    },
    {} :: typeof({ __index = StackBuddy })
));

--[=[
    Constructs a new StackBuddy object.
    @return StackBuddy
]=]
function StackBuddy.new(): StackBuddy
    local self: StackBuddy = setmetatable({} :: any, StackBuddy);
    self._data = {};
    return self;
end;

--[=[
    Adds element to top of stack.
    @param element any -- Element to be added to top of stack.
]=]
function StackBuddy.Push(self: StackBuddy, element: any): ()
    table.insert(self._data, element);
end;

--[=[
    Removes the top element from the stack and returns it.
    @return element any -- Element removed from the top of the stack.
]=]
function StackBuddy.Pop(self: StackBuddy): any
    assert(self._data[1], "Cannot call :Pop on an empty stack!");
    local element: any = self._data[#self._data];
    table.remove(self._data, #self._data);
    return element;
end;

--[=[
    Returns the top element of the stack without removing it from the stack.
    @return element any -- Element at the top of the stack.
]=]
function StackBuddy.Peek(self: StackBuddy): any
    return self._data[#self._data];
end;

--[=[
    Returns the element in the specified index.
    @return element any -- Element at specified index in the stack.
]=]
function StackBuddy.PeekAt(self: StackBuddy, index: number): any?
    return self._data[index];
end;

--[=[
    Searches for an element and returns the position on the stack.
    @return index number -- Position on the stack that the element resides.
]=]
function StackBuddy.Search(self: StackBuddy, element: any): number
    local index: number = table.find(self._data, element) :: number;
    if not (index) then index = -1 end;
    return index;
end;

--[=[
    Returns the size of the stack.
    @return stack_size number -- Size of stack.
]=]
function StackBuddy.Size(self: StackBuddy): number
    return #self._data;
end;

--[=[
    Checks if stack is empty.
    @return boolean -- True: stack is empty, False: stack is not empty.
]=]
function StackBuddy.IsEmpty(self: StackBuddy): boolean
    return (#self._data == 0);
end;

--[=[
    Returns the top element of the stack as a string.
    @return string -- Top element as a string.
]=]
function StackBuddy.__tostring(self: StackBuddy): ()
    return `Stack({self:Peek()}, {self:Size()})`;
end;

--[=[
    Allows you to iterate through StackBuddy object as if it were a table.
    return (typeof(next), any) tuple -- Returns 
]=]
function StackBuddy.__iter(self: StackBuddy): (typeof(next), {any})
    return next, self._data;
end;

--[=[
    Cleans up the StackBuddy object and sets it's metatable to nil.
]=]
function StackBuddy.Destroy(self: StackBuddy): ()
    setmetatable(self :: any, nil);
end;

return StackBuddy;