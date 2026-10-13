#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
mkdir -p "$ROOT/ios/Web"
cp "$ROOT/index.html" "$ROOT/ios/Web/index.html"
rm -rf "$ROOT/ios/Web/assets"
cp -R "$ROOT/assets" "$ROOT/ios/Web/assets"
python3 - "$ROOT/ios/Web/index.html" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1])
s=p.read_text()
bridge="""<script>
(function(){
  function notify(type){try{window.webkit.messageHandlers.nativeHaptic.postMessage(type)}catch(e){}}
  document.addEventListener('click',function(e){if(e.target.closest('#spin'))notify('spin');else if(e.target.closest('button'))notify('button')},true);
  const watch=new MutationObserver(function(){const msg=document.getElementById('message');if(msg&&/dynamite scatters/i.test(msg.textContent))notify('bonus')});
  window.addEventListener('DOMContentLoaded',function(){const msg=document.getElementById('message');if(msg)watch.observe(msg,{childList:true,subtree:true,characterData:true})});
})();
</script>"""
s=s.replace('</body>',bridge+'</body>') if '</body>' in s else s+bridge
p.write_text(s)
PY
