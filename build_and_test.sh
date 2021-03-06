#! /bin/bash
mkdir dist
echo "===================================================================================="
echo "BUILDING genome with 'hc package --output dist/app-spec-rust.hcpkg --strip-meta':"
echo "------------------------------------------------------------------------------------"
hc package --output dist/app-spec-rust.hcpkg --strip-meta
echo "DONE."
echo "===================================================================================="
echo "BUILDING JS test file with webpack:"
echo "------------------------------------------------------------------------------------"
cd test
npm install
npm run build
cd ..
echo "DONE."
echo "RUNNING tests with hcshell..."
echo "------------------------------------------------------------------------------------"
hcshell test/dist/bundle.js | test/node_modules/faucet/bin/cmd.js
