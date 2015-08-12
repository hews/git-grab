########################################################################
#
# translateURL turns the GitHub "git-formatted" URLs into GitHub "svn-
# formatted" URLs.
#
# See also: test/test_runner.sh#testRegexTranslation
#
# - Arguments:
#     - String value of git-formatted URL
# - Returns: (via echo and command substitution)
#     - String value of svn-formatted URL
#
########################################################################
function translate_url()
{
  local original
  local result

  original="$1"
  result=$(echo "$original" | sed 's/tree\/master/trunk/g' \
                            | sed 's/blob\/master/trunk/g' \
                            | sed 's/tree\/\(.*\)\//branches\/\1\//g' \
                            | sed 's/blob\/\(.*\)\//branches\/\1\//g')
  echo "$result"
}
