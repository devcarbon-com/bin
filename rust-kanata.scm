(define-module (rust-kanata)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages version-control)
  #:use-module (srfi srfi-1))

(define-public rust-time-macros-0.2
  (package
   (name "rust-time-macros")
   (version "0.2.6")
   (source (origin
            (method url-fetch)
            (uri (crate-uri "time-macros" version))
            (file-name (string-append name "-" version ".tar.gz"))
            (sha256
             (base32
              "1chnpb27nishwa4rn4acr2l9ha5wxqw2dikmqnay99scafgzjryr"))))
   (build-system cargo-build-system)
   (arguments
    `(#:skip-build? #t
      #:cargo-inputs (("rust-time-core" ,rust-time-core-0.1))))
   (home-page "https://github.com/time-rs/time")
   (synopsis
    "    Procedural macros for the time crate.
    This crate is an implementation detail and should not be relied upon directly.
")
   (description
    "Procedural macros for the time crate.  This crate is an implementation detail
and should not be relied upon directly.")
   (license (list license:expat license:asl2.0))))

(define-public rust-time-core-0.1
  (package
    (name "rust-time-core")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "time-core" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1z803zwzyh16nk3c4nmkw8v69nyj0r4v8s3yag68mvya38gkw59f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/time-rs/time")
    (synopsis
     "This crate is an implementation detail and should not be relied upon directly.")
    (description
     "This crate is an implementation detail and should not be relied upon directly.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-threads-0.1
  (package
    (name "rust-num-threads")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "num_threads" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0i5vmffsv6g79z869flp1sja69g1gapddjagdw1k3q9f3l2cw698"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/jhpratt/num_threads")
    (synopsis
     "A minimal library that determines the number of running threads for the current process.")
    (description
     "This package provides a minimal library that determines the number of running
threads for the current process.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-shared-0.2
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.83")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasm-bindgen-shared" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0zzz9xfi3fp2n5ihhlq8ws7674a2ir2frvsd1d7yr4sxad2w0f0w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.
")
    (description
     "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-backend-0.2
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.83")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasm-bindgen-backend" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0hhigjqrb31axh7jgmb5y8akdpxqx8gvjs6ja9xmbc3r4lrzp3sc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Backend code generation of the wasm-bindgen tool
")
    (description "Backend code generation of the wasm-bindgen tool")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-support-0.2
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.83")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasm-bindgen-macro-support" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0g0rmawgkhfyfgjj2mvch7gvz1nzfnfmya0kgcq3xwn53l2hrg07"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-wasm-bindgen-backend" ,rust-wasm-bindgen-backend-0.2)
                       ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate
")
    (description
     "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in
the shared backend crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-0.2
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.83")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasm-bindgen-macro" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0468wshk7bp78mnglcpmrb6m4q7x2fp9pz6ybk3wpri683wy0aq5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-quote" ,rust-quote-1)
                       ("rust-wasm-bindgen-macro-support" ,rust-wasm-bindgen-macro-support-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Definition of the `#[wasm_bindgen]` attribute, an internal dependency
")
    (description
     "Definition of the `#[wasm_bindgen]` attribute, an internal dependency")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-0.2
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.83")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasm-bindgen" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0s3ji0k8p261glnsxi5rkd34v2pv67h96blb29yf32zcxsngbyga"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-wasm-bindgen-macro" ,rust-wasm-bindgen-macro-0.2))))
    (home-page "https://rustwasm.github.io/")
    (synopsis "Easy support for interacting between JS and Rust.
")
    (description "Easy support for interacting between JS and Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-js-sys-0.3
  (package
    (name "rust-js-sys")
    (version "0.3.60")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "js-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0isslargvb1cd5xfk73xrxqni3p2ksharkp22swmc25zwgrrsh29"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.
")
    (description
     "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-time-0.3
  (package
    (name "rust-time")
    (version "0.3.17")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "time" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0xl3lg062kzfs2byg8aigx98wygd767rhjs3lsy37ggf2x3byqd5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-itoa" ,rust-itoa-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-num-threads" ,rust-num-threads-0.1)
                       ("rust-quickcheck" ,rust-quickcheck-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-time-core" ,rust-time-core-0.1)
                       ("rust-time-macros" ,rust-time-macros-0.2))))
    (home-page "https://github.com/time-rs/time")
    (synopsis "Utilities for working with time-related functions in Rust.
")
    (description "Utilities for working with time-related functions in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-simplelog-0.12
  (package
    (name "rust-simplelog")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "simplelog" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "11m7f2djih4413fdjk9lkkhwxq7lsqf86z00bd4xsx6ym82gzps8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ansi-term" ,rust-ansi-term-0.12)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-paris" ,rust-paris-1)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-time" ,rust-time-0.3))))
    (home-page "https://github.com/drakulix/simplelog.rs")
    (synopsis "A simple and easy-to-use logging facility for Rust's log crate")
    (description
     "This package provides a simple and easy-to-use logging facility for Rust's log
crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-signal-hook-0.3
  (package
    (name "rust-signal-hook")
    (version "0.3.14")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "signal-hook" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "17g2bc1c74m1zvnfxzwym0c8wczbvjg5qm3bq97ld616kvlbalx2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-signal-hook-registry" ,rust-signal-hook-registry-1))))
    (home-page "https://github.com/vorner/signal-hook")
    (synopsis "Unix signal handling")
    (description "Unix signal handling")
    (license (list license:asl2.0 license:expat))))

