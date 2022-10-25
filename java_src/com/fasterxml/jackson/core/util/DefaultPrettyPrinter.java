package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.SerializedString;
import java.io.IOException;
import java.io.Serializable;
/* loaded from: classes.dex */
public class DefaultPrettyPrinter implements PrettyPrinter, Instantiatable<DefaultPrettyPrinter>, Serializable {
    public static final SerializedString DEFAULT_ROOT_VALUE_SEPARATOR = new SerializedString(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
    private static final long serialVersionUID = 1;
    protected Indenter _arrayIndenter;
    protected transient int _nesting;
    protected Indenter _objectIndenter;
    protected final SerializableString _rootSeparator;
    protected boolean _spacesInObjectEntries;

    /* loaded from: classes.dex */
    public interface Indenter {
        boolean isInline();

        void writeIndentation(JsonGenerator jsonGenerator, int i) throws IOException;
    }

    public DefaultPrettyPrinter() {
        this(DEFAULT_ROOT_VALUE_SEPARATOR);
    }

    public DefaultPrettyPrinter(String rootSeparator) {
        this(rootSeparator == null ? null : new SerializedString(rootSeparator));
    }

    public DefaultPrettyPrinter(SerializableString rootSeparator) {
        this._arrayIndenter = FixedSpaceIndenter.instance;
        this._objectIndenter = DefaultIndenter.SYSTEM_LINEFEED_INSTANCE;
        this._spacesInObjectEntries = true;
        this._rootSeparator = rootSeparator;
    }

    public DefaultPrettyPrinter(DefaultPrettyPrinter base) {
        this(base, base._rootSeparator);
    }

    public DefaultPrettyPrinter(DefaultPrettyPrinter base, SerializableString rootSeparator) {
        this._arrayIndenter = FixedSpaceIndenter.instance;
        this._objectIndenter = DefaultIndenter.SYSTEM_LINEFEED_INSTANCE;
        this._spacesInObjectEntries = true;
        this._arrayIndenter = base._arrayIndenter;
        this._objectIndenter = base._objectIndenter;
        this._spacesInObjectEntries = base._spacesInObjectEntries;
        this._nesting = base._nesting;
        this._rootSeparator = rootSeparator;
    }

    public DefaultPrettyPrinter withRootSeparator(SerializableString rootSeparator) {
        if (this._rootSeparator != rootSeparator) {
            return (rootSeparator == null || !rootSeparator.equals(this._rootSeparator)) ? new DefaultPrettyPrinter(this, rootSeparator) : this;
        }
        return this;
    }

    public DefaultPrettyPrinter withRootSeparator(String rootSeparator) {
        return withRootSeparator(rootSeparator == null ? null : new SerializedString(rootSeparator));
    }

    public void indentArraysWith(Indenter i) {
        if (i == null) {
            i = NopIndenter.instance;
        }
        this._arrayIndenter = i;
    }

    public void indentObjectsWith(Indenter i) {
        if (i == null) {
            i = NopIndenter.instance;
        }
        this._objectIndenter = i;
    }

    @Deprecated
    public void spacesInObjectEntries(boolean b) {
        this._spacesInObjectEntries = b;
    }

    public DefaultPrettyPrinter withArrayIndenter(Indenter i) {
        if (i == null) {
            i = NopIndenter.instance;
        }
        if (this._arrayIndenter != i) {
            DefaultPrettyPrinter pp = new DefaultPrettyPrinter(this);
            pp._arrayIndenter = i;
            return pp;
        }
        return this;
    }

    public DefaultPrettyPrinter withObjectIndenter(Indenter i) {
        if (i == null) {
            i = NopIndenter.instance;
        }
        if (this._objectIndenter != i) {
            DefaultPrettyPrinter pp = new DefaultPrettyPrinter(this);
            pp._objectIndenter = i;
            return pp;
        }
        return this;
    }

    public DefaultPrettyPrinter withSpacesInObjectEntries() {
        return _withSpaces(true);
    }

    public DefaultPrettyPrinter withoutSpacesInObjectEntries() {
        return _withSpaces(false);
    }

    protected DefaultPrettyPrinter _withSpaces(boolean state) {
        if (this._spacesInObjectEntries != state) {
            DefaultPrettyPrinter pp = new DefaultPrettyPrinter(this);
            pp._spacesInObjectEntries = state;
            return pp;
        }
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.fasterxml.jackson.core.util.Instantiatable
    /* renamed from: createInstance */
    public DefaultPrettyPrinter mo320createInstance() {
        return new DefaultPrettyPrinter(this);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeRootValueSeparator(JsonGenerator jg) throws IOException {
        if (this._rootSeparator != null) {
            jg.writeRaw(this._rootSeparator);
        }
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeStartObject(JsonGenerator jg) throws IOException {
        jg.writeRaw('{');
        if (!this._objectIndenter.isInline()) {
            this._nesting++;
        }
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void beforeObjectEntries(JsonGenerator jg) throws IOException {
        this._objectIndenter.writeIndentation(jg, this._nesting);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeObjectFieldValueSeparator(JsonGenerator jg) throws IOException {
        if (this._spacesInObjectEntries) {
            jg.writeRaw(" : ");
        } else {
            jg.writeRaw(':');
        }
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeObjectEntrySeparator(JsonGenerator jg) throws IOException {
        jg.writeRaw(',');
        this._objectIndenter.writeIndentation(jg, this._nesting);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeEndObject(JsonGenerator jg, int nrOfEntries) throws IOException {
        if (!this._objectIndenter.isInline()) {
            this._nesting--;
        }
        if (nrOfEntries > 0) {
            this._objectIndenter.writeIndentation(jg, this._nesting);
        } else {
            jg.writeRaw(' ');
        }
        jg.writeRaw('}');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeStartArray(JsonGenerator jg) throws IOException {
        if (!this._arrayIndenter.isInline()) {
            this._nesting++;
        }
        jg.writeRaw('[');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void beforeArrayValues(JsonGenerator jg) throws IOException {
        this._arrayIndenter.writeIndentation(jg, this._nesting);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeArrayValueSeparator(JsonGenerator gen) throws IOException {
        gen.writeRaw(',');
        this._arrayIndenter.writeIndentation(gen, this._nesting);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeEndArray(JsonGenerator gen, int nrOfValues) throws IOException {
        if (!this._arrayIndenter.isInline()) {
            this._nesting--;
        }
        if (nrOfValues > 0) {
            this._arrayIndenter.writeIndentation(gen, this._nesting);
        } else {
            gen.writeRaw(' ');
        }
        gen.writeRaw(']');
    }

    /* loaded from: classes.dex */
    public static class NopIndenter implements Indenter, Serializable {
        public static final NopIndenter instance = new NopIndenter();

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public void writeIndentation(JsonGenerator jg, int level) throws IOException {
        }

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public boolean isInline() {
            return true;
        }
    }

    /* loaded from: classes.dex */
    public static class FixedSpaceIndenter extends NopIndenter {
        public static final FixedSpaceIndenter instance = new FixedSpaceIndenter();

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.NopIndenter, com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public void writeIndentation(JsonGenerator jg, int level) throws IOException {
            jg.writeRaw(' ');
        }

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.NopIndenter, com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public boolean isInline() {
            return true;
        }
    }
}
