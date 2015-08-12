#!/usr/bin/env bash

# TODO: implement a function to test if is a valid URL
# testIsURL()
# {
#   true
# }

testRegexTranslations()
{
  assertEquals " from .../tree/master/...  to .../trunk/...           " 1 1
  assertEquals " from .../blob/master/...  to .../trunk/...           " 1 1
  assertEquals " from .../tree/one/...     to .../branches/one/...    " 1 1
  assertEquals " from .../tree/another/... to .../branches/another/..." 1 1
  assertEquals " from .../blob/one/...     to .../branches/one/...    " 1 1
  assertEquals " from .../blob/another/... to .../branches/another/..." 1 1
}