(define-public rust-stretch-0.3
  (package
    (name "rust-stretch")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "stretch" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "11vdmli145j6yakgr7hkzgbnz1kqsb9rq3zrxl1g6dz11k9cc3bv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libm" ,rust-libm-0.1))))
    (home-page "https://github.com/vislyhq/stretch")
    (synopsis "High performance & cross-platform Flexbox implementation")
    (description "High performance & cross-platform Flexbox implementation")
    (license (list license:unlicense))))

(define-public rust-unicode-segmentation-1
  (package
    (name "rust-unicode-segmentation")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "unicode-segmentation" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0nks0izrlfrc26hkbs3v3rdjk7lkrflffv2ajhgf0gbql19g1nqg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/unicode-rs/unicode-segmentation")
    (synopsis
     "This crate provides Grapheme Cluster, Word and Sentence boundaries
according to Unicode Standard Annex #29 rules.
")
    (description
     "This crate provides Grapheme Cluster, Word and Sentence boundaries according to
Unicode Standard Annex #29 rules.")
    (license (list license:expat license:asl2.0))))

(define-public rust-newline-converter-0.2
  (package
    (name "rust-newline-converter")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "newline-converter" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "03y000bbxnwzb7aipxyw7gm68b1bd8dv7illz03l4qw7bjfx0w8z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-segmentation" ,rust-unicode-segmentation-1))))
    (home-page
     "https://github.com/spitfire05/rnc/tree/master/crates/newline-converter")
    (synopsis "Newline byte converter library")
    (description "Newline byte converter library")
    (license license:expat)))

(define-public rust-muldiv-0.2
  (package
    (name "rust-muldiv")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "muldiv" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "014jlry2l2ph56mp8knw65637hh49q7fmrraim2bx9vz0a638684"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/sdroege/rust-muldiv")
    (synopsis
     "Provides a trait for numeric types to perform combined multiplication and
division with overflow protection
")
    (description
     "This package provides a trait for numeric types to perform combined
multiplication and division with overflow protection")
    (license license:expat)))

(define-public rust-native-windows-gui-1
  (package
    (name "rust-native-windows-gui")
    (version "1.0.13")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "native-windows-gui" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0m44lbslzvs04i4rgcphld23qlwf9zzlzmspgimyp3gnd6k06w2g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-muldiv" ,rust-muldiv-0.2)
                       ("rust-newline-converter" ,rust-newline-converter-0.2)
                       ("rust-plotters" ,rust-plotters-0.3)
                       ("rust-plotters-backend" ,rust-plotters-backend-0.3)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.3)
                       ("rust-stretch" ,rust-stretch-0.3)
                       ("rust-winapi" ,rust-winapi-0.3)
                       ("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page "https://github.com/gabdube/native-windows-gui")
    (synopsis
     "A rust library to develop native GUI applications on the desktop for Microsoft Windows. Native-windows-gui wraps the native win32 window controls in a rustic API")
    (description
     "This package provides a rust library to develop native GUI applications on the
desktop for Microsoft Windows.  Native-windows-gui wraps the native win32 window
controls in a rustic API")
    (license license:expat)))

(define-public rust-usb-device-0.2
  (package
    (name "rust-usb-device")
    (version "0.2.9")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "usb-device" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0205a850jhw9gb96scwfx1k4iwpjvighvz3m80mjkda9r2nw6v0z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-defmt" ,rust-defmt-0.3))))
    (home-page "https://github.com/mvirkkunen/usb-device")
    (synopsis "Experimental device-side USB stack for embedded devices.")
    (description "Experimental device-side USB stack for embedded devices.")
    (license license:expat)))

(define-public rust-kanata-keyberon-macros-0.1
  (package
    (name "rust-kanata-keyberon-macros")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "kanata-keyberon-macros" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1722smq92y0zr638wz8drkfb83rsnnaqpi0cvjr3znsyqcm6vdnv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1))))
    (home-page "")
    (synopsis "Macros for keyberon. Fork for kanata project")
    (description "Macros for keyberon.  Fork for kanata project")
    (license license:expat)))

