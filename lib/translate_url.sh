# Turn the GitHub "git-formatted" URL's into GitHub "svn-formatted" URL's
#
# See also: test/test_runner.sh#testRegexTranslations
function translateURL()
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
