/* global exports */
"use strict";

exports.unionAttributes = function unionAttributes(os) {
  var r = {};
  var n = os.length;
  for (var i = 0; i < n; ++i) {
    var obj = os[i];
    for (var prop in obj) {
      if (obj.hasOwnProperty(prop)) {
        r[prop] = obj[prop];
      }
    }
  }
  return r;
};

