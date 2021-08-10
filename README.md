# semgrep-rules

This is the central semgrep rule repository that hosts the semgrep rules
for the [GitLab semgrep analyzer](https://gitlab.com/gitlab-org/security-products/analyzers/semgrep).

The repository is structured as illustrated below:

``` bash
.
├── mappings
│   └── analyzer.yml
├── c
│   ├── buffer
│   │   ├── rule-strcpy.yml
│   │   ├── test-strcpy.c
│   │   ├── rule-memcpy.yml
│   │   └── test-memcpy.c
│   └── ...
└── javascript
│   └── ...
└── python
│    ├── assert
│    │   ├── rule-assert.yml
│    │   └── test-assert.py
│    └── exec
│    │   ├── rule-exec.yml
│    │   ├── test-exec.yml
│    │   ├── rule-something.yml
│    │   └── test-something.yml
│    └── permission
│    │   ├── rule-chmod.yml
│    │   └── test-chmod.py
│    └── ...
└── ...
```

The structure above follows the pattern:
`<language>/<ruleclass>/{rule-<rulename>.yml, test-<rulename>\..*}` where
`language` denotes the target programming language, `<ruleclass>` is a
descriptive name for the class of issues the rule aims to detect and
`<rulename>` is a descriptive name for the actual rule. 

We can have multiple test cases per rule (all prefixed with `test-`) and rule
files `rule-<rulename>.yml` that are prefixed with `rule-`; a rule file
contains a single semgrep rule.  

## Formatting guidelines

Rules contained in this repository have to adhere to the following format:

- Use `"` for strings, otherwise the YAML literal block |
- No collapsing of array elements
- max line-length/text-width: 100 characters
- indentation: 2 spaces
- every rule has to have a corresponding test-case
- if provided, comments-section at the top of the rule file
- every YAML files starts with `---`

The script `ci/autoformat.rb` automatically formats/rewrites all the rules files
so that they adhere to our guidelines listed above. It can be
executed by running `ci/autoformat.rb` within the sast-rules directory after
installing the gems `psych yaml fileutils` with `gem install psych yaml fileutils`.

## Mappings

The mappings directory in this repository contains YAML configuration files 
that map native analyzer ids to the corresponding semgrep rules. These mappings
are digested by the [testing framework](https://gitlab.com/gitlab-org/secure/gsoc-sast-vulnerability-rules/rule-testing-framework/rule-testing)
to perform an automated gap analysis; the goal of this analysis is to check
whether there is an unexpected deviation between semgrep (with the rules in this repository) 
and a given analyzer.

## Datasources

The rules and test-cases in this repository are partially sourced from the
sources listed below:
1. https://github.com/returntocorp/semgrep-rules
1. https://github.com/PyCQA/bandit
1. https://github.com/nodesecurity/eslint-plugin-security
1. https://github.com/david-a-wheeler/flawfinder/blob/master/flawfinder.py

The details are listed in the headers of all the rule end test-files including
the licensing information and proper attribution. 

## Versioning and Changelog

We apply the following semantic versioning scheme to this repository:

1. patch version increment: for updated/patched/added rules.
1. minor version increment: backwards-compatible YAML schema changes (e.g., adding/removing optional fields).
1. major version increment: non-backwards-compatible YAML schema changes (e.g., adding/removing required fields)

All notable changes concerning minor and major updates are tracked in [the changelog](CHANGELOG.md) which 
is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
