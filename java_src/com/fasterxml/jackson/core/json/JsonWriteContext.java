package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.vk.media.camera.CameraUtilsEffects;
/* loaded from: classes.dex */
public class JsonWriteContext extends JsonStreamContext {
    public static final int STATUS_EXPECT_NAME = 5;
    public static final int STATUS_EXPECT_VALUE = 4;
    public static final int STATUS_OK_AFTER_COLON = 2;
    public static final int STATUS_OK_AFTER_COMMA = 1;
    public static final int STATUS_OK_AFTER_SPACE = 3;
    public static final int STATUS_OK_AS_IS = 0;
    protected JsonWriteContext _child;
    protected String _currentName;
    protected Object _currentValue;
    protected DupDetector _dups;
    protected boolean _gotName;
    protected final JsonWriteContext _parent;

    protected JsonWriteContext(int type, JsonWriteContext parent, DupDetector dups) {
        this._type = type;
        this._parent = parent;
        this._dups = dups;
        this._index = -1;
    }

    protected JsonWriteContext reset(int type) {
        this._type = type;
        this._index = -1;
        this._currentName = null;
        this._gotName = false;
        this._currentValue = null;
        if (this._dups != null) {
            this._dups.reset();
        }
        return this;
    }

    public JsonWriteContext withDupDetector(DupDetector dups) {
        this._dups = dups;
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonStreamContext
    public Object getCurrentValue() {
        return this._currentValue;
    }

    @Override // com.fasterxml.jackson.core.JsonStreamContext
    public void setCurrentValue(Object v) {
        this._currentValue = v;
    }

    @Deprecated
    public static JsonWriteContext createRootContext() {
        return createRootContext(null);
    }

    public static JsonWriteContext createRootContext(DupDetector dd) {
        return new JsonWriteContext(0, null, dd);
    }

    public JsonWriteContext createChildArrayContext() {
        JsonWriteContext ctxt = this._child;
        if (ctxt == null) {
            JsonWriteContext ctxt2 = new JsonWriteContext(1, this, this._dups == null ? null : this._dups.child());
            this._child = ctxt2;
            return ctxt2;
        }
        return ctxt.reset(1);
    }

    public JsonWriteContext createChildObjectContext() {
        JsonWriteContext ctxt = this._child;
        if (ctxt == null) {
            JsonWriteContext ctxt2 = new JsonWriteContext(2, this, this._dups == null ? null : this._dups.child());
            this._child = ctxt2;
            return ctxt2;
        }
        return ctxt.reset(2);
    }

    @Override // com.fasterxml.jackson.core.JsonStreamContext
    /* renamed from: getParent  reason: collision with other method in class */
    public final JsonWriteContext mo319getParent() {
        return this._parent;
    }

    @Override // com.fasterxml.jackson.core.JsonStreamContext
    public final String getCurrentName() {
        return this._currentName;
    }

    public JsonWriteContext clearAndGetParent() {
        this._currentValue = null;
        return this._parent;
    }

    public DupDetector getDupDetector() {
        return this._dups;
    }

    public int writeFieldName(String name) throws JsonProcessingException {
        if (this._type != 2 || this._gotName) {
            return 4;
        }
        this._gotName = true;
        this._currentName = name;
        if (this._dups != null) {
            _checkDup(this._dups, name);
        }
        return this._index < 0 ? 0 : 1;
    }

    private final void _checkDup(DupDetector dd, String name) throws JsonProcessingException {
        if (dd.isDup(name)) {
            Object src = dd.getSource();
            throw new JsonGenerationException("Duplicate field '" + name + "'", src instanceof JsonGenerator ? (JsonGenerator) src : null);
        }
    }

    public int writeValue() {
        if (this._type == 2) {
            if (!this._gotName) {
                return 5;
            }
            this._gotName = false;
            this._index++;
            return 2;
        } else if (this._type == 1) {
            int ix = this._index;
            this._index++;
            return ix >= 0 ? 1 : 0;
        } else {
            this._index++;
            return this._index != 0 ? 3 : 0;
        }
    }

    protected void appendDesc(StringBuilder sb) {
        if (this._type == 2) {
            sb.append('{');
            if (this._currentName != null) {
                sb.append('\"');
                sb.append(this._currentName);
                sb.append('\"');
            } else {
                sb.append('?');
            }
            sb.append('}');
        } else if (this._type == 1) {
            sb.append('[');
            sb.append(getCurrentIndex());
            sb.append(']');
        } else {
            sb.append(CameraUtilsEffects.FILE_DELIM);
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(64);
        appendDesc(sb);
        return sb.toString();
    }
}