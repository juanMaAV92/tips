
# Hacer un array en Python 

class Array:

    def __init__( self, capacity, fill_value = None ) -> None:
        self.items = list()
        for i in range(capacity):
            self.items.append( fill_value )
    

    def __len__( self ):
        return len( self.items )

    def __str__( self ) -> str:
        return str( self.items )
    
    def __iter__( self ):
        return iter( self.items )
    
    def __getitem__( self, index ):
        return self.items[ index ] 
    
    def __setitem__( self, index, new_item ):
        self.items[ index ]= new_item


if __name__ == "__main__":
    
    menu = Array( 5 )
    print( len( menu ) )
    print( menu )

    valores = ["Opción 1", "Opción 2", "Opción 3", "Opción 4", "Opción 5"]
    menu.items = [valor for valor in valores]
    print( menu.__str__() )