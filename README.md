# semgrep-rules

This is the central semgrep rule repository that hosts the semgrep rules
for the [GitLab semgrep analyzer](https://gitlab.com/gitlab-org/security-products/analyzers/semgrep).

The repository is structured as illustrated below:

``` bash
.
├── c
│   └── flawfinder
│       ├── FF1001
│       │   ├── rule-strcpy.yml
│       │   └── test-strcpy.c
│       └── FF1002
│       │   ├── memcpy.yml
│       │   └── test-mcpy.c
│       └── ...
└── python
│    └── bandit
│        ├── B101
│        │   ├── rule-assert.yml
│        │   └── test-assert.py
│        └── B102
│        │   ├── rule-exec.yml
│        │   ├── test-exec.yml
│        │   ├── rule-something.yml
│        │   └── test-something.yml
│        └── B103
│        │   ├── rule-chmod.yml
│        │   └── test-chmod.py
│        └── ...
└── ...
```

The structure above follows the pattern:
`<language>/<analyzer>/<ruleid>/{rule-<rulename>.yml, test-<rulename>\..*}`
where `language` denotes the target programming language, `<analyzer>` is the
analyzer from which the rule originates and `<ruleid>` denotes the rule identifier
that is used in the analyzer and `<rulename>` is a descriptive name for the
actual rule. 

We can have multiple test cases per rule (all prefixed with `test-`) and rule
files `rule-<rulename>.yml` that are prefixed with `rule-`; a rule file
contains a single semgrep rule.  For rules that are specific to GitLab (i.e.,
rules that are not covered by 3rd party analyzer), we could use
`<analyzer>-gitlab`.

## Formatting guidelines

Rules contained in this repository have to adhere to the following format:

- Use `"` for strings, otherwise the YAML literal block |
- No collapsing of array elements
- max line-length/text-width: 100 characters
- indentation: 2 spaces
- every rule has to have a corresponding test-case
- if provided, comments-section at the top of the rule file
- every YAML files starts with `---`

The script `ci/quality.rb` automatically formats/rewrites all the rules files
so that they adhere to our guidelines listed above. The script does not autofix
the text-width yet, but everything else is automatically adjusted. It can be
executed by running `ci/quality.rb` within the sast-rules directory after
installing the gems `psych yaml fileutils` with `gem install psych yaml fileutils`.

