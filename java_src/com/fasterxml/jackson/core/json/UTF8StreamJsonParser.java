package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.base.ParserBase;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.sym.ByteQuadsCanonicalizer;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.google.android.exoplayer2.extractor.ts.PsExtractor;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.util.Arrays;
/* loaded from: classes.dex */
public class UTF8StreamJsonParser extends ParserBase {
    static final byte BYTE_LF = 10;
    protected boolean _bufferRecyclable;
    protected byte[] _inputBuffer;
    protected InputStream _inputStream;
    protected int _nameStartCol;
    protected int _nameStartOffset;
    protected int _nameStartRow;
    protected ObjectCodec _objectCodec;
    private int _quad1;
    protected int[] _quadBuffer;
    protected final ByteQuadsCanonicalizer _symbols;
    protected boolean _tokenIncomplete;
    private static final int[] _icUTF8 = CharTypes.getInputCodeUtf8();
    protected static final int[] _icLatin1 = CharTypes.getInputCodeLatin1();

    public UTF8StreamJsonParser(IOContext ctxt, int features, InputStream in, ObjectCodec codec, ByteQuadsCanonicalizer sym, byte[] inputBuffer, int start, int end, boolean bufferRecyclable) {
        super(ctxt, features);
        this._quadBuffer = new int[16];
        this._inputStream = in;
        this._objectCodec = codec;
        this._symbols = sym;
        this._inputBuffer = inputBuffer;
        this._inputPtr = start;
        this._inputEnd = end;
        this._currInputRowStart = start;
        this._currInputProcessed = -start;
        this._bufferRecyclable = bufferRecyclable;
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
    public int releaseBuffered(OutputStream out) throws IOException {
        int count = this._inputEnd - this._inputPtr;
        if (count < 1) {
            return 0;
        }
        int origPtr = this._inputPtr;
        out.write(this._inputBuffer, origPtr, count);
        return count;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getInputSource() {
        return this._inputStream;
    }

    protected final boolean _loadMore() throws IOException {
        int space;
        int bufSize = this._inputEnd;
        this._currInputProcessed += this._inputEnd;
        this._currInputRowStart -= this._inputEnd;
        this._nameStartOffset -= bufSize;
        if (this._inputStream == null || (space = this._inputBuffer.length) == 0) {
            return false;
        }
        int count = this._inputStream.read(this._inputBuffer, 0, space);
        if (count > 0) {
            this._inputPtr = 0;
            this._inputEnd = count;
            return true;
        }
        _closeInput();
        if (count != 0) {
            return false;
        }
        throw new IOException("InputStream.read() returned 0 characters when trying to read " + this._inputBuffer.length + " bytes");
    }

    protected final boolean _loadToHaveAtLeast(int minAvailable) throws IOException {
        if (this._inputStream == null) {
            return false;
        }
        int amount = this._inputEnd - this._inputPtr;
        if (amount > 0 && this._inputPtr > 0) {
            int ptr = this._inputPtr;
            this._currInputProcessed += ptr;
            this._currInputRowStart -= ptr;
            this._nameStartOffset -= ptr;
            System.arraycopy(this._inputBuffer, ptr, this._inputBuffer, 0, amount);
            this._inputEnd = amount;
        } else {
            this._inputEnd = 0;
        }
        this._inputPtr = 0;
        while (this._inputEnd < minAvailable) {
            int count = this._inputStream.read(this._inputBuffer, this._inputEnd, this._inputBuffer.length - this._inputEnd);
            if (count < 1) {
                _closeInput();
                if (count != 0) {
                    return false;
                }
                throw new IOException("InputStream.read() returned 0 characters when trying to read " + amount + " bytes");
            }
            this._inputEnd += count;
        }
        return true;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _closeInput() throws IOException {
        if (this._inputStream != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonParser.Feature.AUTO_CLOSE_SOURCE)) {
                this._inputStream.close();
            }
            this._inputStream = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.fasterxml.jackson.core.base.ParserBase
    public void _releaseBuffers() throws IOException {
        byte[] buf;
        super._releaseBuffers();
        this._symbols.release();
        if (this._bufferRecyclable && (buf = this._inputBuffer) != null) {
            this._inputBuffer = ByteArrayBuilder.NO_BYTES;
            this._ioContext.releaseReadIOBuffer(buf);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getText() throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                return _finishAndReturnString();
            }
            return this._textBuffer.contentsAsString();
        }
        return _getText2(this._currToken);
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
    public String getValueAsString() throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                return _finishAndReturnString();
            }
            return this._textBuffer.contentsAsString();
        } else if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        } else {
            return super.getValueAsString(null);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getValueAsString(String defValue) throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                return _finishAndReturnString();
            }
            return this._textBuffer.contentsAsString();
        } else if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        } else {
            return super.getValueAsString(defValue);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt() throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
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
        return super.getValueAsInt(0);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt(int defValue) throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
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
        return super.getValueAsInt(defValue);
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
    public char[] getTextCharacters() throws IOException {
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
    public int getTextLength() throws IOException {
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
    public int getTextOffset() throws IOException {
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

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0028, code lost:
        r10._tokenIncomplete = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x002b, code lost:
        if (r5 <= 0) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x002d, code lost:
        r3 = r3 + r5;
        r12.write(r13, 0, r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0032, code lost:
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
            Method dump skipped, instructions count: 344
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._readBinary(com.fasterxml.jackson.core.Base64Variant, java.io.OutputStream, byte[]):int");
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException {
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
                if (i != 44) {
                    _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
                }
                i = _skipWS();
            }
            if (!this._parsingContext.inObject()) {
                _updateLocation();
                return _nextTokenNotInObject(i);
            }
            _updateNameLocation();
            String n = _parseName(i);
            this._parsingContext.setCurrentName(n);
            this._currToken = JsonToken.FIELD_NAME;
            int i2 = _skipColon();
            _updateLocation();
            if (i2 == 34) {
                this._tokenIncomplete = true;
                this._nextToken = JsonToken.VALUE_STRING;
                return this._currToken;
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
                    _matchToken("false", 1);
                    t = JsonToken.VALUE_FALSE;
                    break;
                case 110:
                    _matchToken("null", 1);
                    t = JsonToken.VALUE_NULL;
                    break;
                case 116:
                    _matchToken("true", 1);
                    t = JsonToken.VALUE_TRUE;
                    break;
                case 123:
                    t = JsonToken.START_OBJECT;
                    break;
                default:
                    t = _handleUnexpectedValue(i2);
                    break;
            }
            this._nextToken = t;
            return this._currToken;
        }
    }

    private final JsonToken _nextTokenNotInObject(int i) throws IOException {
        if (i == 34) {
            this._tokenIncomplete = true;
            JsonToken jsonToken = JsonToken.VALUE_STRING;
            this._currToken = jsonToken;
            return jsonToken;
        }
        switch (i) {
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
                JsonToken jsonToken2 = JsonToken.START_ARRAY;
                this._currToken = jsonToken2;
                return jsonToken2;
            case 102:
                _matchToken("false", 1);
                JsonToken jsonToken3 = JsonToken.VALUE_FALSE;
                this._currToken = jsonToken3;
                return jsonToken3;
            case 110:
                _matchToken("null", 1);
                JsonToken jsonToken4 = JsonToken.VALUE_NULL;
                this._currToken = jsonToken4;
                return jsonToken4;
            case 116:
                _matchToken("true", 1);
                JsonToken jsonToken5 = JsonToken.VALUE_TRUE;
                this._currToken = jsonToken5;
                return jsonToken5;
            case 123:
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken6 = JsonToken.START_OBJECT;
                this._currToken = jsonToken6;
                return jsonToken6;
            default:
                JsonToken _handleUnexpectedValue = _handleUnexpectedValue(i);
                this._currToken = _handleUnexpectedValue;
                return _handleUnexpectedValue;
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
    public boolean nextFieldName(SerializableString str) throws IOException {
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
                if (i != 44) {
                    _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
                }
                i = _skipWS();
            }
            if (!this._parsingContext.inObject()) {
                _updateLocation();
                _nextTokenNotInObject(i);
                return false;
            }
            _updateNameLocation();
            if (i == 34) {
                byte[] nameBytes = str.asQuotedUTF8();
                int len = nameBytes.length;
                if (this._inputPtr + len + 4 < this._inputEnd) {
                    int end = this._inputPtr + len;
                    if (this._inputBuffer[end] == 34) {
                        int offset = 0;
                        int ptr = this._inputPtr;
                        while (ptr != end) {
                            if (nameBytes[offset] == this._inputBuffer[ptr]) {
                                offset++;
                                ptr++;
                            }
                        }
                        this._parsingContext.setCurrentName(str.getValue());
                        _isNextTokenNameYes(_skipColonFast(ptr + 1));
                        return true;
                    }
                }
            }
            return _isNextTokenNameMaybe(i, str);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String nextFieldName() throws IOException {
        JsonToken t;
        String nameStr = null;
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
                        if (i != 44) {
                            _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
                        }
                        i = _skipWS();
                    }
                    if (!this._parsingContext.inObject()) {
                        _updateLocation();
                        _nextTokenNotInObject(i);
                    } else {
                        _updateNameLocation();
                        nameStr = _parseName(i);
                        this._parsingContext.setCurrentName(nameStr);
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
                                    _matchToken("false", 1);
                                    t = JsonToken.VALUE_FALSE;
                                    break;
                                case 110:
                                    _matchToken("null", 1);
                                    t = JsonToken.VALUE_NULL;
                                    break;
                                case 116:
                                    _matchToken("true", 1);
                                    t = JsonToken.VALUE_TRUE;
                                    break;
                                case 123:
                                    t = JsonToken.START_OBJECT;
                                    break;
                                default:
                                    t = _handleUnexpectedValue(i2);
                                    break;
                            }
                            this._nextToken = t;
                        }
                    }
                }
            }
        }
        return nameStr;
    }

    private final int _skipColonFast(int ptr) throws IOException {
        int ptr2 = ptr + 1;
        int i = this._inputBuffer[ptr];
        if (i == 58) {
            int ptr3 = ptr2 + 1;
            int i2 = this._inputBuffer[ptr2];
            if (i2 > 32) {
                if (i2 != 47 && i2 != 35) {
                    this._inputPtr = ptr3;
                    return i2;
                }
            } else if (i2 == 32 || i2 == 9) {
                int ptr4 = ptr3 + 1;
                int i3 = this._inputBuffer[ptr3];
                if (i3 > 32 && i3 != 47 && i3 != 35) {
                    this._inputPtr = ptr4;
                    return i3;
                }
                ptr3 = ptr4;
            }
            this._inputPtr = ptr3 - 1;
            return _skipColon2(true);
        }
        if (i == 32 || i == 9) {
            i = this._inputBuffer[ptr2];
            ptr2++;
        }
        if (i == 58) {
            int ptr5 = ptr2 + 1;
            int i4 = this._inputBuffer[ptr2];
            if (i4 > 32) {
                if (i4 != 47 && i4 != 35) {
                    this._inputPtr = ptr5;
                    return i4;
                }
            } else if (i4 == 32 || i4 == 9) {
                int ptr6 = ptr5 + 1;
                int i5 = this._inputBuffer[ptr5];
                if (i5 > 32 && i5 != 47 && i5 != 35) {
                    this._inputPtr = ptr6;
                    return i5;
                }
                ptr5 = ptr6;
            }
            this._inputPtr = ptr5 - 1;
            return _skipColon2(true);
        }
        this._inputPtr = ptr2 - 1;
        return _skipColon2(false);
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
                this._nextToken = _handleUnexpectedValue(i);
                return;
        }
    }

    private final boolean _isNextTokenNameMaybe(int i, SerializableString str) throws IOException {
        JsonToken t;
        String n = _parseName(i);
        this._parsingContext.setCurrentName(n);
        boolean match = n.equals(str.getValue());
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
                    _matchToken("false", 1);
                    t = JsonToken.VALUE_FALSE;
                    break;
                case 110:
                    _matchToken("null", 1);
                    t = JsonToken.VALUE_NULL;
                    break;
                case 116:
                    _matchToken("true", 1);
                    t = JsonToken.VALUE_TRUE;
                    break;
                case 123:
                    t = JsonToken.START_OBJECT;
                    break;
                default:
                    t = _handleUnexpectedValue(i2);
                    break;
            }
            this._nextToken = t;
        }
        return match;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String nextTextValue() throws IOException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken t = this._nextToken;
            this._nextToken = null;
            this._currToken = t;
            if (t == JsonToken.VALUE_STRING) {
                if (this._tokenIncomplete) {
                    this._tokenIncomplete = false;
                    return _finishAndReturnString();
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
    public int nextIntValue(int defaultValue) throws IOException {
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
    public long nextLongValue(long defaultValue) throws IOException {
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
    public Boolean nextBooleanValue() throws IOException {
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
        if (t2 == JsonToken.VALUE_TRUE) {
            return Boolean.TRUE;
        }
        if (t2 != JsonToken.VALUE_FALSE) {
            return null;
        }
        return Boolean.FALSE;
    }

    protected JsonToken _parsePosNumber(int c) throws IOException {
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        if (c == 48) {
            c = _verifyNoLeadingZeroes();
        }
        outBuf[0] = (char) c;
        int intLen = 1;
        int outPtr = 1;
        int end = (this._inputPtr + outBuf.length) - 1;
        if (end > this._inputEnd) {
            end = this._inputEnd;
        }
        while (this._inputPtr < end) {
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int c2 = bArr[i] & 255;
            if (c2 >= 48 && c2 <= 57) {
                intLen++;
                outBuf[outPtr] = (char) c2;
                outPtr++;
            } else if (c2 == 46 || c2 == 101 || c2 == 69) {
                return _parseFloat(outBuf, outPtr, c2, false, intLen);
            } else {
                this._inputPtr--;
                this._textBuffer.setCurrentLength(outPtr);
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(c2);
                }
                return resetInt(false, intLen);
            }
        }
        return _parseNumber2(outBuf, outPtr, false, intLen);
    }

    protected JsonToken _parseNegNumber() throws IOException {
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int outPtr = 0 + 1;
        outBuf[0] = '-';
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i] & 255;
        if (c < 48 || c > 57) {
            return _handleInvalidNumberStart(c, true);
        }
        if (c == 48) {
            c = _verifyNoLeadingZeroes();
        }
        int outPtr2 = outPtr + 1;
        outBuf[outPtr] = (char) c;
        int intLen = 1;
        int end = (this._inputPtr + outBuf.length) - 2;
        if (end > this._inputEnd) {
            end = this._inputEnd;
        }
        while (this._inputPtr < end) {
            byte[] bArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            int c2 = bArr2[i2] & 255;
            if (c2 >= 48 && c2 <= 57) {
                intLen++;
                outBuf[outPtr2] = (char) c2;
                outPtr2++;
            } else if (c2 == 46 || c2 == 101 || c2 == 69) {
                return _parseFloat(outBuf, outPtr2, c2, true, intLen);
            } else {
                this._inputPtr--;
                this._textBuffer.setCurrentLength(outPtr2);
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(c2);
                }
                return resetInt(true, intLen);
            }
        }
        return _parseNumber2(outBuf, outPtr2, true, intLen);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x002c, code lost:
        if (r3 == 46) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0030, code lost:
        if (r3 == 101) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0034, code lost:
        if (r3 != 69) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0053, code lost:
        r7._inputPtr--;
        r7._textBuffer.setCurrentLength(r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0064, code lost:
        if (r7._parsingContext.inRoot() == false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0066, code lost:
        r0 = r7._inputBuffer;
        r1 = r7._inputPtr;
        r7._inputPtr = r1 + 1;
        _verifyRootSpace(r0[r1] & 255);
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:?, code lost:
        return _parseFloat(r8, r9, r3, r10, r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:?, code lost:
        return resetInt(r10, r11);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final com.fasterxml.jackson.core.JsonToken _parseNumber2(char[] r8, int r9, boolean r10, int r11) throws java.io.IOException {
        /*
            r7 = this;
        L0:
            int r0 = r7._inputPtr
            int r1 = r7._inputEnd
            if (r0 < r1) goto L16
            boolean r0 = r7._loadMore()
            if (r0 != 0) goto L16
            com.fasterxml.jackson.core.util.TextBuffer r0 = r7._textBuffer
            r0.setCurrentLength(r9)
            com.fasterxml.jackson.core.JsonToken r0 = r7.resetInt(r10, r11)
        L15:
            return r0
        L16:
            byte[] r0 = r7._inputBuffer
            int r1 = r7._inputPtr
            int r2 = r1 + 1
            r7._inputPtr = r2
            r0 = r0[r1]
            r3 = r0 & 255(0xff, float:3.57E-43)
            r0 = 57
            if (r3 > r0) goto L2a
            r0 = 48
            if (r3 >= r0) goto L40
        L2a:
            r0 = 46
            if (r3 == r0) goto L36
            r0 = 101(0x65, float:1.42E-43)
            if (r3 == r0) goto L36
            r0 = 69
            if (r3 != r0) goto L53
        L36:
            r0 = r7
            r1 = r8
            r2 = r9
            r4 = r10
            r5 = r11
            com.fasterxml.jackson.core.JsonToken r0 = r0._parseFloat(r1, r2, r3, r4, r5)
            goto L15
        L40:
            int r0 = r8.length
            if (r9 < r0) goto L4a
            com.fasterxml.jackson.core.util.TextBuffer r0 = r7._textBuffer
            char[] r8 = r0.finishCurrentSegment()
            r9 = 0
        L4a:
            int r6 = r9 + 1
            char r0 = (char) r3
            r8[r9] = r0
            int r11 = r11 + 1
            r9 = r6
            goto L0
        L53:
            int r0 = r7._inputPtr
            int r0 = r0 + (-1)
            r7._inputPtr = r0
            com.fasterxml.jackson.core.util.TextBuffer r0 = r7._textBuffer
            r0.setCurrentLength(r9)
            com.fasterxml.jackson.core.json.JsonReadContext r0 = r7._parsingContext
            boolean r0 = r0.inRoot()
            if (r0 == 0) goto L75
            byte[] r0 = r7._inputBuffer
            int r1 = r7._inputPtr
            int r2 = r1 + 1
            r7._inputPtr = r2
            r0 = r0[r1]
            r0 = r0 & 255(0xff, float:3.57E-43)
            r7._verifyRootSpace(r0)
        L75:
            com.fasterxml.jackson.core.JsonToken r0 = r7.resetInt(r10, r11)
            goto L15
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._parseNumber2(char[], int, boolean, int):com.fasterxml.jackson.core.JsonToken");
    }

    private final int _verifyNoLeadingZeroes() throws IOException {
        if (this._inputPtr < this._inputEnd || _loadMore()) {
            int ch = this._inputBuffer[this._inputPtr] & 255;
            if (ch < 48 || ch > 57) {
                return 48;
            }
            if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS)) {
                reportInvalidNumber("Leading zeroes not allowed");
            }
            this._inputPtr++;
            if (ch == 48) {
                do {
                    if (this._inputPtr < this._inputEnd || _loadMore()) {
                        ch = this._inputBuffer[this._inputPtr] & 255;
                        if (ch < 48 || ch > 57) {
                            return 48;
                        }
                        this._inputPtr++;
                    } else {
                        return ch;
                    }
                } while (ch == 48);
                return ch;
            }
            return ch;
        }
        return 48;
    }

    private final JsonToken _parseFloat(char[] outBuf, int outPtr, int c, boolean negative, int integerPartLength) throws IOException {
        int outPtr2;
        int fractLen = 0;
        boolean eof = false;
        if (c == 46) {
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int outPtr3 = outPtr + 1;
            outBuf[outPtr] = (char) c;
            while (true) {
                outPtr = outPtr3;
                if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                    eof = true;
                    break;
                }
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                c = bArr[i] & 255;
                if (c < 48 || c > 57) {
                    break;
                }
                fractLen++;
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                outPtr3 = outPtr + 1;
                outBuf[outPtr] = (char) c;
            }
            if (fractLen == 0) {
                reportUnexpectedNumberChar(c, "Decimal point not followed by a digit");
            }
        }
        int expLen = 0;
        if (c == 101 || c == 69) {
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int outPtr4 = outPtr + 1;
            outBuf[outPtr] = (char) c;
            if (this._inputPtr >= this._inputEnd) {
                _loadMoreGuaranteed();
            }
            byte[] bArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            c = bArr2[i2] & 255;
            if (c == 45 || c == 43) {
                if (outPtr4 >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr2 = 0;
                } else {
                    outPtr2 = outPtr4;
                }
                int outPtr5 = outPtr2 + 1;
                outBuf[outPtr2] = (char) c;
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                c = bArr3[i3] & 255;
                outPtr = outPtr5;
            } else {
                outPtr = outPtr4;
            }
            while (true) {
                if (c > 57 || c < 48) {
                    break;
                }
                expLen++;
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                int outPtr6 = outPtr + 1;
                outBuf[outPtr] = (char) c;
                if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                    eof = true;
                    outPtr = outPtr6;
                    break;
                }
                byte[] bArr4 = this._inputBuffer;
                int i4 = this._inputPtr;
                this._inputPtr = i4 + 1;
                c = bArr4[i4] & 255;
                outPtr = outPtr6;
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
        this._textBuffer.setCurrentLength(outPtr);
        return resetFloat(negative, integerPartLength, fractLen, expLen);
    }

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

    protected final String _parseName(int i) throws IOException {
        if (i != 34) {
            return _handleOddName(i);
        }
        if (this._inputPtr + 13 > this._inputEnd) {
            return slowParseName();
        }
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int q = input[i2] & 255;
        if (codes[q] == 0) {
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = input[i3] & 255;
            if (codes[i4] == 0) {
                int q2 = (q << 8) | i4;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                int i6 = input[i5] & 255;
                if (codes[i6] == 0) {
                    int q3 = (q2 << 8) | i6;
                    int i7 = this._inputPtr;
                    this._inputPtr = i7 + 1;
                    int i8 = input[i7] & 255;
                    if (codes[i8] == 0) {
                        int q4 = (q3 << 8) | i8;
                        int i9 = this._inputPtr;
                        this._inputPtr = i9 + 1;
                        int i10 = input[i9] & 255;
                        if (codes[i10] == 0) {
                            this._quad1 = q4;
                            return parseMediumName(i10);
                        } else if (i10 == 34) {
                            return findName(q4, 4);
                        } else {
                            return parseName(q4, i10, 4);
                        }
                    } else if (i8 == 34) {
                        return findName(q3, 3);
                    } else {
                        return parseName(q3, i8, 3);
                    }
                } else if (i6 == 34) {
                    return findName(q2, 2);
                } else {
                    return parseName(q2, i6, 2);
                }
            } else if (i4 == 34) {
                return findName(q, 1);
            } else {
                return parseName(q, i4, 1);
            }
        } else if (q == 34) {
            return "";
        } else {
            return parseName(0, q, 0);
        }
    }

    protected final String parseMediumName(int q2) throws IOException {
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = input[i] & 255;
        if (codes[i2] != 0) {
            if (i2 == 34) {
                return findName(this._quad1, q2, 1);
            }
            return parseName(this._quad1, q2, i2, 1);
        }
        int q22 = (q2 << 8) | i2;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int i4 = input[i3] & 255;
        if (codes[i4] != 0) {
            if (i4 == 34) {
                return findName(this._quad1, q22, 2);
            }
            return parseName(this._quad1, q22, i4, 2);
        }
        int q23 = (q22 << 8) | i4;
        int i5 = this._inputPtr;
        this._inputPtr = i5 + 1;
        int i6 = input[i5] & 255;
        if (codes[i6] != 0) {
            if (i6 == 34) {
                return findName(this._quad1, q23, 3);
            }
            return parseName(this._quad1, q23, i6, 3);
        }
        int q24 = (q23 << 8) | i6;
        int i7 = this._inputPtr;
        this._inputPtr = i7 + 1;
        int i8 = input[i7] & 255;
        if (codes[i8] != 0) {
            if (i8 == 34) {
                return findName(this._quad1, q24, 4);
            }
            return parseName(this._quad1, q24, i8, 4);
        }
        return parseMediumName2(i8, q24);
    }

    protected final String parseMediumName2(int q3, int q2) throws IOException {
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = input[i] & 255;
        if (codes[i2] != 0) {
            if (i2 == 34) {
                return findName(this._quad1, q2, q3, 1);
            }
            return parseName(this._quad1, q2, q3, i2, 1);
        }
        int q32 = (q3 << 8) | i2;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int i4 = input[i3] & 255;
        if (codes[i4] != 0) {
            if (i4 == 34) {
                return findName(this._quad1, q2, q32, 2);
            }
            return parseName(this._quad1, q2, q32, i4, 2);
        }
        int q33 = (q32 << 8) | i4;
        int i5 = this._inputPtr;
        this._inputPtr = i5 + 1;
        int i6 = input[i5] & 255;
        if (codes[i6] != 0) {
            if (i6 == 34) {
                return findName(this._quad1, q2, q33, 3);
            }
            return parseName(this._quad1, q2, q33, i6, 3);
        }
        int q34 = (q33 << 8) | i6;
        int i7 = this._inputPtr;
        this._inputPtr = i7 + 1;
        int i8 = input[i7] & 255;
        if (codes[i8] != 0) {
            if (i8 == 34) {
                return findName(this._quad1, q2, q34, 4);
            }
            return parseName(this._quad1, q2, q34, i8, 4);
        }
        return parseLongName(i8, q2, q34);
    }

    protected final String parseLongName(int q, int q2, int q3) throws IOException {
        this._quadBuffer[0] = this._quad1;
        this._quadBuffer[1] = q2;
        this._quadBuffer[2] = q3;
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int qlen = 3;
        while (this._inputPtr + 4 <= this._inputEnd) {
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = input[i] & 255;
            if (codes[i2] != 0) {
                if (i2 == 34) {
                    return findName(this._quadBuffer, qlen, q, 1);
                }
                return parseEscapedName(this._quadBuffer, qlen, q, i2, 1);
            }
            int q4 = (q << 8) | i2;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = input[i3] & 255;
            if (codes[i4] != 0) {
                if (i4 == 34) {
                    return findName(this._quadBuffer, qlen, q4, 2);
                }
                return parseEscapedName(this._quadBuffer, qlen, q4, i4, 2);
            }
            int q5 = (q4 << 8) | i4;
            int i5 = this._inputPtr;
            this._inputPtr = i5 + 1;
            int i6 = input[i5] & 255;
            if (codes[i6] != 0) {
                if (i6 == 34) {
                    return findName(this._quadBuffer, qlen, q5, 3);
                }
                return parseEscapedName(this._quadBuffer, qlen, q5, i6, 3);
            }
            int q6 = (q5 << 8) | i6;
            int i7 = this._inputPtr;
            this._inputPtr = i7 + 1;
            int i8 = input[i7] & 255;
            if (codes[i8] != 0) {
                if (i8 == 34) {
                    return findName(this._quadBuffer, qlen, q6, 4);
                }
                return parseEscapedName(this._quadBuffer, qlen, q6, i8, 4);
            }
            if (qlen >= this._quadBuffer.length) {
                this._quadBuffer = growArrayBy(this._quadBuffer, qlen);
            }
            this._quadBuffer[qlen] = q6;
            q = i8;
            qlen++;
        }
        return parseEscapedName(this._quadBuffer, qlen, 0, q, 0);
    }

    protected String slowParseName() throws IOException {
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(": was expecting closing '\"' for name", JsonToken.FIELD_NAME);
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = bArr[i] & 255;
        return i2 == 34 ? "" : parseEscapedName(this._quadBuffer, 0, 0, i2, 0);
    }

    private final String parseName(int q1, int ch, int lastQuadBytes) throws IOException {
        return parseEscapedName(this._quadBuffer, 0, q1, ch, lastQuadBytes);
    }

    private final String parseName(int q1, int q2, int ch, int lastQuadBytes) throws IOException {
        this._quadBuffer[0] = q1;
        return parseEscapedName(this._quadBuffer, 1, q2, ch, lastQuadBytes);
    }

    private final String parseName(int q1, int q2, int q3, int ch, int lastQuadBytes) throws IOException {
        this._quadBuffer[0] = q1;
        this._quadBuffer[1] = q2;
        return parseEscapedName(this._quadBuffer, 2, q3, ch, lastQuadBytes);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00ba  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected final java.lang.String parseEscapedName(int[] r8, int r9, int r10, int r11, int r12) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 210
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser.parseEscapedName(int[], int, int, int, int):java.lang.String");
    }

    protected String _handleOddName(int ch) throws IOException {
        if (ch == 39 && isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
            return _parseAposName();
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES)) {
            char c = (char) _decodeCharForError(ch);
            _reportUnexpectedChar(c, "was expecting double-quote to start field name");
        }
        int[] codes = CharTypes.getInputCodeUtf8JsNames();
        if (codes[ch] != 0) {
            _reportUnexpectedChar(ch, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
        }
        int[] quads = this._quadBuffer;
        int qlen = 0;
        int currQuad = 0;
        int currQuadBytes = 0;
        while (true) {
            int qlen2 = qlen;
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
                qlen = qlen2;
            } else {
                if (qlen2 >= quads.length) {
                    quads = growArrayBy(quads, quads.length);
                    this._quadBuffer = quads;
                }
                qlen = qlen2 + 1;
                quads[qlen2] = currQuad;
                currQuad = ch;
                currQuadBytes = 1;
            }
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOF(" in field name", JsonToken.FIELD_NAME);
            }
            ch = this._inputBuffer[this._inputPtr] & 255;
            if (codes[ch] != 0) {
                break;
            }
            this._inputPtr++;
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                quads = growArrayBy(quads, quads.length);
                this._quadBuffer = quads;
            }
            quads[qlen] = currQuad;
            qlen++;
        }
        String name = this._symbols.findName(quads, qlen);
        if (name == null) {
            return addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    protected String _parseAposName() throws IOException {
        int qlen;
        int qlen2;
        int qlen3;
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(": was expecting closing ''' for field name", JsonToken.FIELD_NAME);
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int ch = bArr[i] & 255;
        if (ch == 39) {
            return "";
        }
        int[] quads = this._quadBuffer;
        int currQuad = 0;
        int currQuadBytes = 0;
        int[] codes = _icLatin1;
        int qlen4 = 0;
        while (ch != 39) {
            if (ch != 34 && codes[ch] != 0) {
                if (ch != 92) {
                    _throwUnquotedSpace(ch, "name");
                } else {
                    ch = _decodeEscaped();
                }
                if (ch > 127) {
                    if (currQuadBytes >= 4) {
                        if (qlen4 >= quads.length) {
                            quads = growArrayBy(quads, quads.length);
                            this._quadBuffer = quads;
                        }
                        quads[qlen4] = currQuad;
                        currQuad = 0;
                        currQuadBytes = 0;
                        qlen4++;
                    }
                    if (ch < 2048) {
                        currQuad = (currQuad << 8) | (ch >> 6) | 192;
                        currQuadBytes++;
                        qlen3 = qlen4;
                    } else {
                        int currQuad2 = (currQuad << 8) | (ch >> 12) | 224;
                        int currQuadBytes2 = currQuadBytes + 1;
                        if (currQuadBytes2 >= 4) {
                            if (qlen4 >= quads.length) {
                                quads = growArrayBy(quads, quads.length);
                                this._quadBuffer = quads;
                            }
                            qlen3 = qlen4 + 1;
                            quads[qlen4] = currQuad2;
                            currQuad2 = 0;
                            currQuadBytes2 = 0;
                        } else {
                            qlen3 = qlen4;
                        }
                        currQuad = (currQuad2 << 8) | ((ch >> 6) & 63) | 128;
                        currQuadBytes = currQuadBytes2 + 1;
                    }
                    ch = (ch & 63) | 128;
                    qlen4 = qlen3;
                }
            }
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
                qlen2 = qlen4;
            } else {
                if (qlen4 >= quads.length) {
                    quads = growArrayBy(quads, quads.length);
                    this._quadBuffer = quads;
                }
                qlen2 = qlen4 + 1;
                quads[qlen4] = currQuad;
                currQuad = ch;
                currQuadBytes = 1;
            }
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOF(" in field name", JsonToken.FIELD_NAME);
            }
            byte[] bArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            ch = bArr2[i2] & 255;
            qlen4 = qlen2;
        }
        if (currQuadBytes > 0) {
            if (qlen4 >= quads.length) {
                quads = growArrayBy(quads, quads.length);
                this._quadBuffer = quads;
            }
            qlen = qlen4 + 1;
            quads[qlen4] = pad(currQuad, currQuadBytes);
        } else {
            qlen = qlen4;
        }
        String name = this._symbols.findName(quads, qlen);
        if (name == null) {
            return addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    private final String findName(int q1, int lastQuadBytes) throws JsonParseException {
        int q12 = pad(q1, lastQuadBytes);
        String name = this._symbols.findName(q12);
        if (name == null) {
            this._quadBuffer[0] = q12;
            return addName(this._quadBuffer, 1, lastQuadBytes);
        }
        return name;
    }

    private final String findName(int q1, int q2, int lastQuadBytes) throws JsonParseException {
        int q22 = pad(q2, lastQuadBytes);
        String name = this._symbols.findName(q1, q22);
        if (name == null) {
            this._quadBuffer[0] = q1;
            this._quadBuffer[1] = q22;
            return addName(this._quadBuffer, 2, lastQuadBytes);
        }
        return name;
    }

    private final String findName(int q1, int q2, int q3, int lastQuadBytes) throws JsonParseException {
        int q32 = pad(q3, lastQuadBytes);
        String name = this._symbols.findName(q1, q2, q32);
        if (name == null) {
            int[] quads = this._quadBuffer;
            quads[0] = q1;
            quads[1] = q2;
            quads[2] = pad(q32, lastQuadBytes);
            return addName(quads, 3, lastQuadBytes);
        }
        return name;
    }

    private final String findName(int[] quads, int qlen, int lastQuad, int lastQuadBytes) throws JsonParseException {
        if (qlen >= quads.length) {
            quads = growArrayBy(quads, quads.length);
            this._quadBuffer = quads;
        }
        int qlen2 = qlen + 1;
        quads[qlen] = pad(lastQuad, lastQuadBytes);
        String name = this._symbols.findName(quads, qlen2);
        if (name == null) {
            return addName(quads, qlen2, lastQuadBytes);
        }
        return name;
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00d3 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.String addName(int[] r15, int r16, int r17) throws com.fasterxml.jackson.core.JsonParseException {
        /*
            Method dump skipped, instructions count: 276
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser.addName(int[], int, int):java.lang.String");
    }

    protected void _loadMoreGuaranteed() throws IOException {
        if (!_loadMore()) {
            _reportInvalidEOF();
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _finishString() throws IOException {
        int ptr = this._inputPtr;
        if (ptr >= this._inputEnd) {
            _loadMoreGuaranteed();
            ptr = this._inputPtr;
        }
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        int max = Math.min(this._inputEnd, outBuf.length + ptr);
        byte[] inputBuffer = this._inputBuffer;
        int outPtr = 0;
        while (true) {
            if (ptr >= max) {
                break;
            }
            int c = inputBuffer[ptr] & 255;
            if (codes[c] != 0) {
                if (c == 34) {
                    this._inputPtr = ptr + 1;
                    this._textBuffer.setCurrentLength(outPtr);
                    return;
                }
            } else {
                ptr++;
                outBuf[outPtr] = (char) c;
                outPtr++;
            }
        }
        this._inputPtr = ptr;
        _finishString2(outBuf, outPtr);
    }

    protected String _finishAndReturnString() throws IOException {
        int ptr = this._inputPtr;
        if (ptr >= this._inputEnd) {
            _loadMoreGuaranteed();
            ptr = this._inputPtr;
        }
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        int max = Math.min(this._inputEnd, outBuf.length + ptr);
        byte[] inputBuffer = this._inputBuffer;
        int outPtr = 0;
        while (true) {
            if (ptr >= max) {
                break;
            }
            int c = inputBuffer[ptr] & 255;
            if (codes[c] != 0) {
                if (c == 34) {
                    this._inputPtr = ptr + 1;
                    return this._textBuffer.setCurrentAndReturn(outPtr);
                }
            } else {
                ptr++;
                outBuf[outPtr] = (char) c;
                outPtr++;
            }
        }
        this._inputPtr = ptr;
        _finishString2(outBuf, outPtr);
        return this._textBuffer.contentsAsString();
    }

    private final void _finishString2(char[] outBuf, int outPtr) throws IOException {
        int outPtr2;
        int[] codes = _icUTF8;
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            int ptr = this._inputPtr;
            if (ptr >= this._inputEnd) {
                _loadMoreGuaranteed();
                ptr = this._inputPtr;
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int max = Math.min(this._inputEnd, (outBuf.length - outPtr) + ptr);
            int ptr2 = ptr;
            int outPtr3 = outPtr;
            while (true) {
                if (ptr2 < max) {
                    int ptr3 = ptr2 + 1;
                    int c = inputBuffer[ptr2] & 255;
                    if (codes[c] != 0) {
                        this._inputPtr = ptr3;
                        if (c != 34) {
                            switch (codes[c]) {
                                case 1:
                                    c = _decodeEscaped();
                                    outPtr2 = outPtr3;
                                    break;
                                case 2:
                                    c = _decodeUtf8_2(c);
                                    outPtr2 = outPtr3;
                                    break;
                                case 3:
                                    if (this._inputEnd - this._inputPtr >= 2) {
                                        c = _decodeUtf8_3fast(c);
                                        outPtr2 = outPtr3;
                                        break;
                                    } else {
                                        c = _decodeUtf8_3(c);
                                        outPtr2 = outPtr3;
                                        break;
                                    }
                                case 4:
                                    int c2 = _decodeUtf8_4(c);
                                    outPtr2 = outPtr3 + 1;
                                    outBuf[outPtr3] = (char) (55296 | (c2 >> 10));
                                    if (outPtr2 >= outBuf.length) {
                                        outBuf = this._textBuffer.finishCurrentSegment();
                                        outPtr2 = 0;
                                    }
                                    c = 56320 | (c2 & 1023);
                                    break;
                                default:
                                    if (c < 32) {
                                        _throwUnquotedSpace(c, "string value");
                                        outPtr2 = outPtr3;
                                        break;
                                    } else {
                                        _reportInvalidChar(c);
                                        outPtr2 = outPtr3;
                                        break;
                                    }
                            }
                            if (outPtr2 >= outBuf.length) {
                                outBuf = this._textBuffer.finishCurrentSegment();
                                outPtr2 = 0;
                            }
                            outBuf[outPtr2] = (char) c;
                            outPtr = outPtr2 + 1;
                        } else {
                            this._textBuffer.setCurrentLength(outPtr3);
                            return;
                        }
                    } else {
                        outBuf[outPtr3] = (char) c;
                        ptr2 = ptr3;
                        outPtr3++;
                    }
                } else {
                    this._inputPtr = ptr2;
                    outPtr = outPtr3;
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0028 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x004f -> B:6:0x0015). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void _skipString() throws java.io.IOException {
        /*
            r7 = this;
            r6 = 0
            r7._tokenIncomplete = r6
            int[] r1 = com.fasterxml.jackson.core.json.UTF8StreamJsonParser._icUTF8
            byte[] r2 = r7._inputBuffer
        L7:
            int r4 = r7._inputPtr
            int r3 = r7._inputEnd
            if (r4 < r3) goto L4f
            r7._loadMoreGuaranteed()
            int r4 = r7._inputPtr
            int r3 = r7._inputEnd
            r5 = r4
        L15:
            if (r5 >= r3) goto L28
            int r4 = r5 + 1
            r6 = r2[r5]
            r0 = r6 & 255(0xff, float:3.57E-43)
            r6 = r1[r0]
            if (r6 == 0) goto L4f
            r7._inputPtr = r4
            r6 = 34
            if (r0 != r6) goto L2b
            return
        L28:
            r7._inputPtr = r5
            goto L7
        L2b:
            r6 = r1[r0]
            switch(r6) {
                case 1: goto L3b;
                case 2: goto L3f;
                case 3: goto L43;
                case 4: goto L47;
                default: goto L30;
            }
        L30:
            r6 = 32
            if (r0 >= r6) goto L4b
            java.lang.String r6 = "string value"
            r7._throwUnquotedSpace(r0, r6)
            goto L7
        L3b:
            r7._decodeEscaped()
            goto L7
        L3f:
            r7._skipUtf8_2()
            goto L7
        L43:
            r7._skipUtf8_3()
            goto L7
        L47:
            r7._skipUtf8_4(r0)
            goto L7
        L4b:
            r7._reportInvalidChar(r0)
            goto L7
        L4f:
            r5 = r4
            goto L15
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._skipString():void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0033, code lost:
        if (r4._parsingContext.inArray() != false) goto L11;
     */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected com.fasterxml.jackson.core.JsonToken _handleUnexpectedValue(int r5) throws java.io.IOException {
        /*
            r4 = this;
            r1 = 1
            switch(r5) {
                case 39: goto L4c;
                case 43: goto L98;
                case 44: goto L35;
                case 73: goto L78;
                case 78: goto L59;
                case 93: goto L2d;
                case 125: goto L46;
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
            com.fasterxml.jackson.core.json.JsonReadContext r0 = r4._parsingContext
            boolean r0 = r0.inArray()
            if (r0 == 0) goto L4
        L35:
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_MISSING_VALUES
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L46
            int r0 = r4._inputPtr
            int r0 = r0 + (-1)
            r4._inputPtr = r0
            com.fasterxml.jackson.core.JsonToken r0 = com.fasterxml.jackson.core.JsonToken.VALUE_NULL
            goto L2c
        L46:
            java.lang.String r0 = "expected a value"
            r4._reportUnexpectedChar(r5, r0)
        L4c:
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_SINGLE_QUOTES
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L4
            com.fasterxml.jackson.core.JsonToken r0 = r4._handleApos()
            goto L2c
        L59:
            java.lang.String r0 = "NaN"
            r4._matchToken(r0, r1)
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L71
            java.lang.String r0 = "NaN"
            r2 = 9221120237041090560(0x7ff8000000000000, double:NaN)
            com.fasterxml.jackson.core.JsonToken r0 = r4.resetAsNaN(r0, r2)
            goto L2c
        L71:
            java.lang.String r0 = "Non-standard token 'NaN': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r4._reportError(r0)
            goto L4
        L78:
            java.lang.String r0 = "Infinity"
            r4._matchToken(r0, r1)
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L90
            java.lang.String r0 = "Infinity"
            r2 = 9218868437227405312(0x7ff0000000000000, double:Infinity)
            com.fasterxml.jackson.core.JsonToken r0 = r4.resetAsNaN(r0, r2)
            goto L2c
        L90:
            java.lang.String r0 = "Non-standard token 'Infinity': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r4._reportError(r0)
            goto L4
        L98:
            int r0 = r4._inputPtr
            int r1 = r4._inputEnd
            if (r0 < r1) goto La9
            boolean r0 = r4._loadMore()
            if (r0 != 0) goto La9
            com.fasterxml.jackson.core.JsonToken r0 = com.fasterxml.jackson.core.JsonToken.VALUE_NUMBER_INT
            r4._reportInvalidEOFInValue(r0)
        La9:
            byte[] r0 = r4._inputBuffer
            int r1 = r4._inputPtr
            int r2 = r1 + 1
            r4._inputPtr = r2
            r0 = r0[r1]
            r0 = r0 & 255(0xff, float:3.57E-43)
            r1 = 0
            com.fasterxml.jackson.core.JsonToken r0 = r4._handleInvalidNumberStart(r0, r1)
            goto L2c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._handleUnexpectedValue(int):com.fasterxml.jackson.core.JsonToken");
    }

    protected JsonToken _handleApos() throws IOException {
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                _loadMoreGuaranteed();
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int max = this._inputEnd;
            int max2 = this._inputPtr + (outBuf.length - outPtr);
            if (max2 < max) {
                max = max2;
            }
            while (this._inputPtr < max) {
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int c = inputBuffer[i] & 255;
                if (c != 39 && codes[c] == 0) {
                    outBuf[outPtr] = (char) c;
                    outPtr++;
                } else if (c != 39) {
                    switch (codes[c]) {
                        case 1:
                            c = _decodeEscaped();
                            break;
                        case 2:
                            c = _decodeUtf8_2(c);
                            break;
                        case 3:
                            if (this._inputEnd - this._inputPtr >= 2) {
                                c = _decodeUtf8_3fast(c);
                                break;
                            } else {
                                c = _decodeUtf8_3(c);
                                break;
                            }
                        case 4:
                            int c2 = _decodeUtf8_4(c);
                            int outPtr2 = outPtr + 1;
                            outBuf[outPtr] = (char) (55296 | (c2 >> 10));
                            if (outPtr2 >= outBuf.length) {
                                outBuf = this._textBuffer.finishCurrentSegment();
                                outPtr = 0;
                            } else {
                                outPtr = outPtr2;
                            }
                            c = 56320 | (c2 & 1023);
                            break;
                        default:
                            if (c < 32) {
                                _throwUnquotedSpace(c, "string value");
                            }
                            _reportInvalidChar(c);
                            break;
                    }
                    if (outPtr >= outBuf.length) {
                        outBuf = this._textBuffer.finishCurrentSegment();
                        outPtr = 0;
                    }
                    outBuf[outPtr] = (char) c;
                    outPtr++;
                } else {
                    this._textBuffer.setCurrentLength(outPtr);
                    return JsonToken.VALUE_STRING;
                }
            }
        }
    }

    protected JsonToken _handleInvalidNumberStart(int ch, boolean neg) throws IOException {
        String match;
        while (ch == 73) {
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOFInValue(JsonToken.VALUE_NUMBER_FLOAT);
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            ch = bArr[i];
            if (ch == 78) {
                match = neg ? "-INF" : "+INF";
            } else if (ch != 110) {
                break;
            } else {
                match = neg ? "-Infinity" : "+Infinity";
            }
            _matchToken(match, 3);
            if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                return resetAsNaN(match, neg ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
            }
            _reportError("Non-standard token '" + match + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
        }
        reportUnexpectedNumberChar(ch, "expected digit (0-9) to follow minus sign, for valid numeric value");
        return null;
    }

    protected final void _matchToken(String matchStr, int i) throws IOException {
        int len = matchStr.length();
        if (this._inputPtr + len >= this._inputEnd) {
            _matchToken2(matchStr, i);
            return;
        }
        do {
            if (this._inputBuffer[this._inputPtr] != matchStr.charAt(i)) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < len);
        int ch = this._inputBuffer[this._inputPtr] & 255;
        if (ch >= 48 && ch != 93 && ch != 125) {
            _checkMatchEnd(matchStr, i, ch);
        }
    }

    private final void _matchToken2(String matchStr, int i) throws IOException {
        int ch;
        int len = matchStr.length();
        do {
            if ((this._inputPtr >= this._inputEnd && !_loadMore()) || this._inputBuffer[this._inputPtr] != matchStr.charAt(i)) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < len);
        if ((this._inputPtr < this._inputEnd || _loadMore()) && (ch = this._inputBuffer[this._inputPtr] & 255) >= 48 && ch != 93 && ch != 125) {
            _checkMatchEnd(matchStr, i, ch);
        }
    }

    private final void _checkMatchEnd(String matchStr, int i, int ch) throws IOException {
        char c = (char) _decodeCharForError(ch);
        if (Character.isJavaIdentifierPart(c)) {
            _reportInvalidToken(matchStr.substring(0, i));
        }
    }

    private final int _skipWS() throws IOException {
        while (this._inputPtr < this._inputEnd) {
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = bArr[i] & 255;
            if (i2 > 32) {
                if (i2 == 47 || i2 == 35) {
                    this._inputPtr--;
                    return _skipWS2();
                }
                return i2;
            } else if (i2 != 32) {
                if (i2 == 10) {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (i2 == 13) {
                    _skipCR();
                } else if (i2 != 9) {
                    _throwInvalidSpace(i2);
                }
            }
        }
        return _skipWS2();
    }

    private final int _skipWS2() throws IOException {
        int i;
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                i = bArr[i2] & 255;
                if (i > 32) {
                    if (i == 47) {
                        _skipComment();
                    } else if (i != 35 || !_skipYAMLComment()) {
                        break;
                    }
                } else if (i != 32) {
                    if (i == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i == 13) {
                        _skipCR();
                    } else if (i != 9) {
                        _throwInvalidSpace(i);
                    }
                }
            } else {
                throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.typeDesc() + " entries");
            }
        }
        return i;
    }

    private final int _skipWSOrEnd() throws IOException {
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            return _eofAsNextChar();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = bArr[i] & 255;
        if (i2 > 32) {
            if (i2 == 47 || i2 == 35) {
                this._inputPtr--;
                return _skipWSOrEnd2();
            }
            return i2;
        }
        if (i2 != 32) {
            if (i2 == 10) {
                this._currInputRow++;
                this._currInputRowStart = this._inputPtr;
            } else if (i2 == 13) {
                _skipCR();
            } else if (i2 != 9) {
                _throwInvalidSpace(i2);
            }
        }
        while (this._inputPtr < this._inputEnd) {
            byte[] bArr2 = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = bArr2[i3] & 255;
            if (i4 > 32) {
                if (i4 == 47 || i4 == 35) {
                    this._inputPtr--;
                    return _skipWSOrEnd2();
                }
                return i4;
            } else if (i4 != 32) {
                if (i4 == 10) {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (i4 == 13) {
                    _skipCR();
                } else if (i4 != 9) {
                    _throwInvalidSpace(i4);
                }
            }
        }
        return _skipWSOrEnd2();
    }

    private final int _skipWSOrEnd2() throws IOException {
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                if (i2 > 32) {
                    if (i2 == 47) {
                        _skipComment();
                    } else if (i2 != 35 || !_skipYAMLComment()) {
                        return i2;
                    }
                } else if (i2 != 32) {
                    if (i2 == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i2 == 13) {
                        _skipCR();
                    } else if (i2 != 9) {
                        _throwInvalidSpace(i2);
                    }
                }
            } else {
                return _eofAsNextChar();
            }
        }
    }

    private final int _skipColon() throws IOException {
        if (this._inputPtr + 4 >= this._inputEnd) {
            return _skipColon2(false);
        }
        int i = this._inputBuffer[this._inputPtr];
        if (i == 58) {
            byte[] bArr = this._inputBuffer;
            int i2 = this._inputPtr + 1;
            this._inputPtr = i2;
            int i3 = bArr[i2];
            if (i3 > 32) {
                if (i3 == 47 || i3 == 35) {
                    return _skipColon2(true);
                }
                this._inputPtr++;
                return i3;
            }
            if (i3 == 32 || i3 == 9) {
                byte[] bArr2 = this._inputBuffer;
                int i4 = this._inputPtr + 1;
                this._inputPtr = i4;
                int i5 = bArr2[i4];
                if (i5 > 32) {
                    if (i5 == 47 || i5 == 35) {
                        return _skipColon2(true);
                    }
                    this._inputPtr++;
                    return i5;
                }
            }
            return _skipColon2(true);
        }
        if (i == 32 || i == 9) {
            byte[] bArr3 = this._inputBuffer;
            int i6 = this._inputPtr + 1;
            this._inputPtr = i6;
            i = bArr3[i6];
        }
        if (i == 58) {
            byte[] bArr4 = this._inputBuffer;
            int i7 = this._inputPtr + 1;
            this._inputPtr = i7;
            int i8 = bArr4[i7];
            if (i8 > 32) {
                if (i8 == 47 || i8 == 35) {
                    return _skipColon2(true);
                }
                this._inputPtr++;
                return i8;
            }
            if (i8 == 32 || i8 == 9) {
                byte[] bArr5 = this._inputBuffer;
                int i9 = this._inputPtr + 1;
                this._inputPtr = i9;
                int i10 = bArr5[i9];
                if (i10 > 32) {
                    if (i10 == 47 || i10 == 35) {
                        return _skipColon2(true);
                    }
                    this._inputPtr++;
                    return i10;
                }
            }
            return _skipColon2(true);
        }
        return _skipColon2(false);
    }

    private final int _skipColon2(boolean gotColon) throws IOException {
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                if (i2 > 32) {
                    if (i2 == 47) {
                        _skipComment();
                    } else if (i2 != 35 || !_skipYAMLComment()) {
                        if (!gotColon) {
                            if (i2 != 58) {
                                _reportUnexpectedChar(i2, "was expecting a colon to separate field name and value");
                            }
                            gotColon = true;
                        } else {
                            return i2;
                        }
                    }
                } else if (i2 != 32) {
                    if (i2 == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i2 == 13) {
                        _skipCR();
                    } else if (i2 != 9) {
                        _throwInvalidSpace(i2);
                    }
                }
            } else {
                _reportInvalidEOF(" within/between " + this._parsingContext.typeDesc() + " entries", null);
                return -1;
            }
        }
    }

    private final void _skipComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_COMMENTS)) {
            _reportUnexpectedChar(47, "maybe a (non-standard) comment? (not recognized as one since Feature 'ALLOW_COMMENTS' not enabled for parser)");
        }
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(" in a comment", null);
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i] & 255;
        if (c == 47) {
            _skipLine();
        } else if (c == 42) {
            _skipCComment();
        } else {
            _reportUnexpectedChar(c, "was expecting either '*' or '/' for a comment");
        }
    }

    private final void _skipCComment() throws IOException {
        int[] codes = CharTypes.getInputCodeComment();
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                int code = codes[i2];
                if (code != 0) {
                    switch (code) {
                        case 2:
                            _skipUtf8_2();
                            continue;
                        case 3:
                            _skipUtf8_3();
                            continue;
                        case 4:
                            _skipUtf8_4(i2);
                            continue;
                        case 10:
                            this._currInputRow++;
                            this._currInputRowStart = this._inputPtr;
                            continue;
                        case 13:
                            _skipCR();
                            continue;
                        case 42:
                            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                                break;
                            } else if (this._inputBuffer[this._inputPtr] == 47) {
                                this._inputPtr++;
                                return;
                            } else {
                                continue;
                            }
                        default:
                            _reportInvalidChar(i2);
                            continue;
                    }
                }
            }
        }
        _reportInvalidEOF(" in a comment", null);
    }

    private final boolean _skipYAMLComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_YAML_COMMENTS)) {
            return false;
        }
        _skipLine();
        return true;
    }

    private final void _skipLine() throws IOException {
        int[] codes = CharTypes.getInputCodeComment();
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                int code = codes[i2];
                if (code != 0) {
                    switch (code) {
                        case 2:
                            _skipUtf8_2();
                            continue;
                        case 3:
                            _skipUtf8_3();
                            continue;
                        case 4:
                            _skipUtf8_4(i2);
                            continue;
                        case 10:
                            this._currInputRow++;
                            this._currInputRowStart = this._inputPtr;
                            return;
                        case 13:
                            _skipCR();
                            return;
                        case 42:
                            break;
                        default:
                            if (code < 0) {
                                _reportInvalidChar(i2);
                                break;
                            } else {
                                continue;
                            }
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
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i];
        switch (c) {
            case 34:
            case 47:
            case 92:
                return (char) c;
            case 98:
                return '\b';
            case 102:
                return '\f';
            case 110:
                return '\n';
            case 114:
                return '\r';
            case 116:
                return '\t';
            case 117:
                int value = 0;
                for (int i2 = 0; i2 < 4; i2++) {
                    if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                        _reportInvalidEOF(" in character escape sequence", JsonToken.VALUE_STRING);
                    }
                    byte[] bArr2 = this._inputBuffer;
                    int i3 = this._inputPtr;
                    this._inputPtr = i3 + 1;
                    int ch = bArr2[i3];
                    int digit = CharTypes.charToHex(ch);
                    if (digit < 0) {
                        _reportUnexpectedChar(ch, "expected a hex-digit for character escape sequence");
                    }
                    value = (value << 4) | digit;
                }
                return (char) value;
            default:
                return _handleUnrecognizedCharacterEscape((char) _decodeCharForError(c));
        }
    }

    protected int _decodeCharForError(int firstByte) throws IOException {
        int needed;
        int c = firstByte & 255;
        if (c > 127) {
            if ((c & 224) == 192) {
                c &= 31;
                needed = 1;
            } else if ((c & PsExtractor.VIDEO_STREAM_MASK) == 224) {
                c &= 15;
                needed = 2;
            } else if ((c & 248) == 240) {
                c &= 7;
                needed = 3;
            } else {
                _reportInvalidInitial(c & 255);
                needed = 1;
            }
            int d = nextByte();
            if ((d & 192) != 128) {
                _reportInvalidOther(d & 255);
            }
            int c2 = (c << 6) | (d & 63);
            if (needed > 1) {
                int d2 = nextByte();
                if ((d2 & 192) != 128) {
                    _reportInvalidOther(d2 & 255);
                }
                int c3 = (c2 << 6) | (d2 & 63);
                if (needed > 2) {
                    int d3 = nextByte();
                    if ((d3 & 192) != 128) {
                        _reportInvalidOther(d3 & 255);
                    }
                    return (c3 << 6) | (d3 & 63);
                }
                return c3;
            }
            return c2;
        }
        return c;
    }

    private final int _decodeUtf8_2(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        return ((c & 31) << 6) | (d & 63);
    }

    private final int _decodeUtf8_3(int c1) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        int c12 = c1 & 15;
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        int c = (c12 << 6) | (d & 63);
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int d2 = bArr2[i2];
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255, this._inputPtr);
        }
        return (c << 6) | (d2 & 63);
    }

    private final int _decodeUtf8_3fast(int c1) throws IOException {
        int c12 = c1 & 15;
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        int c = (c12 << 6) | (d & 63);
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int d2 = bArr2[i2];
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255, this._inputPtr);
        }
        return (c << 6) | (d2 & 63);
    }

    private final int _decodeUtf8_4(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        int c2 = ((c & 7) << 6) | (d & 63);
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int d2 = bArr2[i2];
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255, this._inputPtr);
        }
        int c3 = (c2 << 6) | (d2 & 63);
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr3 = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int d3 = bArr3[i3];
        if ((d3 & 192) != 128) {
            _reportInvalidOther(d3 & 255, this._inputPtr);
        }
        return ((c3 << 6) | (d3 & 63)) - 65536;
    }

    private final void _skipUtf8_2() throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i];
        if ((c & 192) != 128) {
            _reportInvalidOther(c & 255, this._inputPtr);
        }
    }

    private final void _skipUtf8_3() throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i];
        if ((c & 192) != 128) {
            _reportInvalidOther(c & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int c2 = bArr2[i2];
        if ((c2 & 192) != 128) {
            _reportInvalidOther(c2 & 255, this._inputPtr);
        }
    }

    private final void _skipUtf8_4(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int d2 = bArr2[i2];
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr3 = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int d3 = bArr3[i3];
        if ((d3 & 192) != 128) {
            _reportInvalidOther(d3 & 255, this._inputPtr);
        }
    }

    protected final void _skipCR() throws IOException {
        if ((this._inputPtr < this._inputEnd || _loadMore()) && this._inputBuffer[this._inputPtr] == 10) {
            this._inputPtr++;
        }
        this._currInputRow++;
        this._currInputRowStart = this._inputPtr;
    }

    private int nextByte() throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        return bArr[i] & 255;
    }

    protected void _reportInvalidToken(String matchedPart) throws IOException {
        _reportInvalidToken(matchedPart, "'null', 'true', 'false' or NaN");
    }

    protected void _reportInvalidToken(String matchedPart, String msg) throws IOException {
        StringBuilder sb = new StringBuilder(matchedPart);
        while (sb.length() < 256 && (this._inputPtr < this._inputEnd || _loadMore())) {
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = bArr[i];
            char c = (char) _decodeCharForError(i2);
            if (!Character.isJavaIdentifierPart(c)) {
                break;
            }
            sb.append(c);
        }
        if (sb.length() == 256) {
            sb.append("...");
        }
        _reportError("Unrecognized token '" + sb.toString() + "': was expecting " + msg);
    }

    protected void _reportInvalidChar(int c) throws JsonParseException {
        if (c < 32) {
            _throwInvalidSpace(c);
        }
        _reportInvalidInitial(c);
    }

    protected void _reportInvalidInitial(int mask) throws JsonParseException {
        _reportError("Invalid UTF-8 start byte 0x" + Integer.toHexString(mask));
    }

    protected void _reportInvalidOther(int mask) throws JsonParseException {
        _reportError("Invalid UTF-8 middle byte 0x" + Integer.toHexString(mask));
    }

    protected void _reportInvalidOther(int mask, int ptr) throws JsonParseException {
        this._inputPtr = ptr;
        _reportInvalidOther(mask);
    }

    public static int[] growArrayBy(int[] arr, int more) {
        return arr == null ? new int[more] : Arrays.copyOf(arr, arr.length + more);
    }

    protected final byte[] _decodeBase64(Base64Variant b64variant) throws IOException {
        ByteArrayBuilder builder = _getByteArrayBuilder();
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                _loadMoreGuaranteed();
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int ch = bArr[i] & 255;
            if (ch > 32) {
                int bits = b64variant.decodeBase64Char(ch);
                if (bits < 0) {
                    if (ch == 34) {
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
                byte[] bArr2 = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                int ch2 = bArr2[i2] & 255;
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                int ch3 = bArr3[i3] & 255;
                int bits3 = b64variant.decodeBase64Char(ch3);
                if (bits3 < 0) {
                    if (bits3 != -2) {
                        if (ch3 == 34 && !b64variant.usesPadding()) {
                            builder.append(decodedData2 >> 4);
                            return builder.toByteArray();
                        }
                        bits3 = _decodeBase64Escape(b64variant, ch3, 2);
                    }
                    if (bits3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            _loadMoreGuaranteed();
                        }
                        byte[] bArr4 = this._inputBuffer;
                        int i4 = this._inputPtr;
                        this._inputPtr = i4 + 1;
                        int ch4 = bArr4[i4] & 255;
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
                byte[] bArr5 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                int ch5 = bArr5[i5] & 255;
                int bits4 = b64variant.decodeBase64Char(ch5);
                if (bits4 < 0) {
                    if (bits4 != -2) {
                        if (ch5 == 34 && !b64variant.usesPadding()) {
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
            return new JsonLocation(src, total, -1L, this._nameStartRow, this._nameStartCol);
        }
        return new JsonLocation(src, this._tokenInputTotal - 1, -1L, this._tokenInputRow, this._tokenInputCol);
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        int col = (this._inputPtr - this._currInputRowStart) + 1;
        return new JsonLocation(this._ioContext.getSourceReference(), this._currInputProcessed + this._inputPtr, -1L, this._currInputRow, col);
    }

    private final void _updateLocation() {
        this._tokenInputRow = this._currInputRow;
        int ptr = this._inputPtr;
        this._tokenInputTotal = this._currInputProcessed + ptr;
        this._tokenInputCol = ptr - this._currInputRowStart;
    }

    private final void _updateNameLocation() {
        this._nameStartRow = this._currInputRow;
        int ptr = this._inputPtr;
        this._nameStartOffset = ptr;
        this._nameStartCol = ptr - this._currInputRowStart;
    }

    private static final int pad(int q, int bytes) {
        return bytes == 4 ? q : q | ((-1) << (bytes << 3));
    }
}
