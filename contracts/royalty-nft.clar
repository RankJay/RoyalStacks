(impl-trait .sip009-nft-trait.sip009-nft-trait)

(define-non-fungible-token royalty-nft uint)

(define-data-var last-id uint u0)
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))

(define-data-var last-token-id uint u0)

(define-public (claim)
  (mint tx-sender))

(define-public (transfer (token-id uint) (sender principal) (recipient principal))
    (begin
        (asserts! (is-eq tx-sender sender) err-not-token-owner)
        (nft-transfer? royalty-nft token-id sender recipient)
    )
)


(define-read-only (get-owner (token-id uint))

  (ok (nft-get-owner? royalty-nft token-id)))

(define-read-only (get-last-token-id)
  (ok (var-get last-id)))

(define-read-only (get-token-uri (token-id uint))
  (ok (some "works well!")))

(define-public (mint (recipient principal))
    (let
        (
            (token-id (+ (var-get last-token-id) u1))
        )
        (asserts! (is-eq tx-sender contract-owner) err-owner-only)
        (try! (nft-mint? royalty-nft token-id recipient))
        (var-set last-token-id token-id)
        (ok token-id)
    )
)
