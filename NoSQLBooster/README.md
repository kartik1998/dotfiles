## Setup (mac)

- Download NoSQL Booster: [link](https://nosqlbooster.com/downloads)

## MongoRC

- Ensure that you enable `options -> Autoload ~/.mongorc.js File` option
- my mongorc backs up all the "update" operations done via mongo shell / client
- update backups are logged in: `/tmp/mongodb-backups/<db name>/<date>/mongo.log }`
- setup: `curl -o ~/.mongorc.js https://raw.githubusercontent.com/kartik1998/dotfiles/master/NoSQLBooster/mongorc.js`
