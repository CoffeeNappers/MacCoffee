package com.fasterxml.jackson.core.base;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.NumberInput;
import com.fasterxml.jackson.core.json.DupDetector;
import com.fasterxml.jackson.core.json.JsonReadContext;
import com.fasterxml.jackson.core.json.PackageVersion;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
/* loaded from: classes.dex */
public abstract class ParserBase extends ParserMinimalBase {
    protected static final char CHAR_NULL = 0;
    protected static final int INT_0 = 48;
    protected static final int INT_9 = 57;
    protected static final int INT_MINUS = 45;
    protected static final int INT_PLUS = 43;
    static final double MAX_INT_D = 2.147483647E9d;
    static final double MAX_LONG_D = 9.223372036854776E18d;
    static final double MIN_INT_D = -2.147483648E9d;
    static final double MIN_LONG_D = -9.223372036854776E18d;
    protected static final int NR_BIGDECIMAL = 16;
    protected static final int NR_BIGINT = 4;
    protected static final int NR_DOUBLE = 8;
    protected static final int NR_INT = 1;
    protected static final int NR_LONG = 2;
    protected static final int NR_UNKNOWN = 0;
    protected byte[] _binaryValue;
    protected ByteArrayBuilder _byteArrayBuilder;
    protected boolean _closed;
    protected long _currInputProcessed;
    protected int _currInputRow;
    protected int _currInputRowStart;
    protected int _expLength;
    protected int _fractLength;
    protected int _inputEnd;
    protected int _inputPtr;
    protected int _intLength;
    protected final IOContext _ioContext;
    protected boolean _nameCopied;
    protected char[] _nameCopyBuffer;
    protected JsonToken _nextToken;
    protected int _numTypesValid;
    protected BigDecimal _numberBigDecimal;
    protected BigInteger _numberBigInt;
    protected double _numberDouble;
    protected int _numberInt;
    protected long _numberLong;
    protected boolean _numberNegative;
    protected JsonReadContext _parsingContext;
    protected final TextBuffer _textBuffer;
    protected int _tokenInputCol;
    protected int _tokenInputRow;
    protected long _tokenInputTotal;
    static final long MIN_INT_L = -2147483648L;
    static final BigInteger BI_MIN_INT = BigInteger.valueOf(MIN_INT_L);
    static final long MAX_INT_L = 2147483647L;
    static final BigInteger BI_MAX_INT = BigInteger.valueOf(MAX_INT_L);
    static final BigInteger BI_MIN_LONG = BigInteger.valueOf(Long.MIN_VALUE);
    static final BigInteger BI_MAX_LONG = BigInteger.valueOf(Long.MAX_VALUE);
    static final BigDecimal BD_MIN_LONG = new BigDecimal(BI_MIN_LONG);
    static final BigDecimal BD_MAX_LONG = new BigDecimal(BI_MAX_LONG);
    static final BigDecimal BD_MIN_INT = new BigDecimal(BI_MIN_INT);
    static final BigDecimal BD_MAX_INT = new BigDecimal(BI_MAX_INT);

    protected abstract void _closeInput() throws IOException;

    /* JADX INFO: Access modifiers changed from: protected */
    public ParserBase(IOContext ctxt, int features) {
        super(features);
        this._currInputRow = 1;
        this._tokenInputRow = 1;
        this._numTypesValid = 0;
        this._ioContext = ctxt;
        this._textBuffer = ctxt.constructTextBuffer();
        DupDetector dups = JsonParser.Feature.STRICT_DUPLICATE_DETECTION.enabledIn(features) ? DupDetector.rootDetector(this) : null;
        this._parsingContext = JsonReadContext.createRootContext(dups);
    }

