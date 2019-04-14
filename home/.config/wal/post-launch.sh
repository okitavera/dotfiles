#!/usr/bin/env bash
case "${DESKTOP_SESSION-}" in
  gnome*)
  ;;
  awesome)
    echo 'awesome.emit_signal("pywal::apply")' | awesome-client
  ;;
  *)
    runcolorizesh
  ;;
esac

