// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
'use strict';
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const configSettings_1 = require("../common/configSettings");
const tokenizer_1 = require("../language/tokenizer");
const types_1 = require("../language/types");
const itemInfoSource_1 = require("./itemInfoSource");
const proxy = require("./jediProxy");
class DocumentPosition {
    constructor(document, position) {
        this.document = document;
        this.position = position;
    }
    static fromObject(item) {
        // tslint:disable-next-line:no-any
        return item._documentPosition;
    }
    attachTo(item) {
        // tslint:disable-next-line:no-any
        item._documentPosition = this;
    }
}
class CompletionSource {
    constructor(jediFactory) {
        this.jediFactory = jediFactory;
        this.itemInfoSource = new itemInfoSource_1.ItemInfoSource(jediFactory);
    }
    getVsCodeCompletionItems(document, position, token) {
        return __awaiter(this, void 0, void 0, function* () {
            const result = yield this.getCompletionResult(document, position, token);
            if (result === undefined) {
                return Promise.resolve([]);
            }
            return this.toVsCodeCompletions(new DocumentPosition(document, position), result, document.uri);
        });
    }
    getDocumentation(completionItem, token) {
        return __awaiter(this, void 0, void 0, function* () {
            const documentPosition = DocumentPosition.fromObject(completionItem);
            if (documentPosition === undefined) {
                return;
            }
            // Supply hover source with simulated document text where item in question was 'already typed'.
            const document = documentPosition.document;
            const position = documentPosition.position;
            const itemText = completionItem.insertText ? completionItem.insertText : completionItem.label;
            const wordRange = document.getWordRangeAtPosition(position);
            const leadingRange = wordRange !== undefined
                ? new vscode.Range(new vscode.Position(0, 0), wordRange.start)
                : new vscode.Range(new vscode.Position(0, 0), position);
            const itemString = `${itemText}`;
            const sourceText = `${document.getText(leadingRange)}${itemString}`;
            const range = new vscode.Range(leadingRange.end, leadingRange.end.translate(0, itemString.length));
            return yield this.itemInfoSource.getItemInfoFromText(document.uri, document.fileName, range, sourceText, token);
        });
    }
    getCompletionResult(document, position, token) {
        return __awaiter(this, void 0, void 0, function* () {
            if (position.character <= 0) {
                return undefined;
            }
            const filename = document.fileName;
            const lineText = document.lineAt(position.line).text;
            if (lineText.match(/^\s*\/\//)) {
                return undefined;
            }
            // Suppress completion inside string and comments.
            if (this.isPositionInsideStringOrComment(document, position)) {
                return undefined;
            }
            const type = proxy.CommandType.Completions;
            const columnIndex = position.character;
            const source = document.getText();
            const cmd = {
                command: type,
                fileName: filename,
                columnIndex: columnIndex,
                lineIndex: position.line,
                source: source
            };
            return yield this.jediFactory.getJediProxyHandler(document.uri).sendCommand(cmd, token);
        });
    }
    toVsCodeCompletions(documentPosition, data, resource) {
        return data && data.items.length > 0 ? data.items.map(item => this.toVsCodeCompletion(documentPosition, item, resource)) : [];
    }
    toVsCodeCompletion(documentPosition, item, resource) {
        const completionItem = new vscode.CompletionItem(item.text);
        completionItem.kind = item.type;
        if (configSettings_1.PythonSettings.getInstance(resource).autoComplete.addBrackets === true &&
            (item.kind === vscode.SymbolKind.Function || item.kind === vscode.SymbolKind.Method)) {
            completionItem.insertText = new vscode.SnippetString(item.text).appendText('(').appendTabstop().appendText(')');
        }
        // Ensure the built in members are at the bottom.
        completionItem.sortText = (completionItem.label.startsWith('__') ? 'z' : (completionItem.label.startsWith('_') ? 'y' : '__')) + completionItem.label;
        documentPosition.attachTo(completionItem);
        return completionItem;
    }
    isPositionInsideStringOrComment(document, position) {
        const tokenizeTo = position.translate(1, 0);
        const text = document.getText(new vscode.Range(new vscode.Position(0, 0), tokenizeTo));
        const t = new tokenizer_1.Tokenizer();
        const tokens = t.Tokenize(text);
        const index = tokens.getItemContaining(document.offsetAt(position));
        if (index >= 0) {
            const token = tokens.getItemAt(index);
            return token.type === types_1.TokenType.String || token.type === types_1.TokenType.Comment;
        }
        return false;
    }
}
exports.CompletionSource = CompletionSource;
//# sourceMappingURL=completionSource.js.map