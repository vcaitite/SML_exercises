NULL = -1  # The null link


class HeapManager:
    """ Implements a very simple heap manager."""

    def __init__(self, initialMemory):
        """ Constructor.Parameter initialMemory is the array of
        data that we will use to represent the memory."""
        self.memory = initialMemory
        self.memory[0] = self.memory.__len__()
        self.memory[1] = NULL
        self.freeStart = 0

    def allocate(self, requestSize):
        """ Allocates a block of data, and return its address.The
        parameter requestSize is the amount of space that must be
        allocated. """
        size = requestSize + 1
        # Do best-fit search: This strategy consists of going through
        # the list of free blocks in search of the piece of memory
        # that is the smallest possible but that is large enough to
        # accommodate the requested memory area. If an area of exactly
        # the size of the request is found, then the search can be stopped,
        # returning the area found. Otherwise, the entire list must be
        # scanned, looking for the best piece of memory.
        p = self.freeStart
        lag = NULL
        address = NULL
        if self.memory[p] >= size:
            address = p
        while p != NULL and self.memory[p] != size:
            #lag = p
            p = self.memory[p + 1]
            if self.memory[p] >= size and self.memory[p] < self.memory[address]:
                lag = address
                address = p
        if address == NULL:
            raise MemoryError()

        nextFree = self.memory[address + 1]
        # Now address is the index of a block of sufficient size,
        unused = self.memory[address] - size
        if unused > 1:
            nextFree = address + size
            self.memory[nextFree] = unused
            self.memory[nextFree + 1] = self.memory[address + 1]
            self.memory[address] = size
        if lag == NULL:
            self.freeStart = nextFree
        else:
            self.memory[lag + 1] = nextFree
        return address + 1

    # Part that was developed by Vítor Caitité:
    def deallocate(self, address):
        """Deallocates the block of data that starts at address. This works only
        if the block address is one that was returned by allocate and has not
        yet been deallocated."""
        if self.freeStart == NULL:
            self.freeStart = address - 1
        elif address < self.freeStart:
            self.memory[address] = self.freeStart
            self.freeStart = address - 1
        elif address > self.freeStart:
            nextFree = self.memory[self.freeStart + 1]
            if nextFree == NULL:
                self.memory[self.freeStart + 1] = address - 1
            else:
                lag = NULL
                while nextFree < address and nextFree != NULL:
                    lag = nextFree
                    nextFree = self.memory[nextFree + 1]
                self.memory[lag + 1] = address - 1
                self.memory[address] = nextFree


# Test developed by Vítor Caitité
def test():
    h = HeapManager([0 for x in range(0, 10)])
    a = h.allocate(3)
    print(" a = ", a, " , Memory = ", h.memory)
    b = h.allocate(2)
    print(" b = ", b, " , Memory = ", h.memory)
    h.deallocate(a)
    print(" Memory = ", h.memory, ", FreeStart = ", h.freeStart)
    c = h.allocate(2)
    print(" c = ", c, " , Memory = ", h.memory)
    d = h.allocate(3)
    print(" d = ", d, " , Memory = ", h.memory)
    h.deallocate(b)
    print(" Memory = ", h.memory, ", FreeStart = ", h.freeStart)
    h.deallocate(c)
    print(" Memory = ", h.memory, ", FreeStart = ", h.freeStart)
    e = h.allocate(2)
    print(" e = ", e, " , Memory = ", h.memory)


test()
