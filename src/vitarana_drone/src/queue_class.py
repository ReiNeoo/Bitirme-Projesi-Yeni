class Queue():
    def __init__(self) -> None:
        self.items = []
    
    def items(self):
        return self.items
    def __len__(self):
        return len(self.items)
    def __str__(self):
        return str(self.items)
    
    def is_empty(self):
        return len(self.items) == 0
    
    def enqueue(self, *args):
        for arg in args:
            self.items.append(arg)
    
    def dequeue(self):
        if not self.is_empty():
            return self.items.pop(0) 
        else: 
            raise IndexError("Queue is empty")
    
    def peek(self):
        if not self.is_empty():
            return self.items[0] 
        else:
            raise IndexError("Queue is empty")
    
    def get(self, index: int):
        return self.items[index]
        
class lineQueue(Queue):
    def __init__(self, queue_size) -> None:
        super().__init__()
        self.queue_size = queue_size

    def is_limit(self):
        return len(self.items) >= self.queue_size 
    
    def enqueue(self, *args):
        if len(args) > self.queue_size:
            raise IndexError("arguments beyond queue size")
        
        if not self.is_limit():
            for arg in args:
                self.items.append(arg)
        else:
            for arg in args:
                self.items.pop(0)
                self.items.append(arg)