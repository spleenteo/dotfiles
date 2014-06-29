# :h sta per H3G
alias :hframe="echo '<<<<<<<<<<<<<<<< H3G BEGINS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'"

alias :h="$HOME/Sites/h3g"

alias :hhost="h3g.cantierecreativo.net"
alias :hupdate="gup; bundle; rake db:migrate"
alias :hserver=":hframe; :h; :hupdate; rs"
alias :hguard=":hframe; :h; guard -P livereload"
alias :hsetup="vterm :hserver; hterm :hguard"
alias :hchrome="/usr/bin/open -a '/Applications/Google Chrome.app' 'http://$HOSTNAME.local:3000'"

alias :hstart="$HOME; :hsetup; :h; :hchrome; s .;"

alias :h_download_production_db=':h; scp h3g@h3g.cantierecreativo.net:h3g.sql.gz ..'
alias :h_restore_production_db=':h; rake db:drop; rake db:create; gzip -cd ../h3g.sql.gz | rails db; rake db:migrate'
