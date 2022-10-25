package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class JsonParserSequence extends JsonParserDelegate {
    protected final boolean _checkForExistingToken;
    protected boolean _hasToken;
    protected int _nextParserIndex;
    protected final JsonParser[] _parsers;

    @Deprecated
    protected JsonParserSequence(JsonParser[] parsers) {
        this(false, parsers);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    protected JsonParserSequence(boolean checkForExistingToken, JsonParser[] parsers) {
        super(parsers[0]);
        boolean z = false;
        this._checkForExistingToken = checkForExistingToken;
        if (checkForExistingToken && this.delegate.hasCurrentToken()) {
            z = true;
        }
        this._hasToken = z;
        this._parsers = parsers;
        this._nextParserIndex = 1;
    }

    public static JsonParserSequence createFlattened(boolean checkForExistingToken, JsonParser first, JsonParser second) {
        if (!(first instanceof JsonParserSequence) && !(second instanceof JsonParserSequence)) {
            return new JsonParserSequence(checkForExistingToken, new JsonParser[]{first, second});
        }
        ArrayList<JsonParser> p = new ArrayList<>();
        if (first instanceof JsonParserSequence) {
            ((JsonParserSequence) first).addFlattenedActiveParsers(p);
        } else {
            p.add(first);
        }
        if (second instanceof JsonParserSequence) {
            ((JsonParserSequence) second).addFlattenedActiveParsers(p);
        } else {
            p.add(second);
        }
        return new JsonParserSequence(checkForExistingToken, (JsonParser[]) p.toArray(new JsonParser[p.size()]));
    }

    @Deprecated
    public static JsonParserSequence createFlattened(JsonParser first, JsonParser second) {
        return createFlattened(false, first, second);
    }

    protected void addFlattenedActiveParsers(List<JsonParser> listToAddIn) {
        int len = this._parsers.length;
        for (int i = this._nextParserIndex - 1; i < len; i++) {
            JsonParser p = this._parsers[i];
            if (p instanceof JsonParserSequence) {
                ((JsonParserSequence) p).addFlattenedActiveParsers(listToAddIn);
            } else {
                listToAddIn.add(p);
            }
        }
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        do {
            this.delegate.close();
        } while (switchToNext());
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException {
        if (this.delegate == null) {
            return null;
        }
        if (this._hasToken) {
            this._hasToken = false;
            return this.delegate.currentToken();
        }
        JsonToken t = this.delegate.nextToken();
        if (t == null) {
            return switchAndReturnNext();
        }
        return t;
    }

    public int containedParsersCount() {
        return this._parsers.length;
    }

    protected boolean switchToNext() {
        if (this._nextParserIndex < this._parsers.length) {
            JsonParser[] jsonParserArr = this._parsers;
            int i = this._nextParserIndex;
            this._nextParserIndex = i + 1;
            this.delegate = jsonParserArr[i];
            return true;
        }
        return false;
    }

    protected JsonToken switchAndReturnNext() throws IOException {
        while (this._nextParserIndex < this._parsers.length) {
            JsonParser[] jsonParserArr = this._parsers;
            int i = this._nextParserIndex;
            this._nextParserIndex = i + 1;
            this.delegate = jsonParserArr[i];
            if (this._checkForExistingToken && this.delegate.hasCurrentToken()) {
                return this.delegate.getCurrentToken();
            }
            JsonToken t = this.delegate.nextToken();
            if (t != null) {
                return t;
            }
        }
        return null;
    }
}
