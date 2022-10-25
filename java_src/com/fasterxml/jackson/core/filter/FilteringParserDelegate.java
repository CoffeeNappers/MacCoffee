package com.fasterxml.jackson.core.filter;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.util.JsonParserDelegate;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
/* loaded from: classes.dex */
public class FilteringParserDelegate extends JsonParserDelegate {
    protected boolean _allowMultipleMatches;
    protected JsonToken _currToken;
    protected TokenFilterContext _exposedContext;
    protected TokenFilterContext _headContext;
    @Deprecated
    protected boolean _includeImmediateParent;
    protected boolean _includePath;
    protected TokenFilter _itemFilter;
    protected JsonToken _lastClearedToken;
    protected int _matchCount;
    protected TokenFilter rootFilter;

    public FilteringParserDelegate(JsonParser p, TokenFilter f, boolean includePath, boolean allowMultipleMatches) {
        super(p);
        this.rootFilter = f;
        this._itemFilter = f;
        this._headContext = TokenFilterContext.createRootContext(f);
        this._includePath = includePath;
        this._allowMultipleMatches = allowMultipleMatches;
    }

    public TokenFilter getFilter() {
        return this.rootFilter;
    }

    public int getMatchCount() {
        return this._matchCount;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonToken getCurrentToken() {
        return this._currToken;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonToken currentToken() {
        return this._currToken;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public final int getCurrentTokenId() {
        JsonToken t = this._currToken;
        if (t == null) {
            return 0;
        }
        return t.id();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public final int currentTokenId() {
        JsonToken t = this._currToken;
        if (t == null) {
            return 0;
        }
        return t.id();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public boolean hasCurrentToken() {
        return this._currToken != null;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public boolean hasTokenId(int id) {
        JsonToken t = this._currToken;
        return t == null ? id == 0 : t.id() == id;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public final boolean hasToken(JsonToken t) {
        return this._currToken == t;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public boolean isExpectedStartArrayToken() {
        return this._currToken == JsonToken.START_ARRAY;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public boolean isExpectedStartObjectToken() {
        return this._currToken == JsonToken.START_OBJECT;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        return this.delegate.getCurrentLocation();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    /* renamed from: getParsingContext */
    public JsonStreamContext mo312getParsingContext() {
        return _filterContext();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public String getCurrentName() throws IOException {
        JsonStreamContext ctxt = _filterContext();
        if (this._currToken == JsonToken.START_OBJECT || this._currToken == JsonToken.START_ARRAY) {
            JsonStreamContext parent = ctxt.mo319getParent();
            if (parent != null) {
                return parent.getCurrentName();
            }
            return null;
        }
        return ctxt.getCurrentName();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public void clearCurrentToken() {
        if (this._currToken != null) {
            this._lastClearedToken = this._currToken;
            this._currToken = null;
        }
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonToken getLastClearedToken() {
        return this._lastClearedToken;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public void overrideCurrentName(String name) {
        throw new UnsupportedOperationException("Can not currently override name during filtering read");
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException {
        JsonToken t;
        JsonToken t2;
        JsonToken t3;
        TokenFilter f;
        if (!this._allowMultipleMatches && this._currToken != null && this._exposedContext == null) {
            if (this._currToken.isStructEnd() && this._headContext.isStartHandled()) {
                this._currToken = null;
                return null;
            } else if (this._currToken.isScalarValue() && !this._headContext.isStartHandled() && !this._includePath && this._itemFilter == TokenFilter.INCLUDE_ALL) {
                this._currToken = null;
                return null;
            }
        }
        TokenFilterContext ctxt = this._exposedContext;
        if (ctxt != null) {
            do {
                JsonToken t4 = ctxt.nextTokenToRead();
                if (t4 != null) {
                    this._currToken = t4;
                    return t4;
                } else if (ctxt == this._headContext) {
                    this._exposedContext = null;
                    if (ctxt.inArray()) {
                        JsonToken t5 = this.delegate.getCurrentToken();
                        this._currToken = t5;
                        return t5;
                    }
                } else {
                    ctxt = this._headContext.findChildOf(ctxt);
                    this._exposedContext = ctxt;
                }
            } while (ctxt != null);
            throw _constructError("Unexpected problem: chain of filtered context broken");
        }
        JsonToken t6 = this.delegate.nextToken();
        if (t6 == null) {
            this._currToken = t6;
            return t6;
        }
        switch (t6.id()) {
            case 1:
                TokenFilter f2 = this._itemFilter;
                if (f2 == TokenFilter.INCLUDE_ALL) {
                    this._headContext = this._headContext.createChildObjectContext(f2, true);
                    this._currToken = t6;
                    return t6;
                } else if (f2 == null) {
                    this.delegate.skipChildren();
                    break;
                } else {
                    TokenFilter f3 = this._headContext.checkValue(f2);
                    if (f3 == null) {
                        this.delegate.skipChildren();
                        break;
                    } else {
                        if (f3 != TokenFilter.INCLUDE_ALL) {
                            f3 = f3.filterStartObject();
                        }
                        this._itemFilter = f3;
                        if (f3 == TokenFilter.INCLUDE_ALL) {
                            this._headContext = this._headContext.createChildObjectContext(f3, true);
                            this._currToken = t6;
                            return t6;
                        }
                        this._headContext = this._headContext.createChildObjectContext(f3, false);
                        if (this._includePath && (t2 = _nextTokenWithBuffering(this._headContext)) != null) {
                            this._currToken = t2;
                            return t2;
                        }
                    }
                }
                break;
            case 2:
            case 4:
                boolean returnEnd = this._headContext.isStartHandled();
                TokenFilter f4 = this._headContext.getFilter();
                if (f4 != null && f4 != TokenFilter.INCLUDE_ALL) {
                    f4.filterFinishArray();
                }
                this._headContext = this._headContext.mo319getParent();
                this._itemFilter = this._headContext.getFilter();
                if (returnEnd) {
                    this._currToken = t6;
                    return t6;
                }
                break;
            case 3:
                TokenFilter f5 = this._itemFilter;
                if (f5 == TokenFilter.INCLUDE_ALL) {
                    this._headContext = this._headContext.createChildArrayContext(f5, true);
                    this._currToken = t6;
                    return t6;
                } else if (f5 == null) {
                    this.delegate.skipChildren();
                    break;
                } else {
                    TokenFilter f6 = this._headContext.checkValue(f5);
                    if (f6 == null) {
                        this.delegate.skipChildren();
                        break;
                    } else {
                        if (f6 != TokenFilter.INCLUDE_ALL) {
                            f6 = f6.filterStartArray();
                        }
                        this._itemFilter = f6;
                        if (f6 == TokenFilter.INCLUDE_ALL) {
                            this._headContext = this._headContext.createChildArrayContext(f6, true);
                            this._currToken = t6;
                            return t6;
                        }
                        this._headContext = this._headContext.createChildArrayContext(f6, false);
                        if (this._includePath && (t3 = _nextTokenWithBuffering(this._headContext)) != null) {
                            this._currToken = t3;
                            return t3;
                        }
                    }
                }
                break;
            case 5:
                String name = this.delegate.getCurrentName();
                TokenFilter f7 = this._headContext.setFieldName(name);
                if (f7 == TokenFilter.INCLUDE_ALL) {
                    this._itemFilter = f7;
                    if (!this._includePath && this._includeImmediateParent && !this._headContext.isStartHandled()) {
                        t6 = this._headContext.nextTokenToRead();
                        this._exposedContext = this._headContext;
                    }
                    this._currToken = t6;
                    return t6;
                } else if (f7 == null) {
                    this.delegate.nextToken();
                    this.delegate.skipChildren();
                    break;
                } else {
                    TokenFilter f8 = f7.includeProperty(name);
                    if (f8 == null) {
                        this.delegate.nextToken();
                        this.delegate.skipChildren();
                        break;
                    } else {
                        this._itemFilter = f8;
                        if (f8 == TokenFilter.INCLUDE_ALL && this._includePath) {
                            this._currToken = t6;
                            return t6;
                        } else if (this._includePath && (t = _nextTokenWithBuffering(this._headContext)) != null) {
                            this._currToken = t;
                            return t;
                        }
                    }
                }
                break;
            default:
                TokenFilter f9 = this._itemFilter;
                if (f9 == TokenFilter.INCLUDE_ALL) {
                    this._currToken = t6;
                    return t6;
                } else if (f9 != null && ((f = this._headContext.checkValue(f9)) == TokenFilter.INCLUDE_ALL || (f != null && f.includeValue(this.delegate)))) {
                    this._currToken = t6;
                    return t6;
                }
                break;
        }
        return _nextToken2();
    }

    /* JADX WARN: Code restructure failed: missing block: B:150:?, code lost:
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x0170, code lost:
        r8._currToken = r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected final com.fasterxml.jackson.core.JsonToken _nextToken2() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 388
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.filter.FilteringParserDelegate._nextToken2():com.fasterxml.jackson.core.JsonToken");
    }

    /* JADX WARN: Code restructure failed: missing block: B:122:?, code lost:
        return _nextBuffered(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00d3, code lost:
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected final com.fasterxml.jackson.core.JsonToken _nextTokenWithBuffering(com.fasterxml.jackson.core.filter.TokenFilterContext r10) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 328
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.filter.FilteringParserDelegate._nextTokenWithBuffering(com.fasterxml.jackson.core.filter.TokenFilterContext):com.fasterxml.jackson.core.JsonToken");
    }

    private JsonToken _nextBuffered(TokenFilterContext buffRoot) throws IOException {
        this._exposedContext = buffRoot;
        TokenFilterContext ctxt = buffRoot;
        JsonToken t = ctxt.nextTokenToRead();
        if (t != null) {
            return t;
        }
        while (ctxt != this._headContext) {
            ctxt = this._exposedContext.findChildOf(ctxt);
            this._exposedContext = ctxt;
            if (ctxt == null) {
                throw _constructError("Unexpected problem: chain of filtered context broken");
            }
            JsonToken t2 = this._exposedContext.nextTokenToRead();
            if (t2 != null) {
                return t2;
            }
        }
        throw _constructError("Internal error: failed to locate expected buffered tokens");
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextValue() throws IOException {
        JsonToken t = nextToken();
        if (t == JsonToken.FIELD_NAME) {
            return nextToken();
        }
        return t;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonParser skipChildren() throws IOException {
        if (this._currToken == JsonToken.START_OBJECT || this._currToken == JsonToken.START_ARRAY) {
            int open = 1;
            while (true) {
                JsonToken t = nextToken();
                if (t != null) {
                    if (t.isStructStart()) {
                        open++;
                    } else if (t.isStructEnd() && open - 1 == 0) {
                        break;
                    }
                } else {
                    break;
                }
            }
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public String getText() throws IOException {
        return this.delegate.getText();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public boolean hasTextCharacters() {
        return this.delegate.hasTextCharacters();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public char[] getTextCharacters() throws IOException {
        return this.delegate.getTextCharacters();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public int getTextLength() throws IOException {
        return this.delegate.getTextLength();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public int getTextOffset() throws IOException {
        return this.delegate.getTextOffset();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public BigInteger getBigIntegerValue() throws IOException {
        return this.delegate.getBigIntegerValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public boolean getBooleanValue() throws IOException {
        return this.delegate.getBooleanValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public byte getByteValue() throws IOException {
        return this.delegate.getByteValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public short getShortValue() throws IOException {
        return this.delegate.getShortValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public BigDecimal getDecimalValue() throws IOException {
        return this.delegate.getDecimalValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public double getDoubleValue() throws IOException {
        return this.delegate.getDoubleValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public float getFloatValue() throws IOException {
        return this.delegate.getFloatValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public int getIntValue() throws IOException {
        return this.delegate.getIntValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public long getLongValue() throws IOException {
        return this.delegate.getLongValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonParser.NumberType getNumberType() throws IOException {
        return this.delegate.getNumberType();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public Number getNumberValue() throws IOException {
        return this.delegate.getNumberValue();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt() throws IOException {
        return this.delegate.getValueAsInt();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt(int defaultValue) throws IOException {
        return this.delegate.getValueAsInt(defaultValue);
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public long getValueAsLong() throws IOException {
        return this.delegate.getValueAsLong();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public long getValueAsLong(long defaultValue) throws IOException {
        return this.delegate.getValueAsLong(defaultValue);
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public double getValueAsDouble() throws IOException {
        return this.delegate.getValueAsDouble();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public double getValueAsDouble(double defaultValue) throws IOException {
        return this.delegate.getValueAsDouble(defaultValue);
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public boolean getValueAsBoolean() throws IOException {
        return this.delegate.getValueAsBoolean();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public boolean getValueAsBoolean(boolean defaultValue) throws IOException {
        return this.delegate.getValueAsBoolean(defaultValue);
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public String getValueAsString() throws IOException {
        return this.delegate.getValueAsString();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public String getValueAsString(String defaultValue) throws IOException {
        return this.delegate.getValueAsString(defaultValue);
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public Object getEmbeddedObject() throws IOException {
        return this.delegate.getEmbeddedObject();
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public byte[] getBinaryValue(Base64Variant b64variant) throws IOException {
        return this.delegate.getBinaryValue(b64variant);
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public int readBinaryValue(Base64Variant b64variant, OutputStream out) throws IOException {
        return this.delegate.readBinaryValue(b64variant, out);
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getTokenLocation() {
        return this.delegate.getTokenLocation();
    }

    protected JsonStreamContext _filterContext() {
        return this._exposedContext != null ? this._exposedContext : this._headContext;
    }
}
