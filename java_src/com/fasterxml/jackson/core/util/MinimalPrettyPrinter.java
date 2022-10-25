package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.PrettyPrinter;
import java.io.IOException;
import java.io.Serializable;
/* loaded from: classes.dex */
public class MinimalPrettyPrinter implements PrettyPrinter, Serializable {
    public static final String DEFAULT_ROOT_VALUE_SEPARATOR = " ";
    private static final long serialVersionUID = 1;
    protected String _rootValueSeparator;

    public MinimalPrettyPrinter() {
        this(DEFAULT_ROOT_VALUE_SEPARATOR);
    }

    public MinimalPrettyPrinter(String rootValueSeparator) {
        this._rootValueSeparator = DEFAULT_ROOT_VALUE_SEPARATOR;
        this._rootValueSeparator = rootValueSeparator;
    }

    public void setRootValueSeparator(String sep) {
        this._rootValueSeparator = sep;
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeRootValueSeparator(JsonGenerator jg) throws IOException, JsonGenerationException {
        if (this._rootValueSeparator != null) {
            jg.writeRaw(this._rootValueSeparator);
        }
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeStartObject(JsonGenerator jg) throws IOException, JsonGenerationException {
        jg.writeRaw('{');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void beforeObjectEntries(JsonGenerator jg) throws IOException, JsonGenerationException {
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeObjectFieldValueSeparator(JsonGenerator jg) throws IOException, JsonGenerationException {
        jg.writeRaw(':');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeObjectEntrySeparator(JsonGenerator jg) throws IOException, JsonGenerationException {
        jg.writeRaw(',');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeEndObject(JsonGenerator jg, int nrOfEntries) throws IOException, JsonGenerationException {
        jg.writeRaw('}');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeStartArray(JsonGenerator jg) throws IOException, JsonGenerationException {
        jg.writeRaw('[');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void beforeArrayValues(JsonGenerator jg) throws IOException, JsonGenerationException {
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeArrayValueSeparator(JsonGenerator jg) throws IOException, JsonGenerationException {
        jg.writeRaw(',');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeEndArray(JsonGenerator jg, int nrOfValues) throws IOException, JsonGenerationException {
        jg.writeRaw(']');
    }
}
