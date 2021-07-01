(module cherry.plugin.statusline
  {autoload {nvim aniseed.nvim
             nu aniseed.nvim.util}})

(defn- expand [s]
  (nvim.fn.expand s))

(defn filename []
  (expand "%"))

(defn readonly []
  (if (and nvim.bo.readonly
           (not= nvim.bo.filetype "help"))
    "RO"
    ""))

(defn- bridge [from to]
  (nu.fn-bridge from :cherry.plugin.statusline to {:return true}))

(bridge :LightlineFilename :filename)
(bridge :LightlineReadonly :readonly)

(set nvim.g.lightline
     {:colorscheme :default
      :component_function {:filename :LightlineFilename
                           :readonly :LightlineReadonly
                           :gitbranch "gitbranch#name"}
      :active {:left [[:mode :paste]
                      [:readonly :filename :modified :gitbranch]]
               :right []}
      :inactive {:left [[:filename]]
                 :right []}})
