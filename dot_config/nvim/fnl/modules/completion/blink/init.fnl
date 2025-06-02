[{1 :saghen/blink.cmp
    :dependencies ["rafamadriz/friendly-snippets"]
    :version "1.*"
    :opts {:appearance {:nerd_font_variant :mono}
    :cmdline {:enabled false}
    :completion {:documentation {:auto_show true :auto_show_delay_ms 1000}
    :ghost_text {:enabled true}
    :menu {:draw
        {:columns [[:kind_icon] {1 :label :gap 1}]}}}
    :fuzzy {:implementation :prefer_rust_with_warning}
    :keymap {:preset :enter
    :<Tab> [:select_next :fallback]
    :<S-Tab> [:select_prev :fallback]
    }
    :sources {:default [:lsp :path :snippets :buffer]}}
    :opts-extend [:sources.default]}]

