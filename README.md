

### FreakChain 

## Important Links

  * Block explorer https://freak.rektfreak.io
  * Website
  * Twitter https://twitter.com/FreakChain
  * Discord channel https://discord.gg/9CwbextN79
  * Reddit 
  * Telegram: fuck no!

## FreakChain Specifications

```
Name: FreakChain
Ticker: FREAK
Maturity: 6 Blocks
POW Algo: Scrypt
POS: 5% APR
Port: 16555
Rpcport: 16556
Max Supply: Doesn't exist
POW Block Reward: 300 FREAK
POW Last Block: 1 million

```

## Docker
[Instructions for installing docker](https://www.docker.com/community-edition).

First, build the image.
```
# Git clone this repo
https://github.com/freakcoderz/FreakChain.git

# go to the same directory Dockerfile exists
cd FreakChain
# Build the container and tag it with a usable name + version
docker build -t freakchaind:v1.0.0 .
```

You should see logs similar to below. This takes a while, as it is provisioning the image by installing dependencies and building the FreakChain binary.
```
Sending build context to Docker daemon  156.4MB

Step 1/12 : FROM ubuntu:16.04

..............

Removing intermediate container 20bf170af587

Successfully built 347a6416af66
Successfully built freakchaind:v1.0.0
```

Then, copy the unique identifier built by Docker (in this case, `347a6416af66`).
```
➜  FreakChain git:(master) ✗ docker run -d freakchaind:v1.0.0
46ecdf76b5b7ead9271ba5f313b03f2cf8002489f11c1de17e495767da3adebf
```

This runs the binary, `FreakChaind`, with no command arguments.

`-d`: daemonize the container. Run `docker logs 347a6416af66 -f` to tail the standard output.

`-v`: persist the data in your host machine. Example: `docker run -d -v $(pwd)/docker/data:/root/.FreakChain/ freakchaind:v1.0.0	`

## FreakChain Core integration/staging tree
=====================================

Copyright (c) 2009-2012 Bitcoin Developers  
Copyright (c) 2012-2014 NovaCoin Developers 
Copyright (c) 2020- FreakChain Developers

## What is FreakChain?
----------------

FreakChain is an experimental new digital currency that enables instant payments to
anyone, anywhere in the world. FreakChain uses peer-to-peer technology to operate
with no central authority: managing transactions and issuing money are carried
out collectively by the network. FreakChain is the name of open source
software which enables the use of this currency.

FreakChain first started in February 2020 using a variant of Litecoin using Scrypt as
the Proof-of-Work (PoW) hash algorithm. After the initial premine was done, the chain
quickly moved to Proof-of-Stake (PoS) mining.


## License
-------

FreakChain is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see http://opensource.org/licenses/MIT.

## Development process
-------------------

Developers work in their own trees, then submit pull requests when they think
their feature or bug fix is ready.

If it is a simple/trivial/non-controversial change, then one of the FreakChain
development team members simply pulls it.

If it is a *more complicated or potentially controversial* change, then the patch
submitter will be asked to start a discussion (if they haven't already) on the relevant forum channel.

The patch will be accepted if there is broad consensus that it is a good thing.
Developers should expect to rework and resubmit patches if the code doesn't
match the project's coding conventions (see [doc/coding.md](doc/coding.md)) or are
controversial.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/freakcoderz/FreakChain/tags) are created
regularly to indicate new official, stable release versions of Bitcoin.

## Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test. Please be patient and help out, and
remember this is a security-critical project where any mistake might cost people
lots of money.

### Automated Testing

Developers are strongly encouraged to write unit tests for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run (assuming they weren't disabled in configure) with: `make check`

Every pull request is built for Windows, Linux and OSx on a dedicated server,
and unit and sanity tests are automatically run. The binaries produced may be
used for manual QA testing — a link to them will appear in a comment on the
pull request posted by [BitcoinPullTester](https://github.com/BitcoinPullTester). See https://github.com/TheBlueMatt/test-scripts
for the build/test scripts.

### Manual Quality Assurance (QA) Testing

Large changes should have a test plan, and should be tested by somebody other
than the developer who wrote the code.
See https://github.com/bitcoin/QA/ for how to create a test plan.

## Translations
------------

Changes to translations as well as new translations can be submitted to
[Bitcoin Core's Transifex page](https://www.transifex.com/projects/p/bitcoin/).

Periodically the translations are pulled from Transifex and merged into the git repository. See the
[translation process](doc/translation_process.md) for details on how this works.

**Important**: We do not accept translation changes as github pull request because the next
pull from Transifex would automatically overwrite them again.

Development tips and tricks
---------------------------

**compiling for debugging**

Run configure with the --enable-debug option, then make. Or run configure with
CXXFLAGS="-g -ggdb -O0" or whatever debug flags you need.

**debug.log**

If the code is behaving strangely, take a look in the debug.log file in the data directory;
error and debugging message are written there.

The -debug=... command-line option controls debugging; running with just -debug will turn
on all categories (and give you a very large debug.log file).

The Qt code routes qDebug() output to debug.log under category "qt": run with -debug=qt
to see it.

**testnet and regtest modes**

Run with the -testnet option to run with "play reddcoins" on the test network, if you
are testing multi-machine code that needs to operate across the internet.

If you are testing something that can run on one machine, run with the -regtest option.
In regression test mode blocks can be created on-demand; see qa/rpc-tests/ for tests
that run in -regest mode.

**DEBUG_LOCKORDER**

Reddcoin Core is a multithreaded application, and deadlocks or other multithreading bugs
can be very difficult to track down. Compiling with -DDEBUG_LOCKORDER (configure
CXXFLAGS="-DDEBUG_LOCKORDER -g") inserts run-time checks to keep track of what locks
are held, and adds warning to the debug.log file if inconsistencies are detected.
