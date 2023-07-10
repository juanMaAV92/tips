from node import Node

from typing import Iterable, Any, Optional, Union

class SinglyLinkedList:
    """Singly Linked List"""


    def __init__(self, *items) -> None:
        """Initialize an empty list

        Args:
            *items: Items to be added to the list.
        """

        self._head = None
        self._tail = None
        self._size = 0

        if len(items) == 1 and isinstance( items[0], ( Iterable, SinglyLinkedList )):
            items = items[0]

        for item in items:
            self.append( item )


    @property
    def size(self):
        """Returns the size of the linked list"""
        return self._size
    

    def clear(self):
        """Clears the list. Removes all the items inside the list"""

        self._head = None
        self._size = 0


    def append( self, value: Any ):
        """Appends a new value at the end of the list"""
        
        node =  Node(value)

        if self._head is None:
            self._head = node
            self._tail = self._head
        else:
            self._tail.next = node
            self._tail = self._tail.next
        self._size += 1


    def pop(self, index: int = -1) -> Any:
        """Removes an item from the list.

        Raises IndexError if the list is empty or index is out of range.

        Time complexity: O(n) where n is the length of the nodes.

        Args:
            index: Index of the item to be removed.

        Returns:
            Any: Item removed.
        """

        if index < 0:
            index = self._size + index

        if self._head is None or index > self._size - 1:
            raise IndexError('Index out of range.')

        prev_pointer = self._head

        value: Node
        for idx, value in enumerate(self):
            if idx == index:
                if value == self._head:
                    self._head = None
                    self._tail = None
                else:
                    prev_pointer.next = value.next
                    self._tail = prev_pointer
                    self._size -= 1

                return value

            prev_pointer = value


    def index(self, target: object):
        """Return first index of value.

        Raises ValueError if the value is not present.

        Time complexity: O(n) where n is the length of nodes.

        Args:
            target: Value to look up.

        Returns:
            int: Index of the value.
        """

        item: Node
        for index, item in enumerate(self):
            if item.value == target:
                return index

        raise ValueError(f'{target} is not in list')


    def count(self, target: object) -> int:
        """Counts the number of occurrences of the provided value.

        Time complexity: O(n) where n is the length of the nodes.

        Args:
            target: Value to be counted.

        Returns:
            int: Number of occurrences.
        """

        count = 0

        item: Node
        for item in self:
            if item.value == target:
                count += 1

        return count


    def insert(self, index: int, value: object):
        """Insert before index.

        Time complexity: O(n)

        Args:
            index: Index to insert before.
            value: Value to insert.
        """

        if index < 0:
            index = self._size + index

        if index > self._size:
            raise IndexError('Index out of range.')

        new_node = Node(value)

        if index == 0:
            new_node.next = self._head
            self._head = new_node
            if self._tail is None:
                self._tail = new_node
        else:
            prev_node = self._head
            current_node = self._head.next
            current_index = 1

            while current_node is not None:
                if current_index == index:
                    prev_node.next = new_node
                    new_node.next = current_node
                    if current_node == self._tail:
                        self._tail = new_node
                    break

                prev_node = current_node
                current_node = current_node.next
                current_index += 1

        self._size += 1


    def remove(self, value):
        """Removes the first occurrence of value.

        Raises ValueError if the value is not present.

        Args:
            value: Value to be removed.
        """

        common_error = ValueError('Value not found')
        if self._head is None:
            raise common_error

        if self._head.value == value:
            self._head = self._head.next
            self._size -= 1
            return

        prev_node = self._head
        current_node = self._head.next

        while current_node is not None:
            if current_node.value == value:
                prev_node.next = current_node.next

                if current_node == self._tail:
                    self._tail = prev_node

                self._size -= 1
                return

            prev_node = current_node
            current_node = current_node.next

        raise ValueError('Value not found')


    def __iter__(self):
        """Allows to iterate over the list using a generator.

        Time complexity: O(n)

        Returns:
            Iterator[Node]: Iterator over the list.
        """

        if self._head is not None:
            pointer = self._head

            while pointer is not None:
                val = pointer
                pointer = pointer.next

                yield val

        return None

    
    def search(self, target: object) -> bool:
        """Check if the provided value is in the list.

        Time complexity: O(n) where n is the length of the nodes.

        Args:
            target: Value to be searched inside the list.

        Returns:
            bool: True if found. False otherwise.
        """
        current_node = self._head
        while current_node is not None:
            if current_node.value == target:
                return True
            current_node = current_node.next
        return False


    def __delitem__(self, index: Union[int, slice]):
        """Deletes an item from the list.

        Time complexity: O(n)

        Args:
            index: Index of the item to be removed.

        Returns:
            None
        """

        if isinstance(index, slice):
            list_items = list(self)

            del list_items[index]

            self.clear()
            for item in list_items:
                self.append(item)

        else:

            if index > self._size - 1:
                raise IndexError('Index out of range.')

            if index == 0:
                self._head = self._head.next

            else:
                prev_pointer: Optional[Node] = None

                item: Node
                for idx, item in enumerate(self):
                    if idx == index:
                        prev_pointer.next = item.next

                        if item == self._tail:
                            self._tail = prev_pointer

                        break
                    prev_pointer = item

            self._size -= 1

        return None


    def __setitem__(self, index: Union[int, slice], value: Union[object, Iterable]):
        """Set self[key] to value.

        Time complexity: O(n)

        Args:
            index: Index to be set.
            value: Value to assign.
        """

        if isinstance(index, slice):
            if not isinstance(value, Iterable):
                raise TypeError('can only assign an iterable')

            if len(value) > 0:
                list_items = list(self)
                list_items[index] = value

                self.clear()
                for item in list_items:
                    self.append(item)

        else:

            if index < 0:
                index = self._size + index

            if index > self._size - 1:
                raise IndexError('list assignment index out of range')

            if index == 0:
                self._head.value = value

            else:
                item: Node
                for idx, item in enumerate(self):
                    if idx == index:
                        item.value = value
                        break 


    def print_elements(self):
        """Imprime los elementos de la lista"""

        current_node = self._head
        while current_node is not None:
            print(current_node.value)
            current_node = current_node.next