(define-public rust-atomic-polyfill-0.1
  (package
    (name "rust-atomic-polyfill")
    (version "0.1.11")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "atomic-polyfill" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0a4vd4zq75xmwbi33flf35qmm2nf99kx3hx2m21lslqnyfrpxzz3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-critical-section" ,rust-critical-section-1))))
    (home-page "https://github.com/embassy-rs/atomic-polyfill")
    (synopsis "Atomic polyfills, for targets where they're not available.")
    (description "Atomic polyfills, for targets where they're not available.")
    (license (list license:expat license:asl2.0))))

(define-public rust-heapless-0.7
  (package
    (name "rust-heapless")
    (version "0.7.16")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "heapless" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0hq7ifnzpdj9rc06rhys4qa3qkr6q3k01kwfca0ak7lbl4jbq16v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-defmt" ,rust-defmt-0.3)
                       ("rust-hash32" ,rust-hash32-0.2)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-spin" ,rust-spin-0.9)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1)
                       ("rust-ufmt-write" ,rust-ufmt-write-0.1))))
    (home-page "https://github.com/japaric/heapless")
    (synopsis
     "`static` friendly data structures that don't require dynamic memory allocation")
    (description
     "`static` friendly data structures that don't require dynamic memory allocation")
    (license (list license:expat license:asl2.0))))

(define-public rust-arraydeque-0.4
  (package
    (name "rust-arraydeque")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "arraydeque" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1n4appvjfrmxkc4x0v8ivpzwqf1z6pqx2caxk98116fqkgbd7zzh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-generic-array" ,rust-generic-array-0.12))))
    (home-page "https://github.com/andylokandy/arraydeque")
    (synopsis
     "A ring buffer with a fixed capacity, which can be stored on the stack.")
    (description
     "This package provides a ring buffer with a fixed capacity, which can be stored
on the stack.")
    (license (list license:expat license:asl2.0))))

(define-public rust-kanata-keyberon-0.5
  (package
    (name "rust-kanata-keyberon")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "kanata-keyberon" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0qp1qkn7mg2w668nsllf3yb4sp22x1j85pn7p9hw7y45g04i5z21"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arraydeque" ,rust-arraydeque-0.4)
                       ("rust-either" ,rust-either-1)
                       ("rust-embedded-hal" ,rust-embedded-hal-0.2)
                       ("rust-heapless" ,rust-heapless-0.7)
                       ("rust-kanata-keyberon-macros" ,rust-kanata-keyberon-macros-0.1)
                       ("rust-usb-device" ,rust-usb-device-0.2))))
    (home-page "https://github.com/TeXitoi/keyberon")
    (synopsis
     "Pure Rust keyboard firmware. Fork intended for use with kanata.")
    (description
     "Pure Rust keyboard firmware.  Fork intended for use with kanata.")
    (license license:expat)))

(define-public rust-interception-sys-0.1
  (package
    (name "rust-interception-sys")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "interception-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1lgwbml7gzq5a5rriy708w68gx6yiw9cdg7xy2c5vsrrck7pbs5b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bozbez/interception-sys")
    (synopsis "FFI bindings for Interception")
    (description "FFI bindings for Interception")
    (license license:lgpl3)))

(define-public rust-interception-0.1
  (package
    (name "rust-interception")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "interception" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1cqp5g83l7m76gjr3csnds9nsf8024m8jyw0x73g7p3gihhxrd3n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-interception-sys" ,rust-interception-sys-0.1)
                       ("rust-num-enum" ,rust-num-enum-0.5)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bozbez/interception-rs")
    (synopsis "Safe wrapper for Interception")
    (description "Safe wrapper for Interception")
    (license (list license:expat license:asl2.0))))

