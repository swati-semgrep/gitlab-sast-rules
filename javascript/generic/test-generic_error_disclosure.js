// License: GNU Lesser General Public License v3.0
// source (original): https://github.com/ajinabraham/njsscan/blob/master/tests/assets/node_source/true_positives/semantic_grep/generic/error_disclosure.js
// hash: e7a0a61

// ruleid:generic_error_disclosure
try {
    throw new Error("Something unexpected has occurred.");
} catch (e) {
    console.error(e);
}

// ruleid:generic_error_disclosure
console.trace("baad")
