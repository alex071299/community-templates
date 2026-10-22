#!/usr/bin/env bash
# Reload the rendered theme in running DDNet / TClient clients (optional).
# Either client can use ddnet.fifo; concurrent clients need separate FIFOs.

runtime_dir="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
ddnet_fifo="${DDNET_FIFO:-$runtime_dir/ddnet.fifo}"
tclient_fifo="${TCLIENT_FIFO:-$runtime_dir/tclient.fifo}"

fifos=("$ddnet_fifo")
if [[ "$tclient_fifo" != "$ddnet_fifo" ]]; then
    fifos+=("$tclient_fifo")
fi

for fifo in "${fifos[@]}"; do
    [[ -p "$fifo" ]] || continue

    # Do not block Noctalia if a stale FIFO exists without an active reader.
    timeout 1s bash -c 'printf "exec noctalia.cfg\n" > "$1"' _ "$fifo" >/dev/null 2>&1 || true
done
