# Guidelines for GeoRust Projects

## What is a GeoRust project?

GeoRust is a community working to deliver high quality geospatial software
using [Rust](https://rust-lang.org), a programming language focused on
performance, reliability, and productivity.

We want to write down some of the expectations for projects within the GeoRust
organization. This document is incomplete by nature. We will work to amend it
in a way that strikes a good balance between addressing pressing concerns while
remaining clear and concise enough that we can expect people to actually read
it.

## Crate publishing teams

Members should create a dedicated team on GitHub for publishing their crate to
crates.io. It's OK if that team remains empty for now, but it serves as a way
for [organization
owners](https://github.com/orgs/georust/people?query=role%3Aowner) to recover
if the original maintainer moves on from the project or is otherwise
indisposed.

**Step 1: Create your publishing team**

Go to https://github.com/orgs/georust/new-team and enter a name like
`_my-crate_-publishers`. For example, `geojson-publishers` and use the
description `crates.io publishing`.

Add any additional publishers to the team at this point. If you make them [team
maintainers](https://docs.github.com/en/free-pro-team@latest/github/setting-up-and-managing-organizations-and-teams/giving-team-maintainer-permissions-to-an-organization-member),
they will be able to edit the team themselves in the future.

**Step 2: Update crate owners**

    cd my-crate
    cargo owner --add github:georust:my-crate-publishers
    
Note that, although members of that team can now *publish* the crate, team members 
cannot themselves edit crate owners (see https://github.com/rust-lang/crates.io/issues/2906). 
For redundancy, consider having at least one other *user* owner for your crate.

## Code of Conduct

All contributors are expected to follow the [GeoRust Code of Conduct](https://github.com/georust/.github/blob/main/CODE_OF_CONDUCT.md)

## Licensing

All GeoRust code contributions should be dual licensed, usable under either the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) 
or the [MIT license](http://opensource.org/licenses/MIT) at the end users choice.

This is the same licensing scheme the Rust project uses. You can read their rationale on [the rust mailing list archives](https://web.archive.org/web/20230415133420/https://mail.mozilla.org/pipermail/rust-dev/2012-November/002664.html).
