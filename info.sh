#!/bin/bash
echo "=============================="
echo "=== TRAVIS NODE TEST START ==="
echo "DATE: `date -Is`"
echo "branch: $TRAVIS_BRANCH"
echo "commit: $TRAVIS_COMMIT"
echo "=== SYSTEM ==="
echo "uname -a: `uname -a`"
echo "TRAVIS_OS_NAME: $TRAVIS_OS_NAME"
echo "TRAVIS_NODE_VERSION: $TRAVIS_NODE_VERSION"
echo "=== ENVIRONMENT ==="
for v in USER HOME SHELL BASH_VERSION PATH PWD; do
  echo "$v: ${!v}"
done
echo "=== BINARIES ==="
for c in node npm nvm ld make cc gcc g++ bash; do
  echo -n "which $c: "
  which $c || echo '(none)'
done
echo "=== VERSIONS ==="
for c in node npm nvm ld; do
  echo -n "$c -v: "
  v=`$c -v 2>/dev/null | head -1`
  [ -n "$v" ] && echo $v || echo '(none)'
done
echo -n 'make -v: '
v=`make -v 2>&1 | grep -i 'GNU Make'`
[ -n "$v" ] && echo $v || echo '(none)'
echo -n 'gcc -v: '
v=`gcc -v 2>&1 | grep 'gcc version' | sed 's/gcc version //'`
[ -n "$v" ] && echo $v || echo '(none)'
echo "=== TRAVIS NODE TEST END ==="
echo "DATE: `date -Is`"
echo "============================"
