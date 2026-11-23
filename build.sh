set -eu
sha="${VERCEL_GIT_COMMIT_SHA:-}"
case "$sha" in
  ''|*[!0-9a-f]*) echo 'Missing Git SHA'; exit 1 ;;
esac
test "${#sha}" -eq 40
mkdir -p dist
printf '%s\n' "$sha" > dist/sha.txt
printf '<!doctype html><html lang="en"><meta charset="utf-8"><title>Promotion lab</title><main><h1>Synthetic promotion lab</h1><p>%s</p></main></html>\n' "$sha" > dist/index.html
