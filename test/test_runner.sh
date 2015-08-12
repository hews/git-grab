#!/usr/bin/env bash

# TODO: implement a function to test if is a valid URL
# testIsURL()
# {
#   true
# }

# SOURCE: translate_url

testRegexTranslations()
{
  original="https://github.com/h4w5/git-grab/tree/master/bin"
  expect="https://github.com/h4w5/git-grab/trunk/bin"
  result="$(translateURL $original)"

  assertEquals " for directories on the master branch        " "$expect" "$result"

  original="https://github.com/h4w5/git-grab/blob/master/bin/build"
  expect="https://github.com/h4w5/git-grab/trunk/bin/build"
  result="$(translateURL $original)"

  assertEquals " for files on the master branch              " "$expect" "$result"

  original_one="https://github.com/h4w5/git-grab/tree/one/bin"
  expect_one="https://github.com/h4w5/git-grab/branches/one/bin"
  result_one="$(translateURL $original_one)"

  original_another="https://github.com/h4w5/git-grab/tree/another/bin"
  expect_another="https://github.com/h4w5/git-grab/branches/another/bin"
  result_another="$(translateURL $original_another)"

  assertEquals " for directories on a given branch (one)     " "$expect_one" "$result_one"
  assertEquals " for directories on a given branch (another) " "$expect_another" "$result_another"

  original_one="https://github.com/h4w5/git-grab/blob/one/bin"
  expect_one="https://github.com/h4w5/git-grab/branches/one/bin"
  result_one="$(translateURL $original_one)"

  original_another="https://github.com/h4w5/git-grab/blob/another/bin"
  expect_another="https://github.com/h4w5/git-grab/branches/another/bin"
  result_another="$(translateURL $original_another)"

  assertEquals " for files on a given branch (one)           " "$expect_one" "$result_one"
  assertEquals " for files on a given branch (another)       " "$expect_another" "$result_another"
}