    @Override // com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.core.Versioned
    public Version version() {
        return PackageVersion.VERSION;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getCurrentValue() {
        return this._parsingContext.getCurrentValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void setCurrentValue(Object v) {
        this._parsingContext.setCurrentValue(v);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser enable(JsonParser.Feature f) {
        this._features |= f.getMask();
        if (f == JsonParser.Feature.STRICT_DUPLICATE_DETECTION && this._parsingContext.getDupDetector() == null) {
            this._parsingContext = this._parsingContext.withDupDetector(DupDetector.rootDetector(this));
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser disable(JsonParser.Feature f) {
        this._features &= f.getMask() ^ (-1);
        if (f == JsonParser.Feature.STRICT_DUPLICATE_DETECTION) {
            this._parsingContext = this._parsingContext.withDupDetector(null);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    @Deprecated
    public JsonParser setFeatureMask(int newMask) {
        int changes = this._features ^ newMask;
        if (changes != 0) {
            this._features = newMask;
            _checkStdFeatureChanges(newMask, changes);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser overrideStdFeatures(int values, int mask) {
        int oldState = this._features;
        int newState = ((mask ^ (-1)) & oldState) | (values & mask);
        int changed = oldState ^ newState;
        if (changed != 0) {
            this._features = newState;
            _checkStdFeatureChanges(newState, changed);
        }
        return this;
    }

    protected void _checkStdFeatureChanges(int newFeatureFlags, int changedFeatures) {
        int f = JsonParser.Feature.STRICT_DUPLICATE_DETECTION.getMask();
        if ((changedFeatures & f) != 0 && (newFeatureFlags & f) != 0) {
            if (this._parsingContext.getDupDetector() == null) {
                this._parsingContext = this._parsingContext.withDupDetector(DupDetector.rootDetector(this));
            } else {
                this._parsingContext = this._parsingContext.withDupDetector(null);
            }
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getCurrentName() throws IOException {
        JsonReadContext parent;
        return ((this._currToken == JsonToken.START_OBJECT || this._currToken == JsonToken.START_ARRAY) && (parent = this._parsingContext.mo319getParent()) != null) ? parent.getCurrentName() : this._parsingContext.getCurrentName();
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public void overrideCurrentName(String name) {
        JsonReadContext ctxt = this._parsingContext;
        if (this._currToken == JsonToken.START_OBJECT || this._currToken == JsonToken.START_ARRAY) {
            ctxt = ctxt.mo319getParent();
        }
        try {
            ctxt.setCurrentName(name);
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this._closed) {
            this._closed = true;
            try {
                _closeInput();
            } finally {
                _releaseBuffers();
            }
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public boolean isClosed() {
        return this._closed;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    /* renamed from: getParsingContext  reason: collision with other method in class */
    public JsonReadContext mo312getParsingContext() {
        return this._parsingContext;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonLocation getTokenLocation() {
        return new JsonLocation(this._ioContext.getSourceReference(), -1L, getTokenCharacterOffset(), getTokenLineNr(), getTokenColumnNr());
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        int col = (this._inputPtr - this._currInputRowStart) + 1;
        return new JsonLocation(this._ioContext.getSourceReference(), -1L, this._currInputProcessed + this._inputPtr, this._currInputRow, col);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public boolean hasTextCharacters() {
        if (this._currToken == JsonToken.VALUE_STRING) {
            return true;
        }
        if (this._currToken != JsonToken.FIELD_NAME) {
            return false;
        }
        return this._nameCopied;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public byte[] getBinaryValue(Base64Variant variant) throws IOException {
        if (this._binaryValue == null) {
            if (this._currToken != JsonToken.VALUE_STRING) {
                _reportError("Current token (" + this._currToken + ") not VALUE_STRING, can not access as binary");
            }
            ByteArrayBuilder builder = _getByteArrayBuilder();
            _decodeBase64(getText(), builder, variant);
            this._binaryValue = builder.toByteArray();
        }
        return this._binaryValue;
    }

    public long getTokenCharacterOffset() {
        return this._tokenInputTotal;
    }

    public int getTokenLineNr() {
        return this._tokenInputRow;
    }

    public int getTokenColumnNr() {
        int col = this._tokenInputCol;
        return col < 0 ? col : col + 1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _releaseBuffers() throws IOException {
        this._textBuffer.releaseBuffers();
        char[] buf = this._nameCopyBuffer;
        if (buf != null) {
            this._nameCopyBuffer = null;
            this._ioContext.releaseNameCopyBuffer(buf);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase
    protected void _handleEOF() throws JsonParseException {
        if (!this._parsingContext.inRoot()) {
            String marker = this._parsingContext.inArray() ? "Array" : "Object";
            _reportInvalidEOF(String.format(": expected close marker for %s (start marker at %s)", marker, this._parsingContext.getStartLocation(this._ioContext.getSourceReference())), null);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final int _eofAsNextChar() throws JsonParseException {
        _handleEOF();
        return -1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void _reportMismatchedEndMarker(int actCh, char expCh) throws JsonParseException {
        String startDesc = "" + this._parsingContext.getStartLocation(this._ioContext.getSourceReference());
        _reportError("Unexpected close marker '" + ((char) actCh) + "': expected '" + expCh + "' (for " + this._parsingContext.typeDesc() + " starting at " + startDesc + ")");
    }

    public ByteArrayBuilder _getByteArrayBuilder() {
        if (this._byteArrayBuilder == null) {
            this._byteArrayBuilder = new ByteArrayBuilder();
        } else {
            this._byteArrayBuilder.reset();
        }
        return this._byteArrayBuilder;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final JsonToken reset(boolean negative, int intLen, int fractLen, int expLen) {
        return (fractLen >= 1 || expLen >= 1) ? resetFloat(negative, intLen, fractLen, expLen) : resetInt(negative, intLen);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final JsonToken resetInt(boolean negative, int intLen) {
        this._numberNegative = negative;
        this._intLength = intLen;
        this._fractLength = 0;
        this._expLength = 0;
        this._numTypesValid = 0;
        return JsonToken.VALUE_NUMBER_INT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final JsonToken resetFloat(boolean negative, int intLen, int fractLen, int expLen) {
        this._numberNegative = negative;
        this._intLength = intLen;
        this._fractLength = fractLen;
        this._expLength = expLen;
        this._numTypesValid = 0;
        return JsonToken.VALUE_NUMBER_FLOAT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final JsonToken resetAsNaN(String valueStr, double value) {
        this._textBuffer.resetWithString(valueStr);
        this._numberDouble = value;
        this._numTypesValid = 8;
        return JsonToken.VALUE_NUMBER_FLOAT;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Number getNumberValue() throws IOException {
        if (this._numTypesValid == 0) {
            _parseNumericValue(0);
        }
        if (this._currToken == JsonToken.VALUE_NUMBER_INT) {
            if ((this._numTypesValid & 1) != 0) {
                return Integer.valueOf(this._numberInt);
            }
            if ((this._numTypesValid & 2) != 0) {
                return Long.valueOf(this._numberLong);
            }
            if ((this._numTypesValid & 4) != 0) {
                return this._numberBigInt;
            }
            return this._numberBigDecimal;
        } else if ((this._numTypesValid & 16) != 0) {
            return this._numberBigDecimal;
        } else {
            if ((this._numTypesValid & 8) == 0) {
                _throwInternal();
            }
            return Double.valueOf(this._numberDouble);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser.NumberType getNumberType() throws IOException {
        if (this._numTypesValid == 0) {
            _parseNumericValue(0);
        }
        if (this._currToken == JsonToken.VALUE_NUMBER_INT) {
            if ((this._numTypesValid & 1) != 0) {
                return JsonParser.NumberType.INT;
            }
            if ((this._numTypesValid & 2) != 0) {
                return JsonParser.NumberType.LONG;
            }
            return JsonParser.NumberType.BIG_INTEGER;
        } else if ((this._numTypesValid & 16) != 0) {
            return JsonParser.NumberType.BIG_DECIMAL;
        } else {
            return JsonParser.NumberType.DOUBLE;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getIntValue() throws IOException {
        if ((this._numTypesValid & 1) == 0) {
            if (this._numTypesValid == 0) {
                return _parseIntValue();
            }
            if ((this._numTypesValid & 1) == 0) {
                convertNumberToInt();
            }
        }
        return this._numberInt;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long getLongValue() throws IOException {
        if ((this._numTypesValid & 2) == 0) {
            if (this._numTypesValid == 0) {
                _parseNumericValue(2);
            }
            if ((this._numTypesValid & 2) == 0) {
                convertNumberToLong();
            }
        }
        return this._numberLong;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public BigInteger getBigIntegerValue() throws IOException {
        if ((this._numTypesValid & 4) == 0) {
            if (this._numTypesValid == 0) {
                _parseNumericValue(4);
            }
            if ((this._numTypesValid & 4) == 0) {
                convertNumberToBigInteger();
            }
        }
        return this._numberBigInt;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public float getFloatValue() throws IOException {
        double value = getDoubleValue();
        return (float) value;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public double getDoubleValue() throws IOException {
        if ((this._numTypesValid & 8) == 0) {
            if (this._numTypesValid == 0) {
                _parseNumericValue(8);
            }
            if ((this._numTypesValid & 8) == 0) {
                convertNumberToDouble();
            }
        }
        return this._numberDouble;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public BigDecimal getDecimalValue() throws IOException {
        if ((this._numTypesValid & 16) == 0) {
            if (this._numTypesValid == 0) {
                _parseNumericValue(16);
            }
            if ((this._numTypesValid & 16) == 0) {
                convertNumberToBigDecimal();
            }
        }
        return this._numberBigDecimal;
    }

    protected void _parseNumericValue(int expType) throws IOException {
        if (this._currToken == JsonToken.VALUE_NUMBER_INT) {
            char[] buf = this._textBuffer.getTextBuffer();
            int offset = this._textBuffer.getTextOffset();
            int len = this._intLength;
            if (this._numberNegative) {
                offset++;
            }
            if (len <= 9) {
                int i = NumberInput.parseInt(buf, offset, len);
                if (this._numberNegative) {
                    i = -i;
                }
                this._numberInt = i;
                this._numTypesValid = 1;
            } else if (len <= 18) {
                long l = NumberInput.parseLong(buf, offset, len);
                if (this._numberNegative) {
                    l = -l;
                }
                if (len == 10) {
                    if (this._numberNegative) {
                        if (l >= MIN_INT_L) {
                            this._numberInt = (int) l;
                            this._numTypesValid = 1;
                            return;
                        }
                    } else if (l <= MAX_INT_L) {
                        this._numberInt = (int) l;
                        this._numTypesValid = 1;
                        return;
                    }
                }
                this._numberLong = l;
                this._numTypesValid = 2;
            } else {
                _parseSlowInt(expType, buf, offset, len);
            }
        } else if (this._currToken == JsonToken.VALUE_NUMBER_FLOAT) {
            _parseSlowFloat(expType);
        } else {
            _reportError("Current token (" + this._currToken + ") not numeric, can not use numeric value accessors");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int _parseIntValue() throws IOException {
        if (this._currToken == JsonToken.VALUE_NUMBER_INT) {
            char[] buf = this._textBuffer.getTextBuffer();
            int offset = this._textBuffer.getTextOffset();
            int len = this._intLength;
            if (this._numberNegative) {
                offset++;
            }
            if (len <= 9) {
                int i = NumberInput.parseInt(buf, offset, len);
                if (this._numberNegative) {
                    i = -i;
                }
                this._numberInt = i;
                this._numTypesValid = 1;
                return i;
            }
        }
        _parseNumericValue(1);
        if ((this._numTypesValid & 1) == 0) {
            convertNumberToInt();
        }
        return this._numberInt;
    }

    private void _parseSlowFloat(int expType) throws IOException {
        try {
            if (expType == 16) {
                this._numberBigDecimal = this._textBuffer.contentsAsDecimal();
                this._numTypesValid = 16;
            } else {
                this._numberDouble = this._textBuffer.contentsAsDouble();
                this._numTypesValid = 8;
            }
        } catch (NumberFormatException nex) {
            _wrapError("Malformed numeric value '" + this._textBuffer.contentsAsString() + "'", nex);
        }
    }

    private void _parseSlowInt(int expType, char[] buf, int offset, int len) throws IOException {
        String numStr = this._textBuffer.contentsAsString();
        try {
            if (NumberInput.inLongRange(buf, offset, len, this._numberNegative)) {
                this._numberLong = Long.parseLong(numStr);
                this._numTypesValid = 2;
            } else {
                this._numberBigInt = new BigInteger(numStr);
                this._numTypesValid = 4;
            }
        } catch (NumberFormatException nex) {
            _wrapError("Malformed numeric value '" + numStr + "'", nex);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void convertNumberToInt() throws IOException {
        if ((this._numTypesValid & 2) != 0) {
            int result = (int) this._numberLong;
            if (result != this._numberLong) {
                _reportError("Numeric value (" + getText() + ") out of range of int");
            }
            this._numberInt = result;
        } else if ((this._numTypesValid & 4) != 0) {
            if (BI_MIN_INT.compareTo(this._numberBigInt) > 0 || BI_MAX_INT.compareTo(this._numberBigInt) < 0) {
                reportOverflowInt();
            }
            this._numberInt = this._numberBigInt.intValue();
        } else if ((this._numTypesValid & 8) != 0) {
            if (this._numberDouble < MIN_INT_D || this._numberDouble > MAX_INT_D) {
                reportOverflowInt();
            }
            this._numberInt = (int) this._numberDouble;
        } else if ((this._numTypesValid & 16) != 0) {
            if (BD_MIN_INT.compareTo(this._numberBigDecimal) > 0 || BD_MAX_INT.compareTo(this._numberBigDecimal) < 0) {
                reportOverflowInt();
            }
            this._numberInt = this._numberBigDecimal.intValue();
        } else {
            _throwInternal();
        }
        this._numTypesValid |= 1;
    }

    protected void convertNumberToLong() throws IOException {
        if ((this._numTypesValid & 1) != 0) {
            this._numberLong = this._numberInt;
        } else if ((this._numTypesValid & 4) != 0) {
            if (BI_MIN_LONG.compareTo(this._numberBigInt) > 0 || BI_MAX_LONG.compareTo(this._numberBigInt) < 0) {
                reportOverflowLong();
            }
            this._numberLong = this._numberBigInt.longValue();
        } else if ((this._numTypesValid & 8) != 0) {
            if (this._numberDouble < MIN_LONG_D || this._numberDouble > MAX_LONG_D) {
                reportOverflowLong();
            }
            this._numberLong = (long) this._numberDouble;
        } else if ((this._numTypesValid & 16) != 0) {
            if (BD_MIN_LONG.compareTo(this._numberBigDecimal) > 0 || BD_MAX_LONG.compareTo(this._numberBigDecimal) < 0) {
                reportOverflowLong();
            }
            this._numberLong = this._numberBigDecimal.longValue();
        } else {
            _throwInternal();
        }
        this._numTypesValid |= 2;
    }

    protected void convertNumberToBigInteger() throws IOException {
        if ((this._numTypesValid & 16) != 0) {
            this._numberBigInt = this._numberBigDecimal.toBigInteger();
        } else if ((this._numTypesValid & 2) != 0) {
            this._numberBigInt = BigInteger.valueOf(this._numberLong);
        } else if ((this._numTypesValid & 1) != 0) {
            this._numberBigInt = BigInteger.valueOf(this._numberInt);
        } else if ((this._numTypesValid & 8) != 0) {
            this._numberBigInt = BigDecimal.valueOf(this._numberDouble).toBigInteger();
        } else {
            _throwInternal();
        }
        this._numTypesValid |= 4;
    }

    protected void convertNumberToDouble() throws IOException {
        if ((this._numTypesValid & 16) != 0) {
            this._numberDouble = this._numberBigDecimal.doubleValue();
        } else if ((this._numTypesValid & 4) != 0) {
            this._numberDouble = this._numberBigInt.doubleValue();
        } else if ((this._numTypesValid & 2) != 0) {
            this._numberDouble = this._numberLong;
        } else if ((this._numTypesValid & 1) != 0) {
            this._numberDouble = this._numberInt;
        } else {
            _throwInternal();
        }
        this._numTypesValid |= 8;
    }

    protected void convertNumberToBigDecimal() throws IOException {
        if ((this._numTypesValid & 8) != 0) {
            this._numberBigDecimal = NumberInput.parseBigDecimal(getText());
        } else if ((this._numTypesValid & 4) != 0) {
            this._numberBigDecimal = new BigDecimal(this._numberBigInt);
        } else if ((this._numTypesValid & 2) != 0) {
            this._numberBigDecimal = BigDecimal.valueOf(this._numberLong);
        } else if ((this._numTypesValid & 1) != 0) {
            this._numberBigDecimal = BigDecimal.valueOf(this._numberInt);
        } else {
            _throwInternal();
        }
        this._numTypesValid |= 16;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void reportUnexpectedNumberChar(int ch, String comment) throws JsonParseException {
        String msg = "Unexpected character (" + _getCharDesc(ch) + ") in numeric value";
        if (comment != null) {
            msg = msg + ": " + comment;
        }
        _reportError(msg);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void reportInvalidNumber(String msg) throws JsonParseException {
        _reportError("Invalid numeric value: " + msg);
    }

    protected void reportOverflowInt() throws IOException {
        _reportError(String.format("Numeric value (%s) out of range of int (%d - %s)", getText(), Integer.MIN_VALUE, Integer.MAX_VALUE));
    }

    protected void reportOverflowLong() throws IOException {
        _reportError(String.format("Numeric value (%s) out of range of long (%d - %s)", getText(), Long.MIN_VALUE, Long.MAX_VALUE));
    }

    protected char _decodeEscaped() throws IOException {
        throw new UnsupportedOperationException();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final int _decodeBase64Escape(Base64Variant b64variant, int ch, int index) throws IOException {
        if (ch != 92) {
            throw reportInvalidBase64Char(b64variant, ch, index);
        }
        int unescaped = _decodeEscaped();
        if (unescaped <= 32 && index == 0) {
            return -1;
        }
        int bits = b64variant.decodeBase64Char(unescaped);
        if (bits < 0) {
            throw reportInvalidBase64Char(b64variant, unescaped, index);
        }
        return bits;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final int _decodeBase64Escape(Base64Variant b64variant, char ch, int index) throws IOException {
        if (ch != '\\') {
            throw reportInvalidBase64Char(b64variant, ch, index);
        }
        char unescaped = _decodeEscaped();
        if (unescaped <= ' ' && index == 0) {
            return -1;
        }
        int bits = b64variant.decodeBase64Char(unescaped);
        if (bits < 0) {
            throw reportInvalidBase64Char(b64variant, unescaped, index);
        }
        return bits;
    }

    protected IllegalArgumentException reportInvalidBase64Char(Base64Variant b64variant, int ch, int bindex) throws IllegalArgumentException {
        return reportInvalidBase64Char(b64variant, ch, bindex, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public IllegalArgumentException reportInvalidBase64Char(Base64Variant b64variant, int ch, int bindex, String msg) throws IllegalArgumentException {
        String base;
        if (ch <= 32) {
            base = "Illegal white space character (code 0x" + Integer.toHexString(ch) + ") as character #" + (bindex + 1) + " of 4-char base64 unit: can only used between units";
        } else if (b64variant.usesPaddingChar(ch)) {
            base = "Unexpected padding character ('" + b64variant.getPaddingChar() + "') as character #" + (bindex + 1) + " of 4-char base64 unit: padding only legal as 3rd or 4th character";
        } else if (!Character.isDefined(ch) || Character.isISOControl(ch)) {
            base = "Illegal character (code 0x" + Integer.toHexString(ch) + ") in base64 content";
        } else {
            base = "Illegal character '" + ((char) ch) + "' (code 0x" + Integer.toHexString(ch) + ") in base64 content";
        }
        if (msg != null) {
            base = base + ": " + msg;
        }
        return new IllegalArgumentException(base);
    }

    @Deprecated
    protected void loadMoreGuaranteed() throws IOException {
        if (!loadMore()) {
            _reportInvalidEOF();
        }
    }

    @Deprecated
    protected boolean loadMore() throws IOException {
        return false;
    }

    protected void _finishString() throws IOException {
    }
}
