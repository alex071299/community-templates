# DDNet / TClient

Applies Noctalia's colors to [DDNet](https://ddnet.org/) and
[TClient](https://github.com/TaterClient/TClient), including the UI, chat,
game background, scoreboard highlights and kill messages.

## Setup

Enable the DDNet / TClient template in Noctalia. The generated config is
`$XDG_DATA_HOME/ddnet/noctalia.cfg` (usually `~/.local/share/ddnet/noctalia.cfg`).

Add this command to your existing client autoexec file to load the theme on startup:

```cfg
exec noctalia.cfg
```

DDNet uses `autoexec_client.cfg` if present, or falls back to `autoexec.cfg`.
If you maintain a different startup config, make sure it is executed by one of
those files. You can also enter `exec noctalia.cfg` in the F1 console to reload
colors manually.

## Live reload (optional)

`apply.sh` sends `exec noctalia.cfg` to a running client through its input FIFO.
To configure the default FIFO, run this in a terminal:

```sh
printf 'cl_input_fifo "%s/ddnet.fifo"\n' "$XDG_RUNTIME_DIR"
```

Copy the printed command into the client's F1 console. DDNet creates the FIFO
itself. The script checks `ddnet.fifo` and `tclient.fifo` inside
`$XDG_RUNTIME_DIR`; either client can use the first. If both run simultaneously,
use `tclient.fifo` for TClient by replacing `ddnet.fifo` in the command above.

Without a FIFO, the generated theme still works, but requires manual reloading
through the F1 console (or a client restart).
