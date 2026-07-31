# Pong

The classic two-player Pong, made in [Godot](https://godotengine.org)
(4.x). First player to out-rally the other — every missed ball is a
point for the opponent.

## Controls

| Action | Left player | Right player |
|--------|-------------|--------------|
| Paddle up | `Q` | `O` |
| Paddle down | `A` | `L` |

`Space` confirms in the menu, `Esc` quits the game.

## Development

The project uses the [godot-tools](https://git.teletype.hu/tools/godot-tools)
templates: build logic lives in the `Makefile`, the web export
configuration in `export_presets.cfg` (the `Web` preset, threads
disabled).

```sh
make run                # run the game locally
make build              # headless import (.godot cache, project check)
make web                # export web build to dist/web/
make export VERSION=x   # package dist/web/ into pong-x.html.zip
make clean              # remove dist/ and the import cache
```

Requirements: `godot` (4.x editor binary) on PATH with the matching web
export templates installed, plus `make` and `zip`. `.vscode/tasks.json`
(copied from godot-tools, not tracked) provides the same targets as
VS Code tasks.

## CI/CD

Woodpecker builds every push (`.woodpecker.yaml`): version → headless
web export (`barichello/godot-ci` image) → upload to the droparea →
`/update?platform=godot` on teletypegames.org. The version comes from
`metadata.json` (non-main branches get a `dev-` prefix). Keep the
`barichello/godot-ci` image tag in sync with the Godot version the
project is edited with.

Detailed documentation lives on the wiki: `/development/godot`.
