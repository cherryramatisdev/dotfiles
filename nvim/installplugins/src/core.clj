(ns core
  (:require [clojure.java.shell :as shell]
            [babashka.fs :as fs]
            [clojure.string :as str]))

(def packages ["Olical/conjure"
               "Olical/aniseed"
               "tpope/vim-commentary"
               "tpope/vim-surround"
               "tpope/vim-vinegar"
               "tpope/vim-dispatch"
               "clojure-vim/vim-jack-in"
               "guns/vim-sexp"
               "tpope/vim-sexp-mappings-for-regular-people"
               "lifepillar/vim-mucomplete"
               "nvim-treesitter/nvim-treesitter"
               "srcery-colors/srcery-vim"
               "lewis6991/impatient.nvim"])

(def neovim-package-dir (fs/expand-home "~/.local/share/nvim/site/pack/dev/opt"))

(defn setup-directories []
  (if (not (fs/directory? neovim-package-dir))
    (do
      (fs/create-dir (fs/expand-home "~/.local/share/nvim/site/pack/dev"))
      (fs/create-dir neovim-package-dir))))

(defn- format-clone-command []
  "Given the package constant, map through and create an git clone statement for the correct repository"
  (for [pkg packages]
    (format "git clone https://github.com/%s %s/%s" pkg neovim-package-dir (second (str/split pkg #"/")))))

(defn- run-in-neovim-dir [cmd]
  (shell/with-sh-dir (str neovim-package-dir)
      (shell/sh "sh" "-c" cmd)))

(defn clone-plugins []
  (map #(run-in-neovim-dir %) (format-clone-command)))

(defn -main [& args]
  (println "Creating the directory for plugins...")
  (setup-directories)
  (println "Cloning plugins...")
  (clone-plugins))

(-main)
