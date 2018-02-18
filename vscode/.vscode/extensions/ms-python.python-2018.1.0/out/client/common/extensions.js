// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
/**
 * Split a string using the cr and lf characters and return them as an array.
 * By default lines are trimmed and empty lines are removed.
 * @param {SplitLinesOptions=} splitOptions - Options used for splitting the string.
 */
String.prototype.splitLines = function (splitOptions = { removeEmptyEntries: true, trim: true }) {
    let lines = this.split(/\r?\n/g);
    if (splitOptions && splitOptions.trim) {
        lines = lines.filter(line => line.trim());
    }
    if (splitOptions && splitOptions.removeEmptyEntries) {
        lines = lines.filter(line => line.length > 0);
    }
    return lines;
};
/**
 * Appropriately formats a string so it can be used as an argument for a command in a shell.
 * E.g. if an argument contains a space, then it will be enclosed within double quotes.
 * @param {String} value.
 */
String.prototype.toCommandArgument = function () {
    if (!this) {
        return this;
    }
    return (this.indexOf(' ') > 0 && !this.startsWith('"') && !this.endsWith('"')) ? `"${this}"` : this.toString();
};
//# sourceMappingURL=extensions.js.map