#!/bin/bash
# newquota--A frontend to quota that works with full-word flags a la GNU
# quota has three possible flags, -g, -v, and -q, but this script
# allows them to be '--group', '--verbose', and '--quiet' too.
flags=""
realquota="$(which quota)"
while [ $# -gt 0 ]
do
  case $1
  in
      --help) echo "Usage: $0 [--group --verbose --quiet -gvq]" >&2
                   exit 1 ;;
      --group) flags="$flags -g"; shift ;;
      --verbose) flags="$flags -v"; shift ;;
      --quiet) flags="$flags -q"; shift ;;
      --) shift; break ;;
      *) break; # Done with 'while' loop! 
    esac

done
exec $realquota $flags "$@"
