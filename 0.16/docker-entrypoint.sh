#!/bin/bash

# Uses mkdocs as default.
if [ "${1#-}" != "$1" ]; then
	set -- mkdocs "$@"
fi

function print_usage {
  echo
  echo "Usage:"
  echo "  [OPTIONS]"
  echo
  echo "Options:"
  echo "  -b, --build                     Build the MkDocs documentation"
  echo "  -j, --json                      Build the MkDocs documentation to JSON files"
  echo "  -s, --serve                     Run the builtin development server"
  echo
  echo "  -c, --config string             Provide a specific MkDocs config"
  echo "  -t, --theme string              The theme to use: cosmo, cyborg, readthedocs, yeti, journal,"
  echo "                                  bootstrap, readable, united, simplex, flatly, spacelab, amelia"
  echo "                                  cerulean, slate, mkdocs"
  echo
  echo "  -h, --help                      Print this message"
  echo
}

if [ "$1" != "mkdocs" ]; then
  exec "$@"
fi

MD_COMMAND="serve"

shift
OPTIONS=`getopt -o bjsc:t:h --long build,json,serve,config:,theme:,help -n mkdocs -- "$@"`
if [ $? -ne 0 ]; then
  print_usage
  exit 1
fi

eval set -- "$OPTIONS"
while true; do
  case "$1" in
    -b|--build)               MD_COMMAND="build";             shift;;
    -j|--json)                MD_COMMAND="json";              shift;;
    -s|--serve)               MD_COMMAND="serve";             shift;;
    -c|--config)              MD_CONFIG="-f $2";              shift 2;;
    -t|--theme)               MD_THEME="-t $2";               shift 2;;
    --)                                                       shift; break;;
    -h|--help)                print_usage;                    exit 0;;

    *)
      echo "Unexpected argument: $1"
      print_usage
      exit 1;;
  esac
done

case "$MD_COMMAND" in
  serve)
    mkdocs serve --livereload -a "0.0.0.0:8000" $MD_CONFIG $MD_THEME
    exit 0;;
  build)
    mkdocs build -c -d /docs/output $MD_CONFIG $MD_THEME
    exit 0;;
  json)
    mkdocs json -c -d /docs/output $MD_CONFIG
    exit 0;;
  *)
    echo "Unexpected command: $MD_COMMAND"
    print_usage
    exit 1;;
esac