from cpython cimport 
from cython cimport pointer, sizeof, int
from libc.stdlib cimport malloc, free

cdef class Common:
    pass

cdef class Pool:
    cdef PyObject **workers
    cdef list _workers # Maintains references on Python side
    cdef int n_workers
    cdef Common common
    
    
    cdef init_workers(Pool self):
        cdef int i
        
        #Allocate memory for worker pointers
        self.workers = <PyObject **>malloc(self.n_workers*sizeof(pointer(PyObject)))
        
        #Populate workers
        self._workers = []
        for i in range(self.n_workers):
            self._workers.append(Worker())
            self.workers[i] = <PyObject*>self._workers[i]
    
    def __dealloc__(Pool self):
        free(self.workers)
    
    cdef execute(Pool self):
    
    
    cdef run(Pool self, ):
        
    
cdef class Worker:
    
    cdef execute(Worker self):
        