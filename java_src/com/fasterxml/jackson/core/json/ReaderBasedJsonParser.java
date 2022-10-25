package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.base.ParserBase;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.sym.CharsToNameCanonicalizer;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
/* loaded from: classes.dex */
public class ReaderBasedJsonParser extends ParserBase {
    protected static final int[] _icLatin1 = CharTypes.getInputCodeLatin1();
    protected boolean _bufferRecyclable;
    protected final int _hashSeed;
    protected char[] _inputBuffer;
    protected int _nameStartCol;
    protected long _nameStartOffset;
    protected int _nameStartRow;
    protected ObjectCodec _objectCodec;
    protected Reader _reader;
    protected final CharsToNameCanonicalizer _symbols;
    protected boolean _tokenIncomplete;

    public ReaderBasedJsonParser(IOContext ctxt, int features, Reader r, ObjectCodec codec, CharsToNameCanonicalizer st, char[] inputBuffer, int start, int end, boolean bufferRecyclable) {
        super(ctxt, features);
        this._reader = r;
        this._inputBuffer = inputBuffer;
        this._inputPtr = start;
        this._inputEnd = end;
        this._objectCodec = codec;
        this._symbols = st;
        this._hashSeed = st.hashSeed();
        this._bufferRecyclable = bufferRecyclable;
    }

