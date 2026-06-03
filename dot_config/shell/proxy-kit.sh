kit_proxy_url="http://wwwproxy.kanazawa-it.ac.jp:8080/"

proxy_on() {
  export http_proxy="$kit_proxy_url"
  export https_proxy="$kit_proxy_url"
  export HTTP_PROXY="$kit_proxy_url"
  export HTTPS_PROXY="$kit_proxy_url"

  if command -v git >/dev/null 2>&1; then
    git config --global http.proxy "$kit_proxy_url"
    git config --global https.proxy "$kit_proxy_url"
  fi
}

proxy_off() {
  unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY

  if command -v git >/dev/null 2>&1; then
    git config --global --unset-all http.proxy >/dev/null 2>&1 || true
    git config --global --unset-all https.proxy >/dev/null 2>&1 || true
  fi
}

proxy_auto_kit() {
  if ! command -v iwgetid >/dev/null 2>&1; then
    return 0
  fi

  net="$(iwgetid -r 2>/dev/null || true)"
  if [ "$net" = "KIT-WLAP2" ]; then
    proxy_on
  fi
}

alias proxyOn='proxy_on'
alias proxyOff='proxy_off'

proxy_auto_kit
