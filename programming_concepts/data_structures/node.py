
class Node():
    """ Node class for a linked list """
    def __init__( self, value, next=None ) -> None:
        """
        Initialize a node with a value and a next node.

        Args:
            value: The value of the node.
            next: The next node.
        """
        self.value = value
        self.next = next


class TwoWayNode( Node ):
    def __init__(self, value, previous=None, next=None) -> None:
        """
        Initialize a two way node with a value, previous and next node.

        Args:
            value: The value of the node.
            previous: The previous node.
            next: The next node.
        """
        super().__init__(value, next= next)
        self.previous = previous



if __name__ == "__main__":

    # Crear nodos
    node1 = Node(1)
    node2 = Node(2)
    node3 = Node(3)

    # Establecer enlaces entre los nodos
    node1.next = node2
    node2.next = node3
    
    # Nuevo nodo
    node4 = Node(4)
    node3.next = node4

    # Imprimir los valores de los nodos
    current_node = node1
    while current_node is not None:
        print(current_node.value)
        current_node = current_node.next