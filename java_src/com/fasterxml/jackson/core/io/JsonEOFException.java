package com.fasterxml.jackson.core.io;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
/* loaded from: classes.dex */
public class JsonEOFException extends JsonParseException {
    private static final long serialVersionUID = 1;
    protected final JsonToken _token;

    public JsonEOFException(JsonParser p, JsonToken token, String msg) {
        super(p, msg);
        this._token = token;
    }

    public JsonToken getTokenBeingDecoded() {
        return this._token;
    }
}
