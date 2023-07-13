
from node import Node


class Stack:
    def __init__(self) -> None:
        self.top = None
        self.size = 0

    
    def push( self, value ):
        node = Node( value )

        if self.top:
            node.next = self.top
        
        self.top = node
        self.size += 1

    def pop( self ):

        if self.top:
            data = self.top.value
            self.size -= 1

            if self.top.next:
                self.top = self.top.next
            else:
                self.top = None
            
            return data

        return None
    

    def peek(self):
        
        if self.top:
            return self.top.value

        return None
    

    def clear(self):
        
        while self.top:
            self.pop()    