(define-public rust-wyz-0.5
  (package
    (name "rust-wyz")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wyz" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1vdrfy7i2bznnzjdl9vvrzljvs4s3qm8bnlgqwln6a941gy61wq5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-once-cell" ,rust-once-cell-1)
                       ("rust-tap" ,rust-tap-1)
                       ("rust-typemap" ,rust-typemap-0.3))))
    (home-page "https://myrrlyn.net/crates/wyz")
    (synopsis "myrrlynâs utility collection")
    (description "myrrlynâs utility collection")
    (license license:expat)))

(define-public rust-radium-0.7
  (package
    (name "rust-radium")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "radium" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "02cxfi3ky3c4yhyqx9axqwhyaca804ws46nn4gc1imbk94nzycyw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://ferrilab.github.io/ferrilab")
    (synopsis "Portable interfaces for maybe-atomic types")
    (description "Portable interfaces for maybe-atomic types")
    (license license:expat)))

(define-public rust-funty-2
  (package
    (name "rust-funty")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "funty" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "177w048bm0046qlzvp33ag3ghqkqw4ncpzcm5lq36gxf2lla7mg6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bitvecto-rs/funty")
    (synopsis "Trait generalization over the primitive types")
    (description "Trait generalization over the primitive types")
    (license license:expat)))

(define-public rust-bitvec-1
  (package
    (name "rust-bitvec")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "bitvec" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "173ydyj2q5vwj88k6xgjnfsshs4x9wbvjjv7sm0h36r34hn87hhv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-funty" ,rust-funty-2)
                       ("rust-radium" ,rust-radium-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-tap" ,rust-tap-1)
                       ("rust-wyz" ,rust-wyz-0.5))))
    (home-page "https://bitvecto-rs.github.io/bitvec")
    (synopsis "Addresses memory by bits, for packed collections and bitfields")
    (description
     "Addresses memory by bits, for packed collections and bitfields")
    (license license:expat)))

(define-public rust-evdev-0.12
  (package
    (name "rust-evdev")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "evdev" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ww35bkqf060nl6x2vfg0frd6ql470c90l2ah68b3mngr3y5kv9b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitvec" ,rust-bitvec-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-nix" ,rust-nix-0.23)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/cmr/evdev")
    (synopsis "evdev interface for Linux")
    (description "evdev interface for Linux")
    (license (list license:asl2.0 license:expat))))

(define-public rust-unicode-linebreak-0.1
  (package
    (name "rust-unicode-linebreak")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "unicode-linebreak" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0drixqb16bzmabd5d8ldvar5760rxy6nxzszhlsqnasl3bisvyn5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hashbrown" ,rust-hashbrown-0.12)
                       ("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/axelf4/unicode-linebreak")
    (synopsis "Implementation of the Unicode Line Breaking Algorithm")
    (description "Implementation of the Unicode Line Breaking Algorithm")
    (license license:asl2.0)))

(define-public rust-textwrap-0.16
  (package
    (name "rust-textwrap")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "textwrap" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0gbwkjf15l6p3x2rkr75fa4cpcs1ly4c8pmlfx5bl6zybcm24ai2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hyphenation" ,rust-hyphenation-0.8)
                       ("rust-smawk" ,rust-smawk-0.3)
                       ("rust-terminal-size" ,rust-terminal-size-0.2)
                       ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/mgeisler/textwrap")
    (synopsis
     "Powerful library for word wrapping, indenting, and dedenting strings")
    (description
     "Powerful library for word wrapping, indenting, and dedenting strings")
    (license license:expat)))

(define-public rust-linux-raw-sys-0.1
  (package
    (name "rust-linux-raw-sys")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "linux-raw-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1926520si5wkn4m6iz6ka97ya5q1dgr8ib3fd705fscfgixgflgh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/sunfishcode/linux-raw-sys")
    (synopsis "Generated bindings for Linux's userspace API")
    (description "Generated bindings for Linux's userspace API")
    (license (list license:asl2.0 license:asl2.0
                   license:expat))))

