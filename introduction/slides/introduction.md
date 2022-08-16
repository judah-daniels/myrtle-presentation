% 8 weeks in the life of a myrtle intern
% Judah Daniels
% Aug 17th, 2022

# What is this talk about?

::: notes
- The goal of this talk is:
  + To get you started
  + Make you feel comfortable working here

The slides are on the github, do dont worry about remembering / taking notes
:::

## Contents

- Introductions
- Overview of first week
- Things to get you started
- Dev Flow
- Codebase Overview
- Demos
- First Takes, Longer Goals
- Questions?

# Introductions

## Who am I?

- My name is Judah
- Computer Science undergrad at the Clare College, Cambridge
- Was a myrtle.ai intern and then employee (I was you!)
- Feel free to interrupt and ask questions at any point

## Who are you?

Name / pronouns?

ML or SW/HW?

Fun fact!

::: notes
Get them to introduce themselves
ML = Jeevan and THEODORE
SW/HW = Judah = Kai
:::

##
![](./myrtle.svg)

::: notes
Liz will tell you more about the company later, but here is how I always described what we did when it was my job:
We make machine learning problems
(that is things like - Image Classification, Image Segmentation, Object Detection, Speech to text, etc)
run really fast by developing cool machine learning stuff and designing custom hardware.
So ML kids you'll be working on our machine learning practices
and SW/HE kids you'll be helping us do that cool stuff on the boards by using clash/haskell to program FPGAs
:::

# First Week Timetable

## Mon

All:

  - Health and safety with Alda
  - This welcome talk
  - Getting set up
  - LUNCH
  - Project talks with your mentor
  - Pizza / pub

::: notes
Only day we are all together, cos after this the ML people will split off to start their tasks with the support of your mentors, and the SW/HW people will stay with me for some crash courses
:::

## Tues

SW/HW: Haskell Crash Course

All: About the company talk with Liz


## Wed

SW/HW: Clash Crash Course

All: evening celebration

## Thurs

SW/HW: Nix Crash Course

Optional: rock climbing / curry

## Fri

All: CircuitFlow talk ft. pizza

# Getting Started

## What to Expect

Day to day:

- 9-5.30pm hours
- 9am sync
- Lunch
- 2pm scrum

## What to Expect

Week to week:

- 2 week sprints
- Pub / pizza Mondays
- All hands Tuesdays at noon
- Climbing Thursdays
- Market Fridays

:::notes
lunch - whenever, but I like noon. Can go sainsbury's to grab sandwiches, or to one of the nice food pl
aces nearby, I used to get sandwich ingredients for the week and make the sandwich at lunch (this week I will probs enjoy what cam has to offer)
sprints - planning / retro depend on team
:::

## Mentors

- Kai -> Jon
- Judah -> Basile
- Jeevan -> Aiken
- Theodore -> Rob

## Accounts setup

