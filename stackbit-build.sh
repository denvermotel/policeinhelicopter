#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5da8e595abd14a001bb50761/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5da8e595abd14a001bb50761
curl -s -X POST https://api.stackbit.com/project/5da8e595abd14a001bb50761/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5da8e595abd14a001bb50761/webhook/build/publish > /dev/null
