(define-library (srfi 69)
    (export
        make-hash-table 
        hash-table? 
        alist->hash-table
        ;hash-table-equivalence-function 
        ;hash-table-hash-function
        hash-table-ref 
        hash-table-ref/default 
        ;hash-table-set! 
        ;TODO: should implement this: hash-table-delete! 
        hash-table-exists? 
        hash-table-update! 
        ;hash-table-update!/default
        hash-table-size 
        hash-table-keys 
        hash-table-values 
        hash-table-walk 
        hash-table-fold 
        hash-table->alist 
        hash-table-copy 
        hash-table-merge!
        ;hash 
        ;string-hash 
        ;string-ci-hash 
        ;hash-by-identity
    )
    (import (scheme)))
