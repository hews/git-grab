#!/usr/bin/env bash
#
# Defines "unit" tests for sub-scripts in /lib. Test groups are represented
# as functions, and all setup and tear-down within a group is explicit inside
# the function. The final version of this file is built and the sub-scripts
# are sourced right before the test groups.


# TODO: implement a test for option handling
# test_handle_options()
# {
#    true
# }

# TODO: implement a test if is a valid URL
# test_is_valid_url()
# {
#   true
# }

# SOURCE: translate_url
test_regex_translations()
{
  original="https://github.com/h4w5/git-grab/tree/master/bin"
  expect="https://github.com/h4w5/git-grab/trunk/bin"
  result="$(translate_url $original)"

  assertEquals " for directories on the master branch        " "$expect" "$result"

  original="https://github.com/h4w5/git-grab/blob/master/bin/build"
  expect="https://github.com/h4w5/git-grab/trunk/bin/build"
  result="$(translate_url $original)"

  assertEquals " for files on the master branch              " "$expect" "$result"

  original_one="https://github.com/h4w5/git-grab/tree/one/bin"
  expect_one="https://github.com/h4w5/git-grab/branches/one/bin"
  result_one="$(translate_url $original_one)"

  original_another="https://github.com/h4w5/git-grab/tree/another/bin"
  expect_another="https://github.com/h4w5/git-grab/branches/another/bin"
  result_another="$(translate_url $original_another)"

  assertEquals " for directories on a given branch (one)     " "$expect_one" "$result_one"
  assertEquals " for directories on a given branch (another) " "$expect_another" "$result_another"

  original_one="https://github.com/h4w5/git-grab/blob/one/bin"
  expect_one="https://github.com/h4w5/git-grab/branches/one/bin"
  result_one="$(translate_url $original_one)"

  original_another="https://github.com/h4w5/git-grab/blob/another/bin"
  expect_another="https://github.com/h4w5/git-grab/branches/another/bin"
  result_another="$(translate_url $original_another)"

  assertEquals " for files on a given branch (one)           " "$expect_one" "$result_one"
  assertEquals " for files on a given branch (another)       " "$expect_another" "$result_another"
}
