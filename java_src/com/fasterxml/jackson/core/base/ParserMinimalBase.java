package com.fasterxml.jackson.core.base;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.io.JsonEOFException;
import com.fasterxml.jackson.core.io.NumberInput;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.VersionUtil;
import java.io.IOException;
/* loaded from: classes.dex */
public abstract class ParserMinimalBase extends JsonParser {
    protected static final int INT_BACKSLASH = 92;
    protected static final int INT_COLON = 58;
    protected static final int INT_COMMA = 44;
    protected static final int INT_CR = 13;
    protected static final int INT_E = 69;
    protected static final int INT_HASH = 35;
    protected static final int INT_LBRACKET = 91;
    protected static final int INT_LCURLY = 123;
    protected static final int INT_LF = 10;
    protected static final int INT_PERIOD = 46;
    protected static final int INT_QUOTE = 34;
    protected static final int INT_RBRACKET = 93;
    protected static final int INT_RCURLY = 125;
    protected static final int INT_SLASH = 47;
    protected static final int INT_SPACE = 32;
    protected static final int INT_TAB = 9;
    protected static final int INT_e = 101;
    protected JsonToken _currToken;
    protected JsonToken _lastClearedToken;

    protected abstract void _handleEOF() throws JsonParseException;

    @Override // com.fasterxml.jackson.core.JsonParser, java.io.Closeable, java.lang.AutoCloseable
    public abstract void close() throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract byte[] getBinaryValue(Base64Variant base64Variant) throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract String getCurrentName() throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    /* renamed from: getParsingContext */
    public abstract JsonStreamContext mo312getParsingContext();

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract String getText() throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract char[] getTextCharacters() throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract int getTextLength() throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract int getTextOffset() throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract boolean hasTextCharacters();

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract boolean isClosed();

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract JsonToken nextToken() throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract void overrideCurrentName(String str);

