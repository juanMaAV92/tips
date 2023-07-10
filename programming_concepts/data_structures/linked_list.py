from node import Node

class SinglyLinkedList:
    
    def __init__(self) -> None:
        self.tail = None
        self.size = 0

    def append( self, data ):
        node =  Node(data)
        if self.tail is None:
            self.tail = node
        else:
            current = self.tail
            while current.next is not None:
                current = current.next
            current.next = node
        self.size += 1

    def get_size(self):
        return self.size


    def __iter__(self):
        current = self.tail
        while current is not None:
            val = current.data
            current = current.next
            yield val

    
    def search(self, data):
        for node in self:
            if data == node:
                print(f"data {data} found!")
                return 
        print(f"data {data} not  found!")


    def delete( self, data):
        current =  self.tail
        previous = self.tail

        while current is not None:
            if current.data == data:
                if current == self.tail:
                    self.tail = current.next
                else:
                    previous.next = current.next
                    self.size -= 1
                    return current.data

            previous = current
            current = current.next

    def clear( self ):
        self.tail = None
        self.size = 0    


if __name__ == '__main__':
    # Ejemplo de uso de SinglyLinkedList
    linked_list = SinglyLinkedList()

    # Agregar elementos a la lista
    linked_list.append(10)
    linked_list.append(20)
    linked_list.append(30)

    # Obtener el tamaño de la lista
    print("Tamaño de la lista:", linked_list.get_size())

    # Recorrer la lista e imprimir los elementos
    print("Elementos de la lista:")
    for element in linked_list:
        print(element)

    # Buscar elementos en la lista
    linked_list.search(20)  # Elemento encontrado
    linked_list.search(40)  # Elemento no encontrado

    # Eliminar un elemento de la lista
    deleted_data = linked_list.delete(20)
    print("Elemento eliminado:", deleted_data)

    # Obtener el tamaño actualizado de la lista
    print("Tamaño de la lista después de eliminar:", linked_list.get_size())

    