if __name__ == '__main__':
    # Crear una instancia de la clase SinglyLinkedList
    linked_list = SinglyLinkedList(1, 2, 3, 4, 5)

    # Obtener el tamaño de la lista
    print("Tamaño de la lista:", linked_list.size)

    # Imprimir los elementos de la lista
    print("Elementos de la lista:")
    linked_list.print_elements()

    # Obtener el índice de un elemento en la lista
    target = 3
    index = linked_list.index(target)
    print(f"Índice del elemento {target}: {index}")

    # Contar las ocurrencias de un elemento en la lista
    target_value = 2
    count = linked_list.count(target_value)
    print(f"Número de ocurrencias del elemento {target_value}: {count}")

    # Insertar un elemento en la lista
    linked_list.insert(2, 6)

    # Imprimir los elementos actualizados de la lista
    print("Elementos de la lista después de la inserción:")
    linked_list.print_elements()

    # Eliminar un elemento de la lista
    removed_item = linked_list.pop(2)
    print("Elemento eliminado:", removed_item.value)

    # Imprimir los elementos actualizados de la lista
    print("Elementos de la lista después de la elminación:")
    linked_list.print_elements()

    # Buscar un elemento en la lista
    target = 10
    if linked_list.search(target):
        print(f"El elemento {target} se encuentra en la lista.")
    else:
        print(f"El elemento {target} no se encuentra en la lista.")

    # Eliminar un elemento específico de la lista
    target_value = 2
    linked_list.remove(target_value)

    # Imprimir los elementos actualizados de la lista
    print("Elementos de la lista después de la eliminación:")
    linked_list.print_elements()

    # Limpiar la lista
    linked_list.clear()
    print("Lista después de borrar todos los elementos:")
    linked_list.print_elements()

    # Agregar nuevos elementos a la lista
    linked_list.append(7)
    linked_list.append(8)
    linked_list.append(9)

    # Imprimir los elementos actualizados de la lista
    print("Elementos de la lista después de agregar nuevos elementos:")
    linked_list.print_elements()
    
