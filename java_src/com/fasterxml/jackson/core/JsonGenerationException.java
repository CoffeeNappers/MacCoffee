package com.fasterxml.jackson.core;
/* loaded from: classes.dex */
public class JsonGenerationException extends JsonProcessingException {
    private static final long serialVersionUID = 123;
    protected transient JsonGenerator _processor;

    @Deprecated
    public JsonGenerationException(Throwable rootCause) {
        super(rootCause);
    }

    @Deprecated
    public JsonGenerationException(String msg) {
        super(msg, (JsonLocation) null);
    }

    @Deprecated
    public JsonGenerationException(String msg, Throwable rootCause) {
        super(msg, null, rootCause);
    }

    public JsonGenerationException(Throwable rootCause, JsonGenerator g) {
        super(rootCause);
        this._processor = g;
    }

    public JsonGenerationException(String msg, JsonGenerator g) {
        super(msg, (JsonLocation) null);
        this._processor = g;
    }

    public JsonGenerationException(String msg, Throwable rootCause, JsonGenerator g) {
        super(msg, null, rootCause);
        this._processor = g;
    }

    public JsonGenerationException withGenerator(JsonGenerator g) {
        this._processor = g;
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonProcessingException
    /* renamed from: getProcessor */
    public JsonGenerator mo311getProcessor() {
        return this._processor;
    }
}