    public ReaderBasedJsonParser(IOContext ctxt, int features, Reader r, ObjectCodec codec, CharsToNameCanonicalizer st) {
        super(ctxt, features);
        this._reader = r;
        this._inputBuffer = ctxt.allocTokenBuffer();
        this._inputPtr = 0;
        this._inputEnd = 0;
        this._objectCodec = codec;
        this._symbols = st;
        this._hashSeed = st.hashSeed();
        this._bufferRecyclable = true;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public ObjectCodec getCodec() {
        return this._objectCodec;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void setCodec(ObjectCodec c) {
        this._objectCodec = c;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int releaseBuffered(Writer w) throws IOException {
        int count = this._inputEnd - this._inputPtr;
        if (count < 1) {
            return 0;
        }
        int origPtr = this._inputPtr;
        w.write(this._inputBuffer, origPtr, count);
        return count;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getInputSource() {
        return this._reader;
    }

    @Deprecated
    protected char getNextChar(String eofMsg) throws IOException {
        return getNextChar(eofMsg, null);
    }

    protected char getNextChar(String eofMsg, JsonToken forToken) throws IOException {
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(eofMsg, forToken);
        }
        char[] cArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        return cArr[i];
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _closeInput() throws IOException {
        if (this._reader != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonParser.Feature.AUTO_CLOSE_SOURCE)) {
                this._reader.close();
            }
            this._reader = null;
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _releaseBuffers() throws IOException {
        char[] buf;
        super._releaseBuffers();
        this._symbols.release();
        if (this._bufferRecyclable && (buf = this._inputBuffer) != null) {
            this._inputBuffer = null;
            this._ioContext.releaseTokenBuffer(buf);
        }
    }

    protected void _loadMoreGuaranteed() throws IOException {
        if (!_loadMore()) {
            _reportInvalidEOF();
        }
    }

    protected boolean _loadMore() throws IOException {
        int bufSize = this._inputEnd;
        this._currInputProcessed += bufSize;
        this._currInputRowStart -= bufSize;
        this._nameStartOffset -= bufSize;
        if (this._reader != null) {
            int count = this._reader.read(this._inputBuffer, 0, this._inputBuffer.length);
            if (count > 0) {
                this._inputPtr = 0;
                this._inputEnd = count;
                return true;
            }
            _closeInput();
            if (count != 0) {
                return false;
            }
            throw new IOException("Reader returned 0 characters when trying to read " + this._inputEnd);
        }
        return false;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final String getText() throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        return _getText2(t);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getText(Writer writer) throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsToWriter(writer);
        } else if (t == JsonToken.FIELD_NAME) {
            String n = this._parsingContext.getCurrentName();
            writer.write(n);
            return n.length();
        } else if (t == null) {
            return 0;
        } else {
            if (t.isNumeric()) {
                return this._textBuffer.contentsToWriter(writer);
            }
            char[] ch = t.asCharArray();
            writer.write(ch);
            return ch.length;
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final String getValueAsString() throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        } else if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        } else {
            return super.getValueAsString(null);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final String getValueAsString(String defValue) throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        } else if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        } else {
            return super.getValueAsString(defValue);
        }
    }

    protected final String _getText2(JsonToken t) {
        if (t == null) {
            return null;
        }
        switch (t.id()) {
            case 5:
                return this._parsingContext.getCurrentName();
            case 6:
            case 7:
            case 8:
                return this._textBuffer.contentsAsString();
            default:
                return t.asString();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final char[] getTextCharacters() throws IOException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                    if (!this._nameCopied) {
                        String name = this._parsingContext.getCurrentName();
                        int nameLen = name.length();
                        if (this._nameCopyBuffer == null) {
                            this._nameCopyBuffer = this._ioContext.allocNameCopyBuffer(nameLen);
                        } else if (this._nameCopyBuffer.length < nameLen) {
                            this._nameCopyBuffer = new char[nameLen];
                        }
                        name.getChars(0, nameLen, this._nameCopyBuffer, 0);
                        this._nameCopied = true;
                    }
                    return this._nameCopyBuffer;
                case 6:
                    if (this._tokenIncomplete) {
                        this._tokenIncomplete = false;
                        _finishString();
                        break;
                    }
                    break;
                case 7:
                case 8:
                    break;
                default:
                    return this._currToken.asCharArray();
            }
            return this._textBuffer.getTextBuffer();
        }
        return null;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final int getTextLength() throws IOException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                    return this._parsingContext.getCurrentName().length();
                case 6:
                    if (this._tokenIncomplete) {
                        this._tokenIncomplete = false;
                        _finishString();
                        break;
                    }
                    break;
                case 7:
                case 8:
                    break;
                default:
                    return this._currToken.asCharArray().length;
            }
            return this._textBuffer.size();
        }
        return 0;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final int getTextOffset() throws IOException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                default:
                    return 0;
                case 6:
                    if (this._tokenIncomplete) {
                        this._tokenIncomplete = false;
                        _finishString();
                        break;
                    }
                    break;
                case 7:
                case 8:
                    break;
            }
            return this._textBuffer.getTextOffset();
        }
        return 0;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public byte[] getBinaryValue(Base64Variant b64variant) throws IOException {
        if (this._currToken != JsonToken.VALUE_STRING && (this._currToken != JsonToken.VALUE_EMBEDDED_OBJECT || this._binaryValue == null)) {
            _reportError("Current token (" + this._currToken + ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary");
        }
        if (this._tokenIncomplete) {
            try {
                this._binaryValue = _decodeBase64(b64variant);
                this._tokenIncomplete = false;
            } catch (IllegalArgumentException iae) {
                throw _constructError("Failed to decode VALUE_STRING as base64 (" + b64variant + "): " + iae.getMessage());
            }
        } else if (this._binaryValue == null) {
            ByteArrayBuilder builder = _getByteArrayBuilder();
            _decodeBase64(getText(), builder, b64variant);
            this._binaryValue = builder.toByteArray();
        }
        return this._binaryValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int readBinaryValue(Base64Variant b64variant, OutputStream out) throws IOException {
        if (!this._tokenIncomplete || this._currToken != JsonToken.VALUE_STRING) {
            byte[] b = getBinaryValue(b64variant);
            out.write(b);
            return b.length;
        }
        byte[] buf = this._ioContext.allocBase64Buffer();
        try {
            return _readBinary(b64variant, out, buf);
        } finally {
            this._ioContext.releaseBase64Buffer(buf);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0026, code lost:
        r10._tokenIncomplete = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0029, code lost:
        if (r5 <= 0) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x002b, code lost:
        r3 = r3 + r5;
        r12.write(r13, 0, r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0030, code lost:
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:?, code lost:
        return r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected int _readBinary(com.fasterxml.jackson.core.Base64Variant r11, java.io.OutputStream r12, byte[] r13) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 334
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._readBinary(com.fasterxml.jackson.core.Base64Variant, java.io.OutputStream, byte[]):int");
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final JsonToken nextToken() throws IOException {
        JsonToken t;
        if (this._currToken == JsonToken.FIELD_NAME) {
            return _nextAfterName();
        }
        this._numTypesValid = 0;
        if (this._tokenIncomplete) {
            _skipString();
        }
        int i = _skipWSOrEnd();
        if (i < 0) {
            close();
            this._currToken = null;
            return null;
        }
        this._binaryValue = null;
        if (i == 93) {
            _updateLocation();
            if (!this._parsingContext.inArray()) {
                _reportMismatchedEndMarker(i, '}');
            }
            this._parsingContext = this._parsingContext.clearAndGetParent();
            JsonToken jsonToken = JsonToken.END_ARRAY;
            this._currToken = jsonToken;
            return jsonToken;
        } else if (i == 125) {
            _updateLocation();
            if (!this._parsingContext.inObject()) {
                _reportMismatchedEndMarker(i, ']');
            }
            this._parsingContext = this._parsingContext.clearAndGetParent();
            JsonToken jsonToken2 = JsonToken.END_OBJECT;
            this._currToken = jsonToken2;
            return jsonToken2;
        } else {
            if (this._parsingContext.expectComma()) {
                i = _skipComma(i);
            }
            boolean inObject = this._parsingContext.inObject();
            if (inObject) {
                _updateNameLocation();
                String name = i == 34 ? _parseName() : _handleOddName(i);
                this._parsingContext.setCurrentName(name);
                this._currToken = JsonToken.FIELD_NAME;
                i = _skipColon();
            }
            _updateLocation();
            switch (i) {
                case 34:
                    this._tokenIncomplete = true;
                    t = JsonToken.VALUE_STRING;
                    break;
                case 45:
                    t = _parseNegNumber();
                    break;
                case 48:
                case 49:
                case 50:
                case 51:
                case 52:
                case 53:
                case 54:
                case 55:
                case 56:
                case 57:
                    t = _parsePosNumber(i);
                    break;
                case 91:
                    if (!inObject) {
                        this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                    }
                    t = JsonToken.START_ARRAY;
                    break;
                case 102:
                    _matchFalse();
                    t = JsonToken.VALUE_FALSE;
                    break;
                case 110:
                    _matchNull();
                    t = JsonToken.VALUE_NULL;
                    break;
                case 116:
                    _matchTrue();
                    t = JsonToken.VALUE_TRUE;
                    break;
                case 123:
                    if (!inObject) {
                        this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                    }
                    t = JsonToken.START_OBJECT;
                    break;
                case 125:
                    _reportUnexpectedChar(i, "expected a value");
                    _matchTrue();
                    t = JsonToken.VALUE_TRUE;
                    break;
                default:
                    t = _handleOddValue(i);
                    break;
            }
            if (inObject) {
                this._nextToken = t;
                JsonToken t2 = this._currToken;
                return t2;
            }
            this._currToken = t;
            return t;
        }
    }

    private final JsonToken _nextAfterName() {
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        this._currToken = t;
        return t;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void finishToken() throws IOException {
        if (this._tokenIncomplete) {
            this._tokenIncomplete = false;
            _finishString();
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean nextFieldName(SerializableString sstr) throws IOException {
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            _nextAfterName();
            return false;
        }
        if (this._tokenIncomplete) {
            _skipString();
        }
        int i = _skipWSOrEnd();
        if (i < 0) {
            close();
            this._currToken = null;
            return false;
        }
        this._binaryValue = null;
        if (i == 93) {
            _updateLocation();
            if (!this._parsingContext.inArray()) {
                _reportMismatchedEndMarker(i, '}');
            }
            this._parsingContext = this._parsingContext.clearAndGetParent();
            this._currToken = JsonToken.END_ARRAY;
            return false;
        } else if (i == 125) {
            _updateLocation();
            if (!this._parsingContext.inObject()) {
                _reportMismatchedEndMarker(i, ']');
            }
            this._parsingContext = this._parsingContext.clearAndGetParent();
            this._currToken = JsonToken.END_OBJECT;
            return false;
        } else {
            if (this._parsingContext.expectComma()) {
                i = _skipComma(i);
            }
            if (!this._parsingContext.inObject()) {
                _updateLocation();
                _nextTokenNotInObject(i);
                return false;
            }
            _updateNameLocation();
            if (i == 34) {
                char[] nameChars = sstr.asQuotedChars();
                int len = nameChars.length;
                if (this._inputPtr + len + 4 < this._inputEnd) {
                    int end = this._inputPtr + len;
                    if (this._inputBuffer[end] == '\"') {
                        int offset = 0;
                        int ptr = this._inputPtr;
                        while (ptr != end) {
                            if (nameChars[offset] == this._inputBuffer[ptr]) {
                                offset++;
                                ptr++;
                            }
                        }
                        this._parsingContext.setCurrentName(sstr.getValue());
                        _isNextTokenNameYes(_skipColonFast(ptr + 1));
                        return true;
                    }
                }
            }
            return _isNextTokenNameMaybe(i, sstr.getValue());
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String nextFieldName() throws IOException {
        JsonToken t;
        String name = null;
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            _nextAfterName();
        } else {
            if (this._tokenIncomplete) {
                _skipString();
            }
            int i = _skipWSOrEnd();
            if (i < 0) {
                close();
                this._currToken = null;
            } else {
                this._binaryValue = null;
                if (i == 93) {
                    _updateLocation();
                    if (!this._parsingContext.inArray()) {
                        _reportMismatchedEndMarker(i, '}');
                    }
                    this._parsingContext = this._parsingContext.clearAndGetParent();
                    this._currToken = JsonToken.END_ARRAY;
                } else if (i == 125) {
                    _updateLocation();
                    if (!this._parsingContext.inObject()) {
                        _reportMismatchedEndMarker(i, ']');
                    }
                    this._parsingContext = this._parsingContext.clearAndGetParent();
                    this._currToken = JsonToken.END_OBJECT;
                } else {
                    if (this._parsingContext.expectComma()) {
                        i = _skipComma(i);
                    }
                    if (!this._parsingContext.inObject()) {
                        _updateLocation();
                        _nextTokenNotInObject(i);
                    } else {
                        _updateNameLocation();
                        name = i == 34 ? _parseName() : _handleOddName(i);
                        this._parsingContext.setCurrentName(name);
                        this._currToken = JsonToken.FIELD_NAME;
                        int i2 = _skipColon();
                        _updateLocation();
                        if (i2 == 34) {
                            this._tokenIncomplete = true;
                            this._nextToken = JsonToken.VALUE_STRING;
                        } else {
                            switch (i2) {
                                case 45:
                                    t = _parseNegNumber();
                                    break;
                                case 48:
                                case 49:
                                case 50:
                                case 51:
                                case 52:
                                case 53:
                                case 54:
                                case 55:
                                case 56:
                                case 57:
                                    t = _parsePosNumber(i2);
                                    break;
                                case 91:
                                    t = JsonToken.START_ARRAY;
                                    break;
                                case 102:
                                    _matchFalse();
                                    t = JsonToken.VALUE_FALSE;
                                    break;
                                case 110:
                                    _matchNull();
                                    t = JsonToken.VALUE_NULL;
                                    break;
                                case 116:
                                    _matchTrue();
                                    t = JsonToken.VALUE_TRUE;
                                    break;
                                case 123:
                                    t = JsonToken.START_OBJECT;
                                    break;
                                default:
                                    t = _handleOddValue(i2);
                                    break;
                            }
                            this._nextToken = t;
                        }
                    }
                }
            }
        }
        return name;
    }

    private final void _isNextTokenNameYes(int i) throws IOException {
        this._currToken = JsonToken.FIELD_NAME;
        _updateLocation();
        switch (i) {
            case 34:
                this._tokenIncomplete = true;
                this._nextToken = JsonToken.VALUE_STRING;
                return;
            case 45:
                this._nextToken = _parseNegNumber();
                return;
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
                this._nextToken = _parsePosNumber(i);
                return;
            case 91:
                this._nextToken = JsonToken.START_ARRAY;
                return;
            case 102:
                _matchToken("false", 1);
                this._nextToken = JsonToken.VALUE_FALSE;
                return;
            case 110:
                _matchToken("null", 1);
                this._nextToken = JsonToken.VALUE_NULL;
                return;
            case 116:
                _matchToken("true", 1);
                this._nextToken = JsonToken.VALUE_TRUE;
                return;
            case 123:
                this._nextToken = JsonToken.START_OBJECT;
                return;
            default:
                this._nextToken = _handleOddValue(i);
                return;
        }
    }

    protected boolean _isNextTokenNameMaybe(int i, String nameToMatch) throws IOException {
        JsonToken t;
        String name = i == 34 ? _parseName() : _handleOddName(i);
        this._parsingContext.setCurrentName(name);
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        _updateLocation();
        if (i2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return nameToMatch.equals(name);
        }
        switch (i2) {
            case 45:
                t = _parseNegNumber();
                break;
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
                t = _parsePosNumber(i2);
                break;
            case 91:
                t = JsonToken.START_ARRAY;
                break;
            case 102:
                _matchFalse();
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchNull();
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchTrue();
                t = JsonToken.VALUE_TRUE;
                break;
            case 123:
                t = JsonToken.START_OBJECT;
                break;
            default:
                t = _handleOddValue(i2);
                break;
        }
        this._nextToken = t;
        return nameToMatch.equals(name);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private final JsonToken _nextTokenNotInObject(int i) throws IOException {
        if (i == 34) {
            this._tokenIncomplete = true;
            JsonToken jsonToken = JsonToken.VALUE_STRING;
            this._currToken = jsonToken;
            return jsonToken;
        }
        switch (i) {
            case 44:
            case 93:
                if (isEnabled(JsonParser.Feature.ALLOW_MISSING_VALUES)) {
                    this._inputPtr--;
                    JsonToken jsonToken2 = JsonToken.VALUE_NULL;
                    this._currToken = jsonToken2;
                    return jsonToken2;
                }
                break;
            case 45:
                JsonToken _parseNegNumber = _parseNegNumber();
                this._currToken = _parseNegNumber;
                return _parseNegNumber;
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
                JsonToken _parsePosNumber = _parsePosNumber(i);
                this._currToken = _parsePosNumber;
                return _parsePosNumber;
            case 91:
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken3 = JsonToken.START_ARRAY;
                this._currToken = jsonToken3;
                return jsonToken3;
            case 102:
                _matchToken("false", 1);
                JsonToken jsonToken4 = JsonToken.VALUE_FALSE;
                this._currToken = jsonToken4;
                return jsonToken4;
            case 110:
                _matchToken("null", 1);
                JsonToken jsonToken5 = JsonToken.VALUE_NULL;
                this._currToken = jsonToken5;
                return jsonToken5;
            case 116:
                _matchToken("true", 1);
                JsonToken jsonToken6 = JsonToken.VALUE_TRUE;
                this._currToken = jsonToken6;
                return jsonToken6;
            case 123:
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken7 = JsonToken.START_OBJECT;
                this._currToken = jsonToken7;
                return jsonToken7;
        }
        JsonToken _handleOddValue = _handleOddValue(i);
        this._currToken = _handleOddValue;
        return _handleOddValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public final String nextTextValue() throws IOException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken t = this._nextToken;
            this._nextToken = null;
            this._currToken = t;
            if (t == JsonToken.VALUE_STRING) {
                if (this._tokenIncomplete) {
                    this._tokenIncomplete = false;
                    _finishString();
                }
                return this._textBuffer.contentsAsString();
            } else if (t == JsonToken.START_ARRAY) {
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            } else if (t != JsonToken.START_OBJECT) {
                return null;
            } else {
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            }
        } else if (nextToken() != JsonToken.VALUE_STRING) {
            return null;
        } else {
            return getText();
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public final int nextIntValue(int defaultValue) throws IOException {
        if (this._currToken != JsonToken.FIELD_NAME) {
            return nextToken() == JsonToken.VALUE_NUMBER_INT ? getIntValue() : defaultValue;
        }
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        this._currToken = t;
        if (t == JsonToken.VALUE_NUMBER_INT) {
            return getIntValue();
        }
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
            return defaultValue;
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
            return defaultValue;
        } else {
            return defaultValue;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public final long nextLongValue(long defaultValue) throws IOException {
        if (this._currToken != JsonToken.FIELD_NAME) {
            return nextToken() == JsonToken.VALUE_NUMBER_INT ? getLongValue() : defaultValue;
        }
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        this._currToken = t;
        if (t == JsonToken.VALUE_NUMBER_INT) {
            return getLongValue();
        }
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
            return defaultValue;
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
            return defaultValue;
        } else {
            return defaultValue;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public final Boolean nextBooleanValue() throws IOException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken t = this._nextToken;
            this._nextToken = null;
            this._currToken = t;
            if (t == JsonToken.VALUE_TRUE) {
                return Boolean.TRUE;
            }
            if (t == JsonToken.VALUE_FALSE) {
                return Boolean.FALSE;
            }
            if (t == JsonToken.START_ARRAY) {
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            } else if (t != JsonToken.START_OBJECT) {
                return null;
            } else {
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            }
        }
        JsonToken t2 = nextToken();
        if (t2 == null) {
            return null;
        }
        int id = t2.id();
        if (id == 9) {
            return Boolean.TRUE;
        }
        if (id != 10) {
            return null;
        }
        return Boolean.FALSE;
    }

    protected final JsonToken _parsePosNumber(int ch) throws IOException {
        int ptr = this._inputPtr;
        int startPtr = ptr - 1;
        int inputLen = this._inputEnd;
        if (ch == 48) {
            return _parseNumber2(false, startPtr);
        }
        int intLen = 1;
        int ptr2 = ptr;
        while (ptr2 < inputLen) {
            int ptr3 = ptr2 + 1;
            char c = this._inputBuffer[ptr2];
            if (c >= '0' && c <= '9') {
                intLen++;
                ptr2 = ptr3;
            } else if (c == '.' || c == 'e' || c == 'E') {
                this._inputPtr = ptr3;
                return _parseFloat(c, startPtr, ptr3, false, intLen);
            } else {
                int ptr4 = ptr3 - 1;
                this._inputPtr = ptr4;
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(c);
                }
                int len = ptr4 - startPtr;
                this._textBuffer.resetWithShared(this._inputBuffer, startPtr, len);
                return resetInt(false, intLen);
            }
        }
        this._inputPtr = startPtr;
        return _parseNumber2(false, startPtr);
    }

    /*  JADX ERROR: JadxRuntimeException in pass: InitCodeVariables
        jadx.core.utils.exceptions.JadxRuntimeException: Several immutable types in one variable: [int, char], vars: [r9v0 ??, r9v1 ??, r9v8 ??, r9v7 ??, r9v5 ??, r9v4 ??, r9v3 ??, r9v2 ??, r9v6 ??]
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVarType(InitCodeVariables.java:107)
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:83)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:57)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:45)
        	at jadx.core.dex.visitors.InitCodeVariables.visit(InitCodeVariables.java:29)
        */
    private final com.fasterxml.jackson.core.JsonToken _parseFloat(
    /*  JADX ERROR: JadxRuntimeException in pass: InitCodeVariables
        jadx.core.utils.exceptions.JadxRuntimeException: Several immutable types in one variable: [int, char], vars: [r9v0 ??, r9v1 ??, r9v8 ??, r9v7 ??, r9v5 ??, r9v4 ??, r9v3 ??, r9v2 ??, r9v6 ??]
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVarType(InitCodeVariables.java:107)
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:83)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:57)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:45)
        */
    /*  JADX ERROR: Method generation error
        jadx.core.utils.exceptions.JadxRuntimeException: Code variable not set in r9v0 ??
        	at jadx.core.dex.instructions.args.SSAVar.getCodeVar(SSAVar.java:227)
        	at jadx.core.codegen.MethodGen.addMethodArguments(MethodGen.java:222)
        	at jadx.core.codegen.MethodGen.addDefinition(MethodGen.java:167)
        	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:366)
        	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:306)
        	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$2(ClassGen.java:272)
        	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:183)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
        	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
        	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:258)
        */

    protected final JsonToken _parseNegNumber() throws IOException {
        int ptr = this._inputPtr;
        int startPtr = ptr - 1;
        int inputLen = this._inputEnd;
        if (ptr >= inputLen) {
            return _parseNumber2(true, startPtr);
        }
        int ptr2 = ptr + 1;
        char c = this._inputBuffer[ptr];
        if (c > '9' || c < '0') {
            this._inputPtr = ptr2;
            return _handleInvalidNumberStart(c, true);
        } else if (c == '0') {
            return _parseNumber2(true, startPtr);
        } else {
            int intLen = 1;
            while (ptr2 < inputLen) {
                int ptr3 = ptr2 + 1;
                char c2 = this._inputBuffer[ptr2];
                if (c2 >= '0' && c2 <= '9') {
                    intLen++;
                    ptr2 = ptr3;
                } else if (c2 == '.' || c2 == 'e' || c2 == 'E') {
                    this._inputPtr = ptr3;
                    return _parseFloat(c2, startPtr, ptr3, true, intLen);
                } else {
                    int ptr4 = ptr3 - 1;
                    this._inputPtr = ptr4;
                    if (this._parsingContext.inRoot()) {
                        _verifyRootSpace(c2);
                    }
                    int len = ptr4 - startPtr;
                    this._textBuffer.resetWithShared(this._inputBuffer, startPtr, len);
                    return resetInt(true, intLen);
                }
            }
            return _parseNumber2(true, startPtr);
        }
    }

    private final JsonToken _parseNumber2(boolean neg, int startPtr) throws IOException {
        char c;
        int outPtr;
        if (neg) {
            startPtr++;
        }
        this._inputPtr = startPtr;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int outPtr2 = 0;
        if (neg) {
            int outPtr3 = 0 + 1;
            outBuf[0] = '-';
            outPtr2 = outPtr3;
        }
        int intLen = 0;
        if (this._inputPtr < this._inputEnd) {
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            c = cArr[i];
        } else {
            c = getNextChar("No digit following minus sign", JsonToken.VALUE_NUMBER_INT);
        }
        if (c == '0') {
            c = _verifyNoLeadingZeroes();
        }
        boolean eof = false;
        while (true) {
            if (c < '0' || c > '9') {
                break;
            }
            intLen++;
            if (outPtr2 >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr2 = 0;
            }
            int outPtr4 = outPtr2 + 1;
            outBuf[outPtr2] = c;
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                c = 0;
                eof = true;
                outPtr2 = outPtr4;
                break;
            }
            char[] cArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            c = cArr2[i2];
            outPtr2 = outPtr4;
        }
        if (intLen == 0) {
            return _handleInvalidNumberStart(c, neg);
        }
        int fractLen = 0;
        if (c == '.') {
            if (outPtr2 >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr2 = 0;
            }
            int outPtr5 = outPtr2 + 1;
            outBuf[outPtr2] = c;
            while (true) {
                outPtr2 = outPtr5;
                if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                    eof = true;
                    break;
                }
                char[] cArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                c = cArr3[i3];
                if (c < '0' || c > '9') {
                    break;
                }
                fractLen++;
                if (outPtr2 >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr2 = 0;
                }
                outPtr5 = outPtr2 + 1;
                outBuf[outPtr2] = c;
            }
            if (fractLen == 0) {
                reportUnexpectedNumberChar(c, "Decimal point not followed by a digit");
            }
        }
        int expLen = 0;
        if (c == 'e' || c == 'E') {
            if (outPtr2 >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr2 = 0;
            }
            int outPtr6 = outPtr2 + 1;
            outBuf[outPtr2] = c;
            if (this._inputPtr < this._inputEnd) {
                char[] cArr4 = this._inputBuffer;
                int i4 = this._inputPtr;
                this._inputPtr = i4 + 1;
                c = cArr4[i4];
            } else {
                c = getNextChar("expected a digit for number exponent");
            }
            if (c == '-' || c == '+') {
                if (outPtr6 >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                } else {
                    outPtr = outPtr6;
                }
                outPtr6 = outPtr + 1;
                outBuf[outPtr] = c;
                if (this._inputPtr < this._inputEnd) {
                    char[] cArr5 = this._inputBuffer;
                    int i5 = this._inputPtr;
                    this._inputPtr = i5 + 1;
                    c = cArr5[i5];
                } else {
                    c = getNextChar("expected a digit for number exponent");
                }
            }
            while (true) {
                outPtr2 = outPtr6;
                if (c > '9' || c < '0') {
                    break;
                }
                expLen++;
                if (outPtr2 >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr2 = 0;
                }
                outPtr6 = outPtr2 + 1;
                outBuf[outPtr2] = c;
                if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                    eof = true;
                    outPtr2 = outPtr6;
                    break;
                }
                char[] cArr6 = this._inputBuffer;
                int i6 = this._inputPtr;
                this._inputPtr = i6 + 1;
                c = cArr6[i6];
            }
            if (expLen == 0) {
                reportUnexpectedNumberChar(c, "Exponent indicator not followed by a digit");
            }
        }
        if (!eof) {
            this._inputPtr--;
            if (this._parsingContext.inRoot()) {
                _verifyRootSpace(c);
            }
        }
        this._textBuffer.setCurrentLength(outPtr2);
        return reset(neg, intLen, fractLen, expLen);
    }

    private final char _verifyNoLeadingZeroes() throws IOException {
        char ch;
        if (this._inputPtr >= this._inputEnd || ((ch = this._inputBuffer[this._inputPtr]) >= '0' && ch <= '9')) {
            return _verifyNLZ2();
        }
        return '0';
    }

    private char _verifyNLZ2() throws IOException {
        if (this._inputPtr < this._inputEnd || _loadMore()) {
            char ch = this._inputBuffer[this._inputPtr];
            if (ch < '0' || ch > '9') {
                return '0';
            }
            if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS)) {
                reportInvalidNumber("Leading zeroes not allowed");
            }
            this._inputPtr++;
            if (ch == '0') {
                do {
                    if (this._inputPtr < this._inputEnd || _loadMore()) {
                        ch = this._inputBuffer[this._inputPtr];
                        if (ch < '0' || ch > '9') {
                            return '0';
                        }
                        this._inputPtr++;
                    } else {
                        return ch;
                    }
                } while (ch == '0');
                return ch;
            }
            return ch;
        }
        return '0';
    }

    /*  JADX ERROR: JadxRuntimeException in pass: InitCodeVariables
        jadx.core.utils.exceptions.JadxRuntimeException: Several immutable types in one variable: [int, char], vars: [r10v0 ??, r10v1 ??, r10v2 ??]
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVarType(InitCodeVariables.java:107)
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:83)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:57)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:45)
        	at jadx.core.dex.visitors.InitCodeVariables.visit(InitCodeVariables.java:29)
        */
    protected com.fasterxml.jackson.core.JsonToken _handleInvalidNumberStart(
    /*  JADX ERROR: JadxRuntimeException in pass: InitCodeVariables
        jadx.core.utils.exceptions.JadxRuntimeException: Several immutable types in one variable: [int, char], vars: [r10v0 ??, r10v1 ??, r10v2 ??]
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVarType(InitCodeVariables.java:107)
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:83)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:57)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:45)
        */
    /*  JADX ERROR: Method generation error
        jadx.core.utils.exceptions.JadxRuntimeException: Code variable not set in r10v0 ??
        	at jadx.core.dex.instructions.args.SSAVar.getCodeVar(SSAVar.java:227)
        	at jadx.core.codegen.MethodGen.addMethodArguments(MethodGen.java:222)
        	at jadx.core.codegen.MethodGen.addDefinition(MethodGen.java:167)
        	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:366)
        	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:306)
        	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$2(ClassGen.java:272)
        	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:183)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
        	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
        	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:258)
        */

    private final void _verifyRootSpace(int ch) throws IOException {
        this._inputPtr++;
        switch (ch) {
            case 9:
            case 32:
                return;
            case 10:
                this._currInputRow++;
                this._currInputRowStart = this._inputPtr;
                return;
            case 13:
                _skipCR();
                return;
            default:
                _reportMissingRootWS(ch);
                return;
        }
    }

    protected final String _parseName() throws IOException {
        int ptr = this._inputPtr;
        int hash = this._hashSeed;
        int[] codes = _icLatin1;
        while (true) {
            if (ptr >= this._inputEnd) {
                break;
            }
            char c = this._inputBuffer[ptr];
            if (c < codes.length && codes[c] != 0) {
                if (c == '\"') {
                    int start = this._inputPtr;
                    this._inputPtr = ptr + 1;
                    return this._symbols.findSymbol(this._inputBuffer, start, ptr - start, hash);
                }
            } else {
                hash = (hash * 33) + c;
                ptr++;
            }
        }
        int start2 = this._inputPtr;
        this._inputPtr = ptr;
        return _parseName2(start2, hash, 34);
    }

    private String _parseName2(int startPtr, int hash, int endChar) throws IOException {
        this._textBuffer.resetWithShared(this._inputBuffer, startPtr, this._inputPtr - startPtr);
        char[] outBuf = this._textBuffer.getCurrentSegment();
        int outPtr = this._textBuffer.getCurrentSegmentSize();
        while (true) {
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOF(" in field name", JsonToken.FIELD_NAME);
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c <= '\\') {
                if (c == '\\') {
                    c = _decodeEscaped();
                } else if (c <= endChar) {
                    if (c != endChar) {
                        if (c < ' ') {
                            _throwUnquotedSpace(c, "name");
                        }
                    } else {
                        this._textBuffer.setCurrentLength(outPtr);
                        TextBuffer tb = this._textBuffer;
                        char[] buf = tb.getTextBuffer();
                        int start = tb.getTextOffset();
                        int len = tb.size();
                        return this._symbols.findSymbol(buf, start, len, hash);
                    }
                }
            }
            hash = (hash * 33) + c;
            int outPtr2 = outPtr + 1;
            outBuf[outPtr] = c;
            if (outPtr2 >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            } else {
                outPtr = outPtr2;
            }
        }
    }

    protected String _handleOddName(int i) throws IOException {
        boolean firstOk;
        if (i == 39 && isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
            return _parseAposName();
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES)) {
            _reportUnexpectedChar(i, "was expecting double-quote to start field name");
        }
        int[] codes = CharTypes.getInputCodeLatin1JsNames();
        int maxCode = codes.length;
        if (i < maxCode) {
            firstOk = codes[i] == 0;
        } else {
            firstOk = Character.isJavaIdentifierPart((char) i);
        }
        if (!firstOk) {
            _reportUnexpectedChar(i, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
        }
        int ptr = this._inputPtr;
        int hash = this._hashSeed;
        int inputLen = this._inputEnd;
        if (ptr < inputLen) {
            do {
                char c = this._inputBuffer[ptr];
                if (c < maxCode) {
                    if (codes[c] != 0) {
                        int start = this._inputPtr - 1;
                        this._inputPtr = ptr;
                        return this._symbols.findSymbol(this._inputBuffer, start, ptr - start, hash);
                    }
                } else if (!Character.isJavaIdentifierPart(c)) {
                    int start2 = this._inputPtr - 1;
                    this._inputPtr = ptr;
                    return this._symbols.findSymbol(this._inputBuffer, start2, ptr - start2, hash);
                }
                hash = (hash * 33) + c;
                ptr++;
            } while (ptr < inputLen);
            this._inputPtr = ptr;
            return _handleOddName2(this._inputPtr - 1, hash, codes);
        }
        this._inputPtr = ptr;
        return _handleOddName2(this._inputPtr - 1, hash, codes);
    }

    protected String _parseAposName() throws IOException {
        int ptr = this._inputPtr;
        int hash = this._hashSeed;
        int inputLen = this._inputEnd;
        if (ptr < inputLen) {
            int[] codes = _icLatin1;
            int maxCode = codes.length;
            do {
                char c = this._inputBuffer[ptr];
                if (c == '\'') {
                    int start = this._inputPtr;
                    this._inputPtr = ptr + 1;
                    return this._symbols.findSymbol(this._inputBuffer, start, ptr - start, hash);
                } else if (c < maxCode && codes[c] != 0) {
                    break;
                } else {
                    hash = (hash * 33) + c;
                    ptr++;
                }
            } while (ptr < inputLen);
        }
        int start2 = this._inputPtr;
        this._inputPtr = ptr;
        return _parseName2(start2, hash, 39);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0040, code lost:
        if (r4._parsingContext.inArray() != false) goto L15;
     */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected com.fasterxml.jackson.core.JsonToken _handleOddValue(int r5) throws java.io.IOException {
        /*
            r4 = this;
            r1 = 1
            switch(r5) {
                case 39: goto L2d;
                case 43: goto L92;
                case 44: goto L42;
                case 73: goto L72;
                case 78: goto L53;
                case 93: goto L3a;
                default: goto L4;
            }
        L4:
            boolean r0 = java.lang.Character.isJavaIdentifierStart(r5)
            if (r0 == 0) goto L25
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = ""
            java.lang.StringBuilder r0 = r0.append(r1)
            char r1 = (char) r5
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.String r0 = r0.toString()
            java.lang.String r1 = "('true', 'false' or 'null')"
            r4._reportInvalidToken(r0, r1)
        L25:
            java.lang.String r0 = "expected a valid value (number, String, array, object, 'true', 'false' or 'null')"
            r4._reportUnexpectedChar(r5, r0)
            r0 = 0
        L2c:
            return r0
        L2d:
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_SINGLE_QUOTES
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L4
            com.fasterxml.jackson.core.JsonToken r0 = r4._handleApos()
            goto L2c
        L3a:
            com.fasterxml.jackson.core.json.JsonReadContext r0 = r4._parsingContext
            boolean r0 = r0.inArray()
            if (r0 == 0) goto L4
        L42:
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_MISSING_VALUES
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L4
            int r0 = r4._inputPtr
            int r0 = r0 + (-1)
            r4._inputPtr = r0
            com.fasterxml.jackson.core.JsonToken r0 = com.fasterxml.jackson.core.JsonToken.VALUE_NULL
            goto L2c
        L53:
            java.lang.String r0 = "NaN"
            r4._matchToken(r0, r1)
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L6b
            java.lang.String r0 = "NaN"
            r2 = 9221120237041090560(0x7ff8000000000000, double:NaN)
            com.fasterxml.jackson.core.JsonToken r0 = r4.resetAsNaN(r0, r2)
            goto L2c
        L6b:
            java.lang.String r0 = "Non-standard token 'NaN': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r4._reportError(r0)
            goto L4
        L72:
            java.lang.String r0 = "Infinity"
            r4._matchToken(r0, r1)
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L8a
            java.lang.String r0 = "Infinity"
            r2 = 9218868437227405312(0x7ff0000000000000, double:Infinity)
            com.fasterxml.jackson.core.JsonToken r0 = r4.resetAsNaN(r0, r2)
            goto L2c
        L8a:
            java.lang.String r0 = "Non-standard token 'Infinity': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r4._reportError(r0)
            goto L4
        L92:
            int r0 = r4._inputPtr
            int r1 = r4._inputEnd
            if (r0 < r1) goto La3
            boolean r0 = r4._loadMore()
            if (r0 != 0) goto La3
            com.fasterxml.jackson.core.JsonToken r0 = com.fasterxml.jackson.core.JsonToken.VALUE_NUMBER_INT
            r4._reportInvalidEOFInValue(r0)
        La3:
            char[] r0 = r4._inputBuffer
            int r1 = r4._inputPtr
            int r2 = r1 + 1
            r4._inputPtr = r2
            char r0 = r0[r1]
            r1 = 0
            com.fasterxml.jackson.core.JsonToken r0 = r4._handleInvalidNumberStart(r0, r1)
            goto L2c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._handleOddValue(int):com.fasterxml.jackson.core.JsonToken");
    }

    protected JsonToken _handleApos() throws IOException {
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int outPtr = this._textBuffer.getCurrentSegmentSize();
        while (true) {
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOF(": was expecting closing quote for a string value", JsonToken.VALUE_STRING);
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c <= '\\') {
                if (c == '\\') {
                    c = _decodeEscaped();
                } else if (c <= '\'') {
                    if (c != '\'') {
                        if (c < ' ') {
                            _throwUnquotedSpace(c, "string value");
                        }
                    } else {
                        this._textBuffer.setCurrentLength(outPtr);
                        return JsonToken.VALUE_STRING;
                    }
                }
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            outBuf[outPtr] = c;
            outPtr++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x006e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x005f A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String _handleOddName2(int r15, int r16, int[] r17) throws java.io.IOException {
        /*
            r14 = this;
            com.fasterxml.jackson.core.util.TextBuffer r11 = r14._textBuffer
            char[] r12 = r14._inputBuffer
            int r13 = r14._inputPtr
            int r13 = r13 - r15
            r11.resetWithShared(r12, r15, r13)
            com.fasterxml.jackson.core.util.TextBuffer r11 = r14._textBuffer
            char[] r6 = r11.getCurrentSegment()
            com.fasterxml.jackson.core.util.TextBuffer r11 = r14._textBuffer
            int r7 = r11.getCurrentSegmentSize()
            r0 = r17
            int r5 = r0.length
        L19:
            int r11 = r14._inputPtr
            int r12 = r14._inputEnd
            if (r11 < r12) goto L41
            boolean r11 = r14._loadMore()
            if (r11 != 0) goto L41
        L25:
            com.fasterxml.jackson.core.util.TextBuffer r11 = r14._textBuffer
            r11.setCurrentLength(r7)
            com.fasterxml.jackson.core.util.TextBuffer r10 = r14._textBuffer
            char[] r1 = r10.getTextBuffer()
            int r9 = r10.getTextOffset()
            int r4 = r10.size()
            com.fasterxml.jackson.core.sym.CharsToNameCanonicalizer r11 = r14._symbols
            r0 = r16
            java.lang.String r11 = r11.findSymbol(r1, r9, r4, r0)
            return r11
        L41:
            char[] r11 = r14._inputBuffer
            int r12 = r14._inputPtr
            char r2 = r11[r12]
            r3 = r2
            if (r3 > r5) goto L67
            r11 = r17[r3]
            if (r11 != 0) goto L25
        L4e:
            int r11 = r14._inputPtr
            int r11 = r11 + 1
            r14._inputPtr = r11
            int r11 = r16 * 33
            int r16 = r11 + r3
            int r8 = r7 + 1
            r6[r7] = r2
            int r11 = r6.length
            if (r8 < r11) goto L6e
            com.fasterxml.jackson.core.util.TextBuffer r11 = r14._textBuffer
            char[] r6 = r11.finishCurrentSegment()
            r7 = 0
            goto L19
        L67:
            boolean r11 = java.lang.Character.isJavaIdentifierPart(r2)
            if (r11 != 0) goto L4e
            goto L25
        L6e:
            r7 = r8
            goto L19
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._handleOddName2(int, int, int[]):java.lang.String");
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected final void _finishString() throws IOException {
        int ptr = this._inputPtr;
        int inputLen = this._inputEnd;
        if (ptr < inputLen) {
            int[] codes = _icLatin1;
            int maxCode = codes.length;
            while (true) {
                char c = this._inputBuffer[ptr];
                if (c < maxCode && codes[c] != 0) {
                    if (c == '\"') {
                        this._textBuffer.resetWithShared(this._inputBuffer, this._inputPtr, ptr - this._inputPtr);
                        this._inputPtr = ptr + 1;
                        return;
                    }
                } else {
                    ptr++;
                    if (ptr >= inputLen) {
                        break;
                    }
                }
            }
        }
        this._textBuffer.resetWithCopy(this._inputBuffer, this._inputPtr, ptr - this._inputPtr);
        this._inputPtr = ptr;
        _finishString2();
    }

    protected void _finishString2() throws IOException {
        char[] outBuf = this._textBuffer.getCurrentSegment();
        int outPtr = this._textBuffer.getCurrentSegmentSize();
        int[] codes = _icLatin1;
        int maxCode = codes.length;
        while (true) {
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOF(": was expecting closing quote for a string value", JsonToken.VALUE_STRING);
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c < maxCode && codes[c] != 0) {
                if (c != '\"') {
                    if (c != '\\') {
                        if (c < ' ') {
                            _throwUnquotedSpace(c, "string value");
                        }
                    } else {
                        c = _decodeEscaped();
                    }
                } else {
                    this._textBuffer.setCurrentLength(outPtr);
                    return;
                }
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            outBuf[outPtr] = c;
            outPtr++;
        }
    }

    protected final void _skipString() throws IOException {
        this._tokenIncomplete = false;
        int inPtr = this._inputPtr;
        int inLen = this._inputEnd;
        char[] inBuf = this._inputBuffer;
        while (true) {
            if (inPtr >= inLen) {
                this._inputPtr = inPtr;
                if (!_loadMore()) {
                    _reportInvalidEOF(": was expecting closing quote for a string value", JsonToken.VALUE_STRING);
                }
                inPtr = this._inputPtr;
                inLen = this._inputEnd;
            }
            int inPtr2 = inPtr + 1;
            char c = inBuf[inPtr];
            if (c <= '\\') {
                if (c == '\\') {
                    this._inputPtr = inPtr2;
                    _decodeEscaped();
                    inPtr = this._inputPtr;
                    inLen = this._inputEnd;
                } else if (c <= '\"') {
                    if (c != '\"') {
                        if (c < ' ') {
                            this._inputPtr = inPtr2;
                            _throwUnquotedSpace(c, "string value");
                        }
                    } else {
                        this._inputPtr = inPtr2;
                        return;
                    }
                }
            }
            inPtr = inPtr2;
        }
    }

    protected final void _skipCR() throws IOException {
        if ((this._inputPtr < this._inputEnd || _loadMore()) && this._inputBuffer[this._inputPtr] == '\n') {
            this._inputPtr++;
        }
        this._currInputRow++;
        this._currInputRowStart = this._inputPtr;
    }

    private final int _skipColon() throws IOException {
        if (this._inputPtr + 4 >= this._inputEnd) {
            return _skipColon2(false);
        }
        char c = this._inputBuffer[this._inputPtr];
        if (c == ':') {
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr + 1;
            this._inputPtr = i;
            char c2 = cArr[i];
            if (c2 > ' ') {
                if (c2 == '/' || c2 == '#') {
                    int i2 = _skipColon2(true);
                    return i2;
                }
                this._inputPtr++;
                return c2;
            }
            if (c2 == ' ' || c2 == '\t') {
                char[] cArr2 = this._inputBuffer;
                int i3 = this._inputPtr + 1;
                this._inputPtr = i3;
                char c3 = cArr2[i3];
                if (c3 > ' ') {
                    if (c3 == '/' || c3 == '#') {
                        int i4 = _skipColon2(true);
                        return i4;
                    }
                    this._inputPtr++;
                    return c3;
                }
            }
            int i5 = _skipColon2(true);
            return i5;
        }
        if (c == ' ' || c == '\t') {
            char[] cArr3 = this._inputBuffer;
            int i6 = this._inputPtr + 1;
            this._inputPtr = i6;
            c = cArr3[i6];
        }
        if (c == ':') {
            char[] cArr4 = this._inputBuffer;
            int i7 = this._inputPtr + 1;
            this._inputPtr = i7;
            char c4 = cArr4[i7];
            if (c4 > ' ') {
                if (c4 == '/' || c4 == '#') {
                    int i8 = _skipColon2(true);
                    return i8;
                }
                this._inputPtr++;
                return c4;
            }
            if (c4 == ' ' || c4 == '\t') {
                char[] cArr5 = this._inputBuffer;
                int i9 = this._inputPtr + 1;
                this._inputPtr = i9;
                char c5 = cArr5[i9];
                if (c5 > ' ') {
                    if (c5 == '/' || c5 == '#') {
                        int i10 = _skipColon2(true);
                        return i10;
                    }
                    this._inputPtr++;
                    return c5;
                }
            }
            int i11 = _skipColon2(true);
            return i11;
        }
        return _skipColon2(false);
    }

    private final int _skipColon2(boolean gotColon) throws IOException {
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                char[] cArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                char c = cArr[i];
                if (c > ' ') {
                    if (c == '/') {
                        _skipComment();
                    } else if (c != '#' || !_skipYAMLComment()) {
                        if (!gotColon) {
                            if (c != ':') {
                                _reportUnexpectedChar(c, "was expecting a colon to separate field name and value");
                            }
                            gotColon = true;
                        } else {
                            return c;
                        }
                    }
                } else if (c < ' ') {
                    if (c == '\n') {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (c == '\r') {
                        _skipCR();
                    } else if (c != '\t') {
                        _throwInvalidSpace(c);
                    }
                }
            } else {
                _reportInvalidEOF(" within/between " + this._parsingContext.typeDesc() + " entries", null);
                return -1;
            }
        }
    }

    private final int _skipColonFast(int ptr) throws IOException {
        int ptr2;
        boolean gotColon = true;
        int ptr3 = ptr + 1;
        char c = this._inputBuffer[ptr];
        if (c == ':') {
            int ptr4 = ptr3 + 1;
            char c2 = this._inputBuffer[ptr3];
            if (c2 > ' ') {
                if (c2 != '/' && c2 != '#') {
                    this._inputPtr = ptr4;
                    return c2;
                }
            } else if (c2 == ' ' || c2 == '\t') {
                int ptr5 = ptr4 + 1;
                char c3 = this._inputBuffer[ptr4];
                if (c3 > ' ' && c3 != '/' && c3 != '#') {
                    this._inputPtr = ptr5;
                    return c3;
                }
                ptr4 = ptr5;
            }
            this._inputPtr = ptr4 - 1;
            return _skipColon2(true);
        }
        if (c == ' ' || c == '\t') {
            c = this._inputBuffer[ptr3];
            ptr3++;
        }
        if (c != ':') {
            gotColon = false;
        }
        if (gotColon) {
            ptr2 = ptr3 + 1;
            char c4 = this._inputBuffer[ptr3];
            if (c4 > ' ') {
                if (c4 != '/' && c4 != '#') {
                    this._inputPtr = ptr2;
                    return c4;
                }
            } else if (c4 == ' ' || c4 == '\t') {
                ptr3 = ptr2 + 1;
                char c5 = this._inputBuffer[ptr2];
                if (c5 > ' ' && c5 != '/' && c5 != '#') {
                    this._inputPtr = ptr3;
                    return c5;
                }
            }
            this._inputPtr = ptr2 - 1;
            return _skipColon2(gotColon);
        }
        ptr2 = ptr3;
        this._inputPtr = ptr2 - 1;
        return _skipColon2(gotColon);
    }

    private final int _skipComma(int i) throws IOException {
        if (i != 44) {
            _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
        }
        while (this._inputPtr < this._inputEnd) {
            char[] cArr = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            char c = cArr[i2];
            if (c > ' ') {
                if (c != '/' && c != '#') {
                    return c;
                }
                this._inputPtr--;
                return _skipAfterComma2();
            } else if (c < ' ') {
                if (c == '\n') {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (c == '\r') {
                    _skipCR();
                } else if (c != '\t') {
                    _throwInvalidSpace(c);
                }
            }
        }
        return _skipAfterComma2();
    }

    private final int _skipAfterComma2() throws IOException {
        char c;
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                char[] cArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                c = cArr[i];
                if (c > ' ') {
                    if (c == '/') {
                        _skipComment();
                    } else if (c != '#' || !_skipYAMLComment()) {
                        break;
                    }
                } else if (c < ' ') {
                    if (c == '\n') {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (c == '\r') {
                        _skipCR();
                    } else if (c != '\t') {
                        _throwInvalidSpace(c);
                    }
                }
            } else {
                throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.typeDesc() + " entries");
            }
        }
        return c;
    }

    private final int _skipWSOrEnd() throws IOException {
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            return _eofAsNextChar();
        }
        char[] cArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        char c = cArr[i];
        if (c > ' ') {
            if (c == '/' || c == '#') {
                this._inputPtr--;
                int i2 = _skipWSOrEnd2();
                return i2;
            }
            return c;
        }
        if (c != ' ') {
            if (c == '\n') {
                this._currInputRow++;
                this._currInputRowStart = this._inputPtr;
            } else if (c == '\r') {
                _skipCR();
            } else if (c != '\t') {
                _throwInvalidSpace(c);
            }
        }
        while (this._inputPtr < this._inputEnd) {
            char[] cArr2 = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            char c2 = cArr2[i3];
            if (c2 > ' ') {
                if (c2 == '/' || c2 == '#') {
                    this._inputPtr--;
                    int i4 = _skipWSOrEnd2();
                    return i4;
                }
                return c2;
            } else if (c2 != ' ') {
                if (c2 == '\n') {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (c2 == '\r') {
                    _skipCR();
                } else if (c2 != '\t') {
                    _throwInvalidSpace(c2);
                }
            }
        }
        int i5 = _skipWSOrEnd2();
        return i5;
    }

    private int _skipWSOrEnd2() throws IOException {
        while (true) {
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                return _eofAsNextChar();
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c > ' ') {
                if (c == '/') {
                    _skipComment();
                } else if (c != '#' || !_skipYAMLComment()) {
                    return c;
                }
            } else if (c != ' ') {
                if (c == '\n') {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (c == '\r') {
                    _skipCR();
                } else if (c != '\t') {
                    _throwInvalidSpace(c);
                }
            }
        }
    }

    private void _skipComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_COMMENTS)) {
            _reportUnexpectedChar(47, "maybe a (non-standard) comment? (not recognized as one since Feature 'ALLOW_COMMENTS' not enabled for parser)");
        }
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(" in a comment", null);
        }
        char[] cArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        char c = cArr[i];
        if (c == '/') {
            _skipLine();
        } else if (c == '*') {
            _skipCComment();
        } else {
            _reportUnexpectedChar(c, "was expecting either '*' or '/' for a comment");
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0028, code lost:
        _reportInvalidEOF(" in a comment", null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002f, code lost:
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _skipCComment() throws java.io.IOException {
        /*
            r5 = this;
            r4 = 42
        L2:
            int r1 = r5._inputPtr
            int r2 = r5._inputEnd
            if (r1 < r2) goto Le
            boolean r1 = r5._loadMore()
            if (r1 == 0) goto L28
        Le:
            char[] r1 = r5._inputBuffer
            int r2 = r5._inputPtr
            int r3 = r2 + 1
            r5._inputPtr = r3
            char r0 = r1[r2]
            if (r0 > r4) goto L2
            if (r0 != r4) goto L41
            int r1 = r5._inputPtr
            int r2 = r5._inputEnd
            if (r1 < r2) goto L30
            boolean r1 = r5._loadMore()
            if (r1 != 0) goto L30
        L28:
            java.lang.String r1 = " in a comment"
            r2 = 0
            r5._reportInvalidEOF(r1, r2)
        L2f:
            return
        L30:
            char[] r1 = r5._inputBuffer
            int r2 = r5._inputPtr
            char r1 = r1[r2]
            r2 = 47
            if (r1 != r2) goto L2
            int r1 = r5._inputPtr
            int r1 = r1 + 1
            r5._inputPtr = r1
            goto L2f
        L41:
            r1 = 32
            if (r0 >= r1) goto L2
            r1 = 10
            if (r0 != r1) goto L54
            int r1 = r5._currInputRow
            int r1 = r1 + 1
            r5._currInputRow = r1
            int r1 = r5._inputPtr
            r5._currInputRowStart = r1
            goto L2
        L54:
            r1 = 13
            if (r0 != r1) goto L5c
            r5._skipCR()
            goto L2
        L5c:
            r1 = 9
            if (r0 == r1) goto L2
            r5._throwInvalidSpace(r0)
            goto L2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._skipCComment():void");
    }

    private boolean _skipYAMLComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_YAML_COMMENTS)) {
            return false;
        }
        _skipLine();
        return true;
    }

    private void _skipLine() throws IOException {
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                char[] cArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                char c = cArr[i];
                if (c < ' ') {
                    if (c == '\n') {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                        return;
                    } else if (c == '\r') {
                        _skipCR();
                        return;
                    } else if (c != '\t') {
                        _throwInvalidSpace(c);
                    }
                }
            } else {
                return;
            }
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected char _decodeEscaped() throws IOException {
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(" in character escape sequence", JsonToken.VALUE_STRING);
        }
        char[] cArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        char c = cArr[i];
        switch (c) {
            case '\"':
            case '/':
            case '\\':
                return c;
            case 'b':
                return '\b';
            case 'f':
                return '\f';
            case 'n':
                return '\n';
            case 'r':
                return '\r';
            case 't':
                return '\t';
            case 'u':
                int value = 0;
                for (int i2 = 0; i2 < 4; i2++) {
                    if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                        _reportInvalidEOF(" in character escape sequence", JsonToken.VALUE_STRING);
                    }
                    char[] cArr2 = this._inputBuffer;
                    int i3 = this._inputPtr;
                    this._inputPtr = i3 + 1;
                    char c2 = cArr2[i3];
                    int digit = CharTypes.charToHex(c2);
                    if (digit < 0) {
                        _reportUnexpectedChar(c2, "expected a hex-digit for character escape sequence");
                    }
                    value = (value << 4) | digit;
                }
                return (char) value;
            default:
                return _handleUnrecognizedCharacterEscape(c);
        }
    }

    private final void _matchTrue() throws IOException {
        int ptr;
        char c;
        int ptr2 = this._inputPtr;
        if (ptr2 + 3 < this._inputEnd) {
            char[] b = this._inputBuffer;
            if (b[ptr2] == 'r') {
                int ptr3 = ptr2 + 1;
                if (b[ptr3] == 'u') {
                    int ptr4 = ptr3 + 1;
                    if (b[ptr4] == 'e' && ((c = b[(ptr = ptr4 + 1)]) < '0' || c == ']' || c == '}')) {
                        this._inputPtr = ptr;
                        return;
                    }
                }
            }
        }
        _matchToken("true", 1);
    }

    private final void _matchFalse() throws IOException {
        int ptr;
        char c;
        int ptr2 = this._inputPtr;
        if (ptr2 + 4 < this._inputEnd) {
            char[] b = this._inputBuffer;
            if (b[ptr2] == 'a') {
                int ptr3 = ptr2 + 1;
                if (b[ptr3] == 'l') {
                    int ptr4 = ptr3 + 1;
                    if (b[ptr4] == 's') {
                        int ptr5 = ptr4 + 1;
                        if (b[ptr5] == 'e' && ((c = b[(ptr = ptr5 + 1)]) < '0' || c == ']' || c == '}')) {
                            this._inputPtr = ptr;
                            return;
                        }
                    }
                }
            }
        }
        _matchToken("false", 1);
    }

    private final void _matchNull() throws IOException {
        int ptr;
        char c;
        int ptr2 = this._inputPtr;
        if (ptr2 + 3 < this._inputEnd) {
            char[] b = this._inputBuffer;
            if (b[ptr2] == 'u') {
                int ptr3 = ptr2 + 1;
                if (b[ptr3] == 'l') {
                    int ptr4 = ptr3 + 1;
                    if (b[ptr4] == 'l' && ((c = b[(ptr = ptr4 + 1)]) < '0' || c == ']' || c == '}')) {
                        this._inputPtr = ptr;
                        return;
                    }
                }
            }
        }
        _matchToken("null", 1);
    }

    protected final void _matchToken(String matchStr, int i) throws IOException {
        char c;
        int len = matchStr.length();
        do {
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            if (this._inputBuffer[this._inputPtr] != matchStr.charAt(i)) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < len);
        if ((this._inputPtr < this._inputEnd || _loadMore()) && (c = this._inputBuffer[this._inputPtr]) >= '0' && c != ']' && c != '}' && Character.isJavaIdentifierPart(c)) {
            _reportInvalidToken(matchStr.substring(0, i));
        }
    }

    protected byte[] _decodeBase64(Base64Variant b64variant) throws IOException {
        ByteArrayBuilder builder = _getByteArrayBuilder();
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                _loadMoreGuaranteed();
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char ch = cArr[i];
            if (ch > ' ') {
                int bits = b64variant.decodeBase64Char(ch);
                if (bits < 0) {
                    if (ch == '\"') {
                        return builder.toByteArray();
                    }
                    bits = _decodeBase64Escape(b64variant, ch, 0);
                    if (bits < 0) {
                        continue;
                    }
                }
                int decodedData = bits;
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                char[] cArr2 = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                char ch2 = cArr2[i2];
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                char[] cArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                char ch3 = cArr3[i3];
                int bits3 = b64variant.decodeBase64Char(ch3);
                if (bits3 < 0) {
                    if (bits3 != -2) {
                        if (ch3 == '\"' && !b64variant.usesPadding()) {
                            builder.append(decodedData2 >> 4);
                            return builder.toByteArray();
                        }
                        bits3 = _decodeBase64Escape(b64variant, ch3, 2);
                    }
                    if (bits3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            _loadMoreGuaranteed();
                        }
                        char[] cArr4 = this._inputBuffer;
                        int i4 = this._inputPtr;
                        this._inputPtr = i4 + 1;
                        char ch4 = cArr4[i4];
                        if (!b64variant.usesPaddingChar(ch4)) {
                            throw reportInvalidBase64Char(b64variant, ch4, 3, "expected padding character '" + b64variant.getPaddingChar() + "'");
                        }
                        builder.append(decodedData2 >> 4);
                    }
                }
                int decodedData3 = (decodedData2 << 6) | bits3;
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                char[] cArr5 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                char ch5 = cArr5[i5];
                int bits4 = b64variant.decodeBase64Char(ch5);
                if (bits4 < 0) {
                    if (bits4 != -2) {
                        if (ch5 == '\"' && !b64variant.usesPadding()) {
                            builder.appendTwoBytes(decodedData3 >> 2);
                            return builder.toByteArray();
                        }
                        bits4 = _decodeBase64Escape(b64variant, ch5, 3);
                    }
                    if (bits4 == -2) {
                        builder.appendTwoBytes(decodedData3 >> 2);
                    }
                }
                builder.appendThreeBytes((decodedData3 << 6) | bits4);
            }
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getTokenLocation() {
        Object src = this._ioContext.getSourceReference();
        if (this._currToken == JsonToken.FIELD_NAME) {
            long total = this._currInputProcessed + (this._nameStartOffset - 1);
            return new JsonLocation(src, -1L, total, this._nameStartRow, this._nameStartCol);
        }
        return new JsonLocation(src, -1L, this._tokenInputTotal - 1, this._tokenInputRow, this._tokenInputCol);
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        int col = (this._inputPtr - this._currInputRowStart) + 1;
        return new JsonLocation(this._ioContext.getSourceReference(), -1L, this._currInputProcessed + this._inputPtr, this._currInputRow, col);
    }

    private final void _updateLocation() {
        int ptr = this._inputPtr;
        this._tokenInputTotal = this._currInputProcessed + ptr;
        this._tokenInputRow = this._currInputRow;
        this._tokenInputCol = ptr - this._currInputRowStart;
    }

    private final void _updateNameLocation() {
        int ptr = this._inputPtr;
        this._nameStartOffset = ptr;
        this._nameStartRow = this._currInputRow;
        this._nameStartCol = ptr - this._currInputRowStart;
    }

    protected void _reportInvalidToken(String matchedPart) throws IOException {
        _reportInvalidToken(matchedPart, "'null', 'true', 'false' or NaN");
    }

    protected void _reportInvalidToken(String matchedPart, String msg) throws IOException {
        StringBuilder sb = new StringBuilder(matchedPart);
        while (sb.length() < 256 && (this._inputPtr < this._inputEnd || _loadMore())) {
            char c = this._inputBuffer[this._inputPtr];
            if (!Character.isJavaIdentifierPart(c)) {
                break;
            }
            this._inputPtr++;
            sb.append(c);
        }
        if (sb.length() == 256) {
            sb.append("...");
        }
        _reportError("Unrecognized token '" + sb.toString() + "': was expecting " + msg);
    }
}
