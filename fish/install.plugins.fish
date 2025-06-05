#!/usr/bin/env fish

if ! functions -q fisher
    echo "[+] fisher"
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

if ! functions -q tide
    echo "[+] tide"

    fisher install IlanCosman/tide@v6
    tide configure
end