(define-public rust-socket2-0.4
  (package
    (name "rust-socket2")
    (version "0.4.7")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "socket2" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1gaf57dc16s1lfyv388w9vdl9qay15xds78jcwakml9kj3dx5qh2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rust-lang/socket2")
    (synopsis
     "Utilities for handling networking sockets with a maximal amount of configuration
possible intended.
")
    (description
     "Utilities for handling networking sockets with a maximal amount of configuration
possible intended.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lock-api-0.4
  (package
    (name "rust-lock-api")
    (version "0.4.9")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "lock_api" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1py41vk243hwk345nhkn5nw0bd4m03gzjmprdjqq6rg5dwv12l23"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-autocfg" ,rust-autocfg-1)
                       ("rust-owning-ref" ,rust-owning-ref-0.4)
                       ("rust-scopeguard" ,rust-scopeguard-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/Amanieu/parking_lot")
    (synopsis
     "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.")
    (description
     "Wrappers to create fully-featured Mutex and RwLock types.  Compatible with
no_std.")
    (license (list license:expat license:asl2.0))))

(define-public rust-parking-lot-0.12
  (package
    (name "rust-parking-lot")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "parking_lot" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "13r2xk7mnxfc5g0g6dkdxqdqad99j7s7z8zhzz4npw5r0g0v4hip"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lock-api" ,rust-lock-api-0.4)
                       ("rust-parking-lot-core" ,rust-parking-lot-core-0.9))))
    (home-page "https://github.com/Amanieu/parking_lot")
    (synopsis
     "More compact and efficient implementations of the standard synchronization primitives.")
    (description
     "More compact and efficient implementations of the standard synchronization
primitives.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-msvc-0.42
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_x86_64_msvc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1zfgzsmc0j5p9yx25j15lb1yh45mazl4hhjdvfqqhcm16snn0xj4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnullvm-0.42
  (package
    (name "rust-windows-x86-64-gnullvm")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_x86_64_gnullvm" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0qq41m3zkakkmch9x4x30lgv0sy3zh4jpdpxch6jp8ns6brgv2v2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnu-0.42
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_x86_64_gnu" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0icwd66wd6p9hhzds93333wy2knlqbyiynf2rfy7xqc528i0y161"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.42
  (package
    (name "rust-windows-i686-msvc")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_i686_msvc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "01966w2707qrw183lqg62i1as614i88m5a0s6pzxdpby64i12kdz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.42
  (package
    (name "rust-windows-i686-gnu")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_i686_gnu" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0h6n8mqjfq1rk4vpr9gz8md1b8f7bqksiymivdxvlc6mi998ff6y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-msvc-0.42
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_aarch64_msvc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1iy6adiaz2956f0kcl2wfdjx49ayv2lp11glkxxc85pw7xkip2sc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-gnullvm-0.42
  (package
    (name "rust-windows-aarch64-gnullvm")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_aarch64_gnullvm" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0256d14kqpiniwcm6y2yfj7jbzdvvj4l6i65r5zyrza36bl6964c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-sys-0.42
  (package
    (name "rust-windows-sys")
    (version "0.42.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "19waf8aryvyq9pzk0gamgfwjycgzk4gnrazpfvv171cby0h1hgjs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-aarch64-gnullvm" ,rust-windows-aarch64-gnullvm-0.42)
                       ("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.42)
                       ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.42)
                       ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.42)
                       ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.42)
                       ("rust-windows-x86-64-gnullvm" ,rust-windows-x86-64-gnullvm-0.42)
                       ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.42))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "Rust for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasi-0.11
  (package
    (name "rust-wasi")
    (version "0.11.0+wasi-snapshot-preview1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasi" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "08z4hxwkpdpalxjps1ai9y7ihin26y9f476i53dv98v45gkqg3cw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/bytecodealliance/wasi")
    (synopsis "Experimental WASI API bindings for Rust")
    (description "Experimental WASI API bindings for Rust")
    (license (list license:asl2.0 license:asl2.0
                   license:expat))))

(define-public rust-libc-0.2
  (package
    (name "rust-libc")
    (version "0.2.139")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "libc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0yaz3z56c72p2nfgv2y2zdi8bzi7x3kdq2hzgishgw0da8ky6790"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc.
")
    (description "Raw FFI bindings to platform libraries like libc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mio-0.8
  (package
    (name "rust-mio")
    (version "0.8.5")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "mio" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1pjqn6jvmqkgyykf2z5danqka1rfs3il7w4d0qin8yi062y35mz5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-wasi" ,rust-wasi-0.11)
                       ("rust-windows-sys" ,rust-windows-sys-0.42))))
    (home-page "https://github.com/tokio-rs/mio")
    (synopsis "Lightweight non-blocking IO")
    (description "Lightweight non-blocking IO")
    (license license:expat)))

(define-public rust-autocfg-1
  (package
    (name "rust-autocfg")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "autocfg" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ylp3cb47ylzabimazvbz9ms6ap784zhb6syaz6c1jqpmcmq0s6l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/cuviper/autocfg")
    (synopsis "Automatic cfg for Rust compiler features")
    (description "Automatic cfg for Rust compiler features")
    (license (list license:asl2.0 license:expat))))

(define-public rust-tokio-1
  (package
    (name "rust-tokio")
    (version "1.24.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "tokio" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1fxhf69ih3v28wh73l782pjgd6bkqfq8arr1ip1y7nc1k6ji4yjr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-autocfg" ,rust-autocfg-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-mio" ,rust-mio-0.8)
                       ("rust-num-cpus" ,rust-num-cpus-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-signal-hook-registry" ,rust-signal-hook-registry-1)
                       ("rust-socket2" ,rust-socket2-0.4)
                       ("rust-tokio-macros" ,rust-tokio-macros-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-windows-sys" ,rust-windows-sys-0.42))))
    (home-page "https://tokio.rs")
    (synopsis
     "An event-driven, non-blocking I/O platform for writing asynchronous I/O
backed applications.
")
    (description
     "An event-driven, non-blocking I/O platform for writing asynchronous I/O backed
applications.")
    (license license:expat)))

(define-public rust-fs-err-2
  (package
    (name "rust-fs-err")
    (version "2.9.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "fs-err" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0ha5ysh5jz2hxlhmydc82pjcycps6ips4jyni41jy8cr48jzli88"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/andrewhickman/fs-err")
    (synopsis
     "A drop-in replacement for std::fs with more helpful error messages.")
    (description
     "This package provides a drop-in replacement for std::fs with more helpful error
messages.")
    (license (list license:expat license:asl2.0))))

(define-public rust-async-std-1
  (package
    (name "rust-async-std")
    (version "1.12.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "async-std" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0pbgxhyb97h4n0451r26njvr20ywqsbm6y1wjllnp4if82s5nmk2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-attributes" ,rust-async-attributes-1)
                       ("rust-async-channel" ,rust-async-channel-1)
                       ("rust-async-global-executor" ,rust-async-global-executor-2)
                       ("rust-async-io" ,rust-async-io-1)
                       ("rust-async-lock" ,rust-async-lock-2)
                       ("rust-async-process" ,rust-async-process-1)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-1)
                       ("rust-gloo-timers" ,rust-gloo-timers-0.2)
                       ("rust-kv-log-macro" ,rust-kv-log-macro-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-pin-utils" ,rust-pin-utils-0.1)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-surf" ,rust-surf-2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4))))
    (home-page "https://async.rs")
    (synopsis "Async version of the Rust standard library")
    (description "Async version of the Rust standard library")
    (license (list license:asl2.0 license:expat))))

(define-public rust-io-lifetimes-1
  (package
    (name "rust-io-lifetimes")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "io-lifetimes" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "17lfpl3p4ja0l217zkhgjqssyg1ris9imbc46ka9wjqvr7wcdmp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-fs-err" ,rust-fs-err-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mio" ,rust-mio-0.8)
                       ("rust-os-pipe" ,rust-os-pipe-1)
                       ("rust-socket2" ,rust-socket2-0.4)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.42))))
    (home-page "https://github.com/sunfishcode/io-lifetimes")
    (synopsis "A low-level I/O ownership and borrowing library")
    (description
     "This package provides a low-level I/O ownership and borrowing library")
    (license (list license:asl2.0 license:asl2.0
                   license:expat))))

(define-public rust-errno-0.2
  (package
    (name "rust-errno")
    (version "0.2.8")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "errno" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "18cnqgk8r6lq1n5cfy3bryiyz9zkqr10dxj49sa3fkzfamih8fgn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-errno-dragonfly" ,rust-errno-dragonfly-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/lambda-fairy/rust-errno")
    (synopsis "Cross-platform interface to the `errno` variable.")
    (description "Cross-platform interface to the `errno` variable.")
    (license (list license:expat license:asl2.0))))

(define-public rust-compiler-builtins-0.1
  (package
    (name "rust-compiler-builtins")
    (version "0.1.86")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "compiler_builtins" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "01gjkxj014nsgjl63zpa5d5i3ra3ri0cpsqkmgbrhq2piv49ibjx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/compiler-builtins")
    (synopsis
     "Compiler intrinsics used by the Rust compiler. Also available for other targets
if necessary!
")
    (description
     "Compiler intrinsics used by the Rust compiler.  Also available for other targets
if necessary!")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustix-0.36
  (package
    (name "rust-rustix")
    (version "0.36.7")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "rustix" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "00qvr05clvkp5h228bg42rxiw1fr1vi65r0imfwzpdwmng2fpzfl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-errno" ,rust-errno-0.2)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-linux-raw-sys" ,rust-linux-raw-sys-0.1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.42))))
    (home-page "https://github.com/bytecodealliance/rustix")
    (synopsis "Safe Rust bindings to POSIX/Unix/Linux/Winsock2-like syscalls")
    (description
     "Safe Rust bindings to POSIX/Unix/Linux/Winsock2-like syscalls")
    (license (list license:asl2.0 license:asl2.0
                   license:expat))))

(define-public rust-terminal-size-0.2
  (package
    (name "rust-terminal-size")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "terminal_size" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "01qrl8apw7psj72ii4lrdqcvy73n4g8d5y4iskmrvdm2ifd0h86b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustix" ,rust-rustix-0.36)
                       ("rust-windows-sys" ,rust-windows-sys-0.42))))
    (home-page "https://github.com/eminence/terminal-size")
    (synopsis "Gets the size of your Linux or Windows terminal")
    (description "Gets the size of your Linux or Windows terminal")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-lex-0.2
  (package
    (name "rust-clap-lex")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "clap_lex" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ib1a9v55ybnaws11l63az0jgz5xiy24jkdgsmyl7grcm3sz4l18"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-os-str-bytes" ,rust-os-str-bytes-6))))
    (home-page "https://github.com/clap-rs/clap/tree/master/clap_lex")
    (synopsis "Minimal, flexible command line parser")
    (description "Minimal, flexible command line parser")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-derive-3
  (package
    (name "rust-clap-derive")
    (version "3.2.18")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "clap_derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0r9az0cl33xx0i9g18l56l3vd5ayjvcflvza2gdf8jwcab78n37a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/clap-rs/clap/tree/master/clap_derive")
    (synopsis
     "Parse command line argument by defining a struct, derive crate.")
    (description
     "Parse command line argument by defining a struct, derive crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-3
  (package
    (name "rust-clap")
    (version "3.2.23")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "clap" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "19bkwkj49ha7mlip0gxsqb9xmd3jpr7ghvcx1hkx6icqrd2mqrbi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-clap-derive" ,rust-clap-derive-3)
                       ("rust-clap-lex" ,rust-clap-lex-0.2)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-strsim" ,rust-strsim-0.10)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-terminal-size" ,rust-terminal-size-0.2)
                       ("rust-textwrap" ,rust-textwrap-0.16)
                       ("rust-unicase" ,rust-unicase-2)
                       ("rust-yaml-rust" ,rust-yaml-rust-0.4))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "A simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser")
    (license (list license:expat license:asl2.0))))

(define-public rust-kanata-1
  (package
    (name "rust-kanata")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "kanata" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0ha894rf2sz642fc063r60xa46zdl4lw1f7i7cf1gmbmylih8xha"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-clap" ,rust-clap-3)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-encode-unicode" ,rust-encode-unicode-0.3)
                       ("rust-evdev" ,rust-evdev-0.12)
                       ("rust-interception" ,rust-interception-0.1)
                       ("rust-kanata-keyberon" ,rust-kanata-keyberon-0.5)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mio" ,rust-mio-0.8)
                       ("rust-native-windows-gui" ,rust-native-windows-gui-1)
                       ("rust-net2" ,rust-net2-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-radix-trie" ,rust-radix-trie-0.2)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-simplelog" ,rust-simplelog-0.12)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/jtroo/kanata")
    (synopsis "Multi-layer keyboard customization")
    (description "Multi-layer keyboard customization")
    (license license:lgpl3)))




