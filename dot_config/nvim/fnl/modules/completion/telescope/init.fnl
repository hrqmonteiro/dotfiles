[{1 :nvim-telescope/telescope.nvim
    :config (fn []
              (local telescope (require :telescope))

              (telescope.setup {:defaults {:dynamic_preview_title true
                               :hidden true
                               :entry_prefix "  "
                               :file_ignore_patterns [".git/" "^node_modules/"]
                               :layout_config {:height 0.8
                                               :horizontal {:preview_cutoff 120
                                                            :preview_width 0.55
                                                            :prompt_position :top
                                                            :vertical {:mirror false}
                                                            :width 0.8}}
                                :border {}
                                :layout_strategy :flex
                                :prompt_prefix "   "
                                :selection_caret "  "
                                :sorting_strategy :ascending}
                              :pickers {:find_files {:hidden true}
                                        :oldfiles {:hidden true :prompt_title "Recent Files"}
                                        :live_grep {:additional_args (fn [_]
                                                                      ["--hidden"])
                                                                       :prompt_title "Search Text"}}
                               }))}]
