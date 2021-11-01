(define-trait sip009-nft-trait
    (
        (transfer (uint principal principal) (response bool uint))
        (get-owner (uint) (response (optional principal) uint))
        (get-last-token-id () (response uint uint))
        (get-token-uri (uint) (response (optional (string-ascii 256)) uint))
    )
)
