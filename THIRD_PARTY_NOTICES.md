# Third-party notices

clean-slate itself is MIT-licensed. See the root `LICENSE`. Kickoff may replace that copyright line with the project owner's name. The text below is required credit, not a change of clean-slate's license.

Skills in this repo are rewritten from the ideas in the pstack plugin. They are not copies of pstack's files. pstack is MIT, copyright (c) 2026 Lauren Tan.

Source: https://github.com/cursor/plugins/tree/main/pstack

License: https://github.com/cursor/plugins/blob/main/pstack/LICENSE

## pstack license text

```text
MIT License

Copyright (c) 2026 Lauren Tan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Which clean-slate skill adapts which pstack material

| clean-slate skill | pstack material it adapts |
|---|---|
| tdd | tdd |
| debug | bug-fix playbook, principle-fix-root-causes, principle-attack-the-premise |
| verify | principle-prove-it-works, create-verification-skill |
| review | interrogate, blast-radius, no-comments, unslop |
| simplify | principle-laziness-protocol, principle-subtract-before-you-add, principle-minimize-reader-load |
| correct | correct, principle-encode-lessons-in-structure |
| handoff | session-pickup playbook |
| explain | how, why, teach, bro |
| plan | architect, principle-foundational-thinking, principle-sequence-verifiable-units, feature playbook |
| ship | opening-a-pr playbook |

`kickoff`, `adapt`, and `autopilot` are original to this template. They are not pstack ports.

This template does not include pstack's model-specific routing, Cursor-only automations, or TLA+ / statechart tooling. Those stay optional installs. See README, "Going further".

## Skills installed later

`adapt` appends a row here for every third-party skill it copies in: folder name, source URL, license, copyright holder. No skill is vendored until that row exists.
