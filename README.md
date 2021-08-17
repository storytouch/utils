# utils
This repository contains files for many purposes.

- [scripts](#scripts)
  - [detect changes](#detect_changes)
  - [npm install in all plugins](#npm_install_in_all_plugins)
  - [run many times](#run_many_times)
  - [tag plugins](#tag_plugins)
  - [update plugins to master](#update_plugins_to_master)

# <a name="scripts"></a>Scripts

**<a name="detect_changes"></a>detect-changes**

Copy this script to `etherpad-docker/etherpad-src/etherpad-lite/node_modules` and run it to check if all plugins are in the HEAD of the right branch.

If it runs without errors, then the tag can be created.

**<a name="npm_install_in_all_plugins"></a>npm-install-in-all-plugins**

Copy this script to `etherpad-docker/etherpad-src/etherpad-lite/node_modules` and run it to install the node packages required for each plugin.

**<a name="run_many_times"></a>run_many_times**

Copy this script to `web/react-webpack/test` and execute it to run a command repeatedly and to show how many times it has succed or failed.  It's useful to verify instability in automated tests. You should run it inside `webpack` container. Usage example:
```bash
# enter webpack container bash
docker-compose exec webpack /bin/bash

# run help.spec.js test case 5 times
./test/run_many_times.sh 'yarn test:integration:singleuser:single test/integration/home/help.spec.js' 5
```

**<a name="tag_plugins"></a>tag-plugins**

Copy this script to `etherpad-docker/etherpad-src/etherpad-lite/node_modules` and run it to create a tag for each etherpad plugin.

See [how to create tags](https://github.com/storytouch/web/wiki/%5BHow-To%5D-Create-tag-for-a-new-release)

**<a name="open_vinagre"></a>open-vinagre**

This script is only for users running on **Linux**.

Execute this script to open Vinagre VNC to connect to chrome containers when running integration tests locally.

When you are prompted for the **password**, it is **secret**, as specified in the "docker-selenium" github page,

**<a name="update_plugins_to_master"></a>update-plugins-to-master**

Copy this script to `etherpad-docker/etherpad-src/etherpad-lite/node_modules` and run it to change the git branch of all plugins to `master` (there are some special cases).