    protected ParserMinimalBase() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ParserMinimalBase(int features) {
        super(features);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken currentToken() {
        return this._currToken;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int currentTokenId() {
        JsonToken t = this._currToken;
        if (t == null) {
            return 0;
        }
        return t.id();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken getCurrentToken() {
        return this._currToken;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getCurrentTokenId() {
        JsonToken t = this._currToken;
        if (t == null) {
            return 0;
        }
        return t.id();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean hasCurrentToken() {
        return this._currToken != null;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean hasTokenId(int id) {
        JsonToken t = this._currToken;
        return t == null ? id == 0 : t.id() == id;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean hasToken(JsonToken t) {
        return this._currToken == t;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean isExpectedStartArrayToken() {
        return this._currToken == JsonToken.START_ARRAY;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean isExpectedStartObjectToken() {
        return this._currToken == JsonToken.START_OBJECT;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken nextValue() throws IOException {
        JsonToken t = nextToken();
        if (t == JsonToken.FIELD_NAME) {
            return nextToken();
        }
        return t;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser skipChildren() throws IOException {
        if (this._currToken == JsonToken.START_OBJECT || this._currToken == JsonToken.START_ARRAY) {
            int open = 1;
            while (true) {
                JsonToken t = nextToken();
                if (t == null) {
                    _handleEOF();
                    break;
                } else if (t.isStructStart()) {
                    open++;
                } else if (t.isStructEnd() && open - 1 == 0) {
                    break;
                }
            }
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void clearCurrentToken() {
        if (this._currToken != null) {
            this._lastClearedToken = this._currToken;
            this._currToken = null;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken getLastClearedToken() {
        return this._lastClearedToken;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean getValueAsBoolean(boolean defaultValue) throws IOException {
        JsonToken t = this._currToken;
        if (t != null) {
            switch (t.id()) {
                case 6:
                    String str = getText().trim();
                    if ("true".equals(str)) {
                        return true;
                    }
                    if ("false".equals(str)) {
                        return false;
                    }
                    if (_hasTextualNull(str)) {
                        return false;
                    }
                    break;
                case 7:
                    return getIntValue() != 0;
                case 9:
                    return true;
                case 10:
                case 11:
                    return false;
                case 12:
                    Object value = getEmbeddedObject();
                    if (value instanceof Boolean) {
                        return ((Boolean) value).booleanValue();
                    }
                    break;
            }
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt() throws IOException {
        JsonToken t = this._currToken;
        return (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) ? getIntValue() : getValueAsInt(0);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt(int defaultValue) throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
            return getIntValue();
        }
        if (t != null) {
            switch (t.id()) {
                case 6:
                    String str = getText();
                    if (!_hasTextualNull(str)) {
                        return NumberInput.parseAsInt(str, defaultValue);
                    }
                    return 0;
                case 7:
                case 8:
                default:
                    return defaultValue;
                case 9:
                    return 1;
                case 10:
                    return 0;
                case 11:
                    return 0;
                case 12:
                    Object value = getEmbeddedObject();
                    if (value instanceof Number) {
                        return ((Number) value).intValue();
                    }
                    return defaultValue;
            }
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long getValueAsLong() throws IOException {
        JsonToken t = this._currToken;
        return (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) ? getLongValue() : getValueAsLong(0L);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long getValueAsLong(long defaultValue) throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
            return getLongValue();
        }
        if (t != null) {
            switch (t.id()) {
                case 6:
                    String str = getText();
                    if (!_hasTextualNull(str)) {
                        return NumberInput.parseAsLong(str, defaultValue);
                    }
                    return 0L;
                case 7:
                case 8:
                default:
                    return defaultValue;
                case 9:
                    return 1L;
                case 10:
                case 11:
                    return 0L;
                case 12:
                    Object value = getEmbeddedObject();
                    if (value instanceof Number) {
                        return ((Number) value).longValue();
                    }
                    return defaultValue;
            }
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public double getValueAsDouble(double defaultValue) throws IOException {
        JsonToken t = this._currToken;
        if (t != null) {
            switch (t.id()) {
                case 6:
                    String str = getText();
                    if (!_hasTextualNull(str)) {
                        return NumberInput.parseAsDouble(str, defaultValue);
                    }
                    return 0.0d;
                case 7:
                case 8:
                    return getDoubleValue();
                case 9:
                    return 1.0d;
                case 10:
                case 11:
                    return 0.0d;
                case 12:
                    Object value = getEmbeddedObject();
                    if (value instanceof Number) {
                        return ((Number) value).doubleValue();
                    }
                    return defaultValue;
                default:
                    return defaultValue;
            }
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String getValueAsString() throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            return getText();
        }
        if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        }
        return getValueAsString(null);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String getValueAsString(String defaultValue) throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            return getText();
        }
        if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        }
        return (this._currToken == null || this._currToken == JsonToken.VALUE_NULL || !this._currToken.isScalarValue()) ? defaultValue : getText();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _decodeBase64(String str, ByteArrayBuilder builder, Base64Variant b64variant) throws IOException {
        try {
            b64variant.decode(str, builder);
        } catch (IllegalArgumentException e) {
            _reportError(e.getMessage());
        }
    }

    protected boolean _hasTextualNull(String value) {
        return "null".equals(value);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _reportUnexpectedChar(int ch, String comment) throws JsonParseException {
        if (ch < 0) {
            _reportInvalidEOF();
        }
        String msg = "Unexpected character (" + _getCharDesc(ch) + ")";
        if (comment != null) {
            msg = msg + ": " + comment;
        }
        _reportError(msg);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _reportInvalidEOF() throws JsonParseException {
        _reportInvalidEOF(" in " + this._currToken, this._currToken);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _reportInvalidEOFInValue(JsonToken type) throws JsonParseException {
        String msg;
        if (type == JsonToken.VALUE_STRING) {
            msg = " in a String value";
        } else if (type == JsonToken.VALUE_NUMBER_INT || type == JsonToken.VALUE_NUMBER_FLOAT) {
            msg = " in a Number value";
        } else {
            msg = " in a value";
        }
        _reportInvalidEOF(msg, type);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _reportInvalidEOF(String msg, JsonToken currToken) throws JsonParseException {
        throw new JsonEOFException(this, currToken, "Unexpected end-of-input" + msg);
    }

    @Deprecated
    protected void _reportInvalidEOFInValue() throws JsonParseException {
        _reportInvalidEOF(" in a value");
    }

    @Deprecated
    protected void _reportInvalidEOF(String msg) throws JsonParseException {
        throw new JsonEOFException(this, null, "Unexpected end-of-input" + msg);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _reportMissingRootWS(int ch) throws JsonParseException {
        _reportUnexpectedChar(ch, "Expected space separating root-level values");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _throwInvalidSpace(int i) throws JsonParseException {
        char c = (char) i;
        String msg = "Illegal character (" + _getCharDesc(c) + "): only regular white space (\\r, \\n, \\t) is allowed between tokens";
        _reportError(msg);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _throwUnquotedSpace(int i, String ctxtDesc) throws JsonParseException {
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS) || i > 32) {
            char c = (char) i;
            String msg = "Illegal unquoted character (" + _getCharDesc(c) + "): has to be escaped using backslash to be included in " + ctxtDesc;
            _reportError(msg);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public char _handleUnrecognizedCharacterEscape(char ch) throws JsonProcessingException {
        if (!isEnabled(JsonParser.Feature.ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER) && (ch != '\'' || !isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES))) {
            _reportError("Unrecognized character escape " + _getCharDesc(ch));
        }
        return ch;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static final String _getCharDesc(int ch) {
        char c = (char) ch;
        if (Character.isISOControl(c)) {
            return "(CTRL-CHAR, code " + ch + ")";
        }
        if (ch > 255) {
            return "'" + c + "' (code " + ch + " / 0x" + Integer.toHexString(ch) + ")";
        }
        return "'" + c + "' (code " + ch + ")";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void _reportError(String msg) throws JsonParseException {
        throw _constructError(msg);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void _wrapError(String msg, Throwable t) throws JsonParseException {
        throw _constructError(msg, t);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void _throwInternal() {
        VersionUtil.throwInternal();
    }

    protected final JsonParseException _constructError(String msg, Throwable t) {
        return new JsonParseException(this, msg, t);
    }

    protected static byte[] _asciiBytes(String str) {
        byte[] b = new byte[str.length()];
        int len = str.length();
        for (int i = 0; i < len; i++) {
            b[i] = (byte) str.charAt(i);
        }
        return b;
    }

    protected static String _ascii(byte[] b) {
        try {
            return new String(b, "US-ASCII");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
