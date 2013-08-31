; TODO: This file is just a stub for
;       future r7rs library support
;;
;;
;; need to build it out now...
;;
;;

;(define-library (scheme base)
;    (export-all)
;    (import (scheme)))

;;;
;;; husk-scheme
;;; http://justinethier.github.com/husk-scheme
;;;
;;; Written by Justin Ethier
;;;
;;; r5rs equivalent libraries
;;;
;;; This library exposes an R5RS equivalent to 
;;; the corresponding R7RS-small library.
;;;

(define-library (scheme base)
    (export
    *
    +
    -
    /
    <
    <=
    =
    >
    >=
    abs
    and
    append
    apply
    assoc
    assq
    assv
    begin
    boolean?
    bytevector
    bytevector-append
    bytevector-copy
    bytevector-copy!
    bytevector-length
    bytevector-u8-ref
    bytevector?
    caar
    cadr
    call-with-current-continuation
    call-with-values
    call/cc
    car
    case
    cdar
    cddr
    cdr
    ceiling
    char->integer
    char-ready?
    char<=?
    char<?
    char=?
    char>=?
    char>?
    char?
    close-input-port
    close-output-port
    complex?
    cond
    cons
    current-input-port
    current-output-port
    denominator
    do
    dynamic-wind
    eof-object?
    eq?
    equal?
    eqv?
    error
    even?
    exact->inexact ; r5rs definition
    expt
    floor
    for-each
    gcd
    import
    ;include
    ;include-ci
    inexact->exact ; r5rs definition
    input-port?
    integer->char
    integer?
    lcm
    length
    let
    let*
    letrec
    list
    list->string
    list->vector
    list-ref
    list-tail
    list?
    make-bytevector
    make-string
    make-vector
    map
    max
    member
    memq
    memv
    min
    modulo
    negative?
    newline
    not
    null?
    number->string
    number?
    numerator
    odd?
    or
    output-port?
    pair?
    peek-char
    positive?
    procedure?
    quasiquote
    quotient
    rational?
    rationalize
    read-char
    real?
    remainder
    reverse
    round
    string
    string->list
    string->number
    string->symbol
    string->utf8
    string-append
    string-copy
    string-length
    string-ref
    string<=?
    string<?
    string=?
    string>=?
    string>?
    string?
    substring
    symbol->string
    symbol?
    truncate
    utf8->string
    values
    vector
    vector->list
    vector-length
    vector-ref
    vector?
    write-char
    zero?

    ;=>
    ;binary-port?
    ;boolean=?
    ;bytevector-u8-set!
    ;call-with-port
    ;close-port
    ;cond-expand
    ;current-error-port
    ;define
    ;define-record-type
    ;define-syntax
    ;define-values
    ;else
    ;eof-object
    ;error-object-irritants
    ;error-object-message
    ;error-object?
    ;exact
    ;exact-integer-sqrt
    ;exact-integer?
    ;exact?
    ;features
    ;file-error?
    ;floor-quotient
    ;floor-remainder
    ;floor/
    ;flush-output-port
    ;get-output-bytevector
    ;get-output-string
    ;guard
    ;if
    ;inexact
    ;inexact?
    ;input-port-open?
    ;lambda
    ;let*-values
    ;let-syntax
    ;let-values
    ;letrec*
    ;letrec-syntax
    ;list-copy
    ;list-set!
    ;make-list
    ;make-parameter
    ;open-input-bytevector
    ;open-input-string
    ;open-output-bytevector
    ;open-output-string
    ;output-port-open?
    ;parameterize
    ;peek-u8
    ;port?
    ;quote
    ;raise
    ;raise-continuable
    ;read-bytevector
    ;read-bytevector!
    ;read-error?
    ;read-line
    ;read-string
    ;read-u8
    ;set!
    ;set-car!
    ;set-cdr!
    ;square
    ;string->vector
    ;string-copy!
    ;string-fill!
    ;string-for-each
    ;string-map
    ;string-set!
    ;symbol=?
    ;syntax-error
    ;syntax-rules
    ;textual-port?
    ;truncate-quotient
    ;truncate-remainder
    ;truncate/
    ;u8-ready?
    ;unless
    ;unquote
    ;unquote-splicing
    ;vector->string
    ;vector-append
    ;vector-copy
    ;vector-copy!
    ;vector-fill!
    ;vector-for-each
    ;vector-map
    ;vector-set!
    ;when
    ;with-exception-handler
    ;write-bytevector
    ;write-string
    ;write-u8
    )
    (import (scheme r5rs))) ;; TODO: r5rs is not ideal, should use a different env,
                            ;; and can just add the stdlib scheme code here
                            ;; instead of using stdlib.scm.
                            ;;
                            ;; that file's contents will just be interspersed here...
                            ;;
                            ;; not thrilled with the code duplication, but there
                            ;; is probably no helping that, at least in the
                            ;; short term

