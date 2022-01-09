var fs = require("fs");
var crypto = require("crypto");

var local = {};
local.dir = `/tmp/mongodb-backups/${db.getName()}/${
  new Date().toISOString().split("T")[0]
}`;
local.operations = [];
if (!fs.existsSync(local.dir)) fs.mkdirSync(local.dir, { recursive: true });
const writeStream = fs.createWriteStream(`${local.dir}/mongo.log`, {
  flags: "a",
});
function log(type, id, str) {
  writeStream.write(`[${new Date().toISOString()}][${type}][${id}] ${str}\n`);
}

class Utils {
  static getArrayFromIterator(it) {
    const out = [];
    while (true) {
      const temp = it.next();
      if (temp === null) break;
      out.push(temp);
      if (out.length === 10) break; // logs upto 10 backups only
    }
    return out;
  }

  static processArray(array) {
    return array
      .map((arg) => {
        if (typeof arg === "string") return arg;
        else return JSON.stringify(arg);
      })
      .toString();
  }

  static makeId() {
    return crypto.randomBytes(14).toString("hex");
  }
}

const defaultUpdate = DBCollection.prototype.update;
DBCollection.prototype.update = function (...args) {
  const it = this.find(args[0]);
  writeStream.write("\n");
  const id = Utils.makeId();
  log("update", id, Utils.processArray(args));
  log("backup", id, Utils.processArray(Utils.getArrayFromIterator(it)));
  print({ "backup id": id, location: local.dir });
  return defaultUpdate.apply(this, args);
};

const defaultUpdateMany = DBCollection.prototype.updateMany;
DBCollection.prototype.updateMany = function (...args) {
  const it = this.find(args[0]);
  writeStream.write("\n");
  const id = Utils.makeId();
  log("updateMany", id, Utils.processArray(args));
  log("backup", id, Utils.processArray(Utils.getArrayFromIterator(it)));
  print({ "backup id": id, location: local.dir });
  return defaultUpdateMany.apply(this, args);
};

const defaultUpdateOne = DBCollection.prototype.updateOne;
DBCollection.prototype.updateMany = function (...args) {
  const it = this.find(args[0]);
  writeStream.write("\n");
  const id = Utils.makeId();
  log("updateOne", id, Utils.processArray(args));
  log("backup", id, Utils.processArray(Utils.getArrayFromIterator(it)));
  print({ "backup id": id, location: local.dir });
  return defaultUpdateOne.apply(this, args);
};