- Email
- [Slack](https://myrtlesoft.slack.com) `#getting-started`
- [GitHub](https://github.com/MyrtleSoftware/myrtlepkgs)
- [Jira](https://myrtlesoft.atlassian.net) / [Confluence](https://myrtlesoft.atlassian.net/wiki/spaces/)
- [Hydra](https://hydra)
- [BreathHR](login.breathehr.com/)
- Google calendar

::: notes
Show Slack, tell them to please ask any questions they have on getting started
Show github (will come back to this later)
you cant show confluence/jira lol, but its for docs
hydra is for running builds
BreathHR is for payment and holidays etc
:::

## Computer setup

The computers are running Ubuntu 18.04 / 20.04

- Change password
- Setup WM, editor, terminal, other...
- Setup nix

## Read the docs

- [`intro.md`](https://github.com/MyrtleSoftware/myrtlepkgs/blob/master/docs/intro.md)
- [`tricks.md`](https://github.com/MyrtleSoftware/myrtlepkgs/blob/master/docs/tricks.md)
- [`how-to`](https://myrtlesoft.atlassian.net/wiki/spaces/COM/pages/10911811/How-to+articles)

*Note*: Feel free to improve the docs when something is unclear/incomplete

::: notes
how to old
:::

# Development flow
# Build
## Nix

- Nix
- Nixpkgs
- NixOS

Crash course Thursday, for now just the essentials

::: notes
tell them what nix is: its a package manager and a way of making sure you always have the exact dependencies you need
:::

## Nix Essentials

Environment:

`nix-shell`

Installing:

`nix-env -f .../myrtlepkgs/ -iA <attribute name>`

Bash Alias:

`alias ns='nix-shell'`


For more see [this doc](https://github.com/MyrtleSoftware/myrtlepkgs/blob/master/docs/tricks.md).

::: notes
ns gets the correct dependencies anywhere in mp

this installs something from the nixpkgs myrtle uses (the ... is whatever your path is to your copy of myrtlepkgs)

this will save you all the time
:::

## Cabal (Haskell)

- Nix integration
- `cabal`
- `ghcid`

We will look at this in more detail on Tues

## Hardware build/simulation

- Quartus
- Vivado
- ModelSim / QuestaSim / VivadoSim

# Documentation

## hoogle

- Generated from haddock
- Our codebase + dependencies
- Available at [`hoogle.hydra`](https://hoogle.hydra)

## Wiki

- [GitHub wiki](https://github.com/MyrtleSoftware/myrtlepkgs/wiki)
- [Confluence](https://myrtlesoft.atlassian.net/wiki/spaces)

## README

In the root of each important package

# Version control
##

- `git`
    + mono-repo
- GitHub + Jira
    + Issues
    + Pull requests
    + Code review
- [Worktrees](https://git-scm.com/docs/git-worktree)

::: notes
(Issues on jira, everything else on git)
- Have you used `git` or any other VCS?
- Should we do a quick introduction this afternoon?
:::

# Continuous Integration
##

- Pull requests
- Hydra
- Nightlies

# Style Guide

## [Coding standard](https://github.com/MyrtleSoftware/myrtlepkgs/blob/staging/docs/haskell-coding-standard.md)

- Haskell
    + `stylish-haskell`
    + `hlint`
- Indentation (`2` spaces)
- `80` characters
- git pre-commit hook
- CI lint

::: notes
hook = you can get it auto checked before committing

CI will tell you off
:::

# Codebase overview

TODO basile to update

::: notes
Basile to present
:::

## `clash-primitives`

- Bindings to specific hardware primitives
- Basic abstraction over the targeted backend (Xilinx vs Altera/Intel)

## `clash-circuit`

- Abstractions over circuits and buses
- Protocol types (AXI, StreamMM, ...)
- Circuit level components (FIFO, RAM, ...)
- VFPGA

## `vfpga`

- Virtual FPGA
- Minimal interface
- Driver support `fpga/driver`

## `synchrotron`

- `hw`
  + Instruction machine
  + SMxV units
  + Tile architecture
- `sw`
  + assembler
  + compiler
- `model`

## `deepspeech-demo`

- runtime
  + cli
  + web-server

# Demos

TODO basile to update

- ENet (image segmentation)
- SqueezeNet (object classification)
- MobileNetSSD (object detection)
- DeepSpeech (speech to text)

::: notes
Basile to present
:::

# First Tasks, longer goals

Get set up

[Learn you a Haskell](http://learnyouahaskell.com/) / [Fast AI](https://www.fast.ai/)

Meeting with mentor

::: notes
Health and safety talk next

after that we will leave you to get set up on your computers e.g. setting up whatever windows manager or text you want

if you finish you can start reading learn you a haskell if you are SW/HW or going through fast AI if you are ML

After lunch you will meet your mentors and learn about your projects!
:::

# Questions?


::: notes
Also please feel free to come up and ask me stuff after or message me on slack, or use the getting started slack channel
:::
