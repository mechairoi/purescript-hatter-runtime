/* global exports, require */
"use strict";

exports.isEmptyPatchObject = function isEmptyPatchObject(patches) {
  for (var key in patches) {
    if (key !== "a") {
      return false;
    }
  }
  return true;
};
