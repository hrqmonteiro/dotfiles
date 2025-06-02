(fn create-spec-from-map [map]
  (let [spec {}]
    (fn should-include [module]
      (not (or (module:match "^modules%.lang") (module:match "^modules%.config"))))

    (each [category modules0 (pairs map)]
      (each [_ module (ipairs modules0)]
	(local module-name (.. :modules. category "." module))
	(var full-path nil)
	(when (should-include module-name)
	  (if (module:find "/")
	      (let [parts (vim.split module "/")
			  dir (table.concat parts "." 1 (- (length parts) 1))
			  file (. parts (length parts))]
		(set full-path (.. dir "." file)))
	      (set full-path module-name))
	  (table.insert spec {:import full-path}))))
    spec))

(fn get-nvim-directory [] (.. (os.getenv :HOME) :/.config/nvim))

(fn read-servers-from-file [file-path]
  (let [servers {}
        file (io.open file-path :r)]
    (when (not file)
      (let [___antifnl_rtn_1___ {}] (lua "return ___antifnl_rtn_1___")))
    (local content (file:read :*a))
    (file:close)
    (local (chunk load-err) (load content))
    (when (not chunk)
      (let [___antifnl_rtn_1___ {}] (lua "return ___antifnl_rtn_1___")))
    (local (ok result) (pcall chunk))
    (if (and ok (= (type result) :table)) result {})))

(fn process-files [dir patterns servers]
  (let [nvim-dir (get-nvim-directory)
        command (.. "find \"" nvim-dir "/" dir
                    "\" -maxdepth 1 -name \"init.lua\" 2>/dev/null")
        p (io.popen command)
        files (p:read :*a)]
    (p:close)
    (each [file (files:gmatch "[^\r\n]+")]
      (local file-servers (read-servers-from-file file))
      (each [_ server (ipairs file-servers)] (table.insert servers server)))))

(fn process-subdirectories [base-path lang patterns servers]
  (let [nvim-dir (get-nvim-directory)]
    (each [_ pattern (ipairs patterns)]
      (when (pattern:match (.. "^" lang "%..+"))
        (local subdir (pattern:match (.. "^" lang "%.(.+)")))
        (when subdir (local subdir-path (.. base-path "/" lang "/" subdir))
          (process-files subdir-path {} servers))))))

{: create-spec-from-map
 : read-servers-from-file
 : process-files
 : process-subdirectories}
