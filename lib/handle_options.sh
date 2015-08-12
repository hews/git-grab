# Loop through the passed arguments, checking them as options.
while [[ $1 = -?* ]]; do
  case $1 in
    -h|--help)
      usage
      exit 0
      ;;
    *) ;;
  esac

  shift
done
