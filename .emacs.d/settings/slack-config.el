;; (require 'alert)
;; (require 'slack)

;; (setq slack-buffer-emojify t)
;; (setq slack-prefer-current-team t)

;; (slack-register-team
;;  :name "Lami"
;;  :default t
;;  :token (auth-source-pick-first-password
;;          :host "lamigrupo.slack.com"
;;          :user "cherry.ramatis@lamimed.it")
;;  :subscribed-channels '(tech back geral tech_random)
;;  :full-and-display-names t)
