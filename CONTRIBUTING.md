# Contributing

Please follow the style guide:

- https://google-styleguide.googlecode.com/svn/trunk/shell.xml

Lint your script using ShellCheck:

- https://github.com/koalaman/shellcheck

Test your script using shunit2:

- http://www.mikewright.me/blog/2013/10/31/shunit2-bash-testing/
- https://shunit2.googlecode.com/svn/trunk/source/2.1/doc/shunit2.html
- https://github.com/kward/shunit2
- https://github.com/zandev/shunit2 (mirror)

As much as possible, break up the parts of the final script into useful
chunks ("sub-scripts") and place them in the `/lib` folder.

Lint the sub-scripts by sourcing them in the base command files:

- `/git-grab`
- `/git-ls-sub`

Test the sub-scripts by sourcing them in the test runner:

- `/test/test_runner.sh`

"Sourcing" a sub-script means writing the line:

```bash
# SOURCE: <sub-script-name.sh>
```

... into the file, and then building it using the default Rake task:

```
$ rake
```
