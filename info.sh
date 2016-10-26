#!/bin/bash
#if [ "$TRAVIS" == true ]; then
#  wget https://raw.githubusercontent.com/creationix/nvm/master/nvm.sh
#  . nvm.sh
#fi
start=`date -I`
echo "=============================="
echo "=== TRAVIS NODE TEST START ==="
echo "DATE: $start"
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
for c in "console.log(process.version);" \
         "console.log(process.versions.node);"; do
  echo -n "node -e '$c': "
  v=`node -e '$c' 2>/dev/null`
  [ -n "$v" ] && echo $v || echo '(none)'
done
for c in node npm nvm ld; do
  echo -n "$c --version: "
  v=`$c --version 2>/dev/null | head -1`
  [ -n "$v" ] && echo $v || echo '(none)'
done
echo -n 'make -v: '
v=`make -v 2>&1 | grep -i 'GNU Make'`
[ -n "$v" ] && echo $v || echo '(none)'
echo -n 'gcc -v: '
v=`gcc -v 2>&1 | grep 'gcc version' | sed 's/gcc version //'`
[ -n "$v" ] && echo $v || echo '(none)'
echo "=== INSTALLED NODE VERSIONS ==="
nvm ls
echo "=== AVAILABLE NODE VERSIONS ==="
nvm ls-remote
echo "=== TRAVIS NODE TEST END ==="
echo "START: $start"
echo "END:   `date -Is`"
echo "============================"
