#!/usr/bin/env bash
case "${DESKTOP_SESSION-}" in
  gnome*)
  ;;
  awesome)
    echo "awesome.restart()" | awesome-client
  ;;
  *)
    runcolorizesh
  ;;
esac

