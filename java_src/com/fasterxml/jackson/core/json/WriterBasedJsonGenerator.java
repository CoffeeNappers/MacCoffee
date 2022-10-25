package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.NumberOutput;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
/* loaded from: classes.dex */
public final class WriterBasedJsonGenerator extends JsonGeneratorImpl {
    protected static final char[] HEX_CHARS = CharTypes.copyHexChars();
    protected static final int SHORT_WRITE = 32;
    protected SerializableString _currentEscape;
    protected char[] _entityBuffer;
    protected char[] _outputBuffer;
    protected int _outputEnd;
    protected int _outputHead;
    protected int _outputTail;
    protected char _quoteChar;
    protected final Writer _writer;

    public WriterBasedJsonGenerator(IOContext ctxt, int features, ObjectCodec codec, Writer w) {
        super(ctxt, features, codec);
        this._quoteChar = '\"';
        this._writer = w;
        this._outputBuffer = ctxt.allocConcatBuffer();
        this._outputEnd = this._outputBuffer.length;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public Object getOutputTarget() {
        return this._writer;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public int getOutputBuffered() {
        int len = this._outputTail - this._outputHead;
        return Math.max(0, len);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public boolean canWriteFormattedNumbers() {
        return true;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(String name) throws IOException {
        boolean z = true;
        int status = this._writeContext.writeFieldName(name);
        if (status == 4) {
            _reportError("Can not write a field name, expecting a value");
        }
        if (status != 1) {
            z = false;
        }
        _writeFieldName(name, z);
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(SerializableString name) throws IOException {
        boolean z = true;
        int status = this._writeContext.writeFieldName(name.getValue());
        if (status == 4) {
            _reportError("Can not write a field name, expecting a value");
        }
        if (status != 1) {
            z = false;
        }
        _writeFieldName(name, z);
    }

    protected void _writeFieldName(String name, boolean commaBefore) throws IOException {
        if (this._cfgPrettyPrinter != null) {
            _writePPFieldName(name, commaBefore);
            return;
        }
        if (this._outputTail + 1 >= this._outputEnd) {
            _flushBuffer();
        }
        if (commaBefore) {
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ',';
        }
        if (this._cfgUnqNames) {
            _writeString(name);
            return;
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
        _writeString(name);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr3 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr3[i3] = this._quoteChar;
    }

    protected void _writeFieldName(SerializableString name, boolean commaBefore) throws IOException {
        if (this._cfgPrettyPrinter != null) {
            _writePPFieldName(name, commaBefore);
            return;
        }
        if (this._outputTail + 1 >= this._outputEnd) {
            _flushBuffer();
        }
        if (commaBefore) {
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ',';
        }
        char[] quoted = name.asQuotedChars();
        if (this._cfgUnqNames) {
            writeRaw(quoted, 0, quoted.length);
            return;
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
        int qlen = quoted.length;
        if (this._outputTail + qlen + 1 >= this._outputEnd) {
            writeRaw(quoted, 0, qlen);
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr3 = this._outputBuffer;
            int i3 = this._outputTail;
            this._outputTail = i3 + 1;
            cArr3[i3] = this._quoteChar;
            return;
        }
        System.arraycopy(quoted, 0, this._outputBuffer, this._outputTail, qlen);
        this._outputTail += qlen;
        char[] cArr4 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        cArr4[i4] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeStartArray() throws IOException {
        _verifyValueWrite("start an array");
        this._writeContext = this._writeContext.createChildArrayContext();
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartArray(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '[';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeEndArray() throws IOException {
        if (!this._writeContext.inArray()) {
            _reportError("Current context not Array but " + this._writeContext.typeDesc());
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeEndArray(this, this._writeContext.getEntryCount());
        } else {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ']';
        }
        this._writeContext = this._writeContext.clearAndGetParent();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeStartObject(Object forValue) throws IOException {
        _verifyValueWrite("start an object");
        JsonWriteContext ctxt = this._writeContext.createChildObjectContext();
        this._writeContext = ctxt;
        if (forValue != null) {
            ctxt.setCurrentValue(forValue);
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartObject(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '{';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeStartObject() throws IOException {
        _verifyValueWrite("start an object");
        this._writeContext = this._writeContext.createChildObjectContext();
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartObject(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '{';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeEndObject() throws IOException {
        if (!this._writeContext.inObject()) {
            _reportError("Current context not Object but " + this._writeContext.typeDesc());
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeEndObject(this, this._writeContext.getEntryCount());
        } else {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = '}';
        }
        this._writeContext = this._writeContext.clearAndGetParent();
    }

    protected void _writePPFieldName(String name, boolean commaBefore) throws IOException {
        if (commaBefore) {
            this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
        } else {
            this._cfgPrettyPrinter.beforeObjectEntries(this);
        }
        if (this._cfgUnqNames) {
            _writeString(name);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        _writeString(name);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    protected void _writePPFieldName(SerializableString name, boolean commaBefore) throws IOException {
        if (commaBefore) {
            this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
        } else {
            this._cfgPrettyPrinter.beforeObjectEntries(this);
        }
        char[] quoted = name.asQuotedChars();
        if (this._cfgUnqNames) {
            writeRaw(quoted, 0, quoted.length);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        writeRaw(quoted, 0, quoted.length);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(String text) throws IOException {
        _verifyValueWrite("write a string");
        if (text == null) {
            _writeNull();
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        _writeString(text);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(char[] text, int offset, int len) throws IOException {
        _verifyValueWrite("write a string");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        _writeString(text, offset, len);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeString(SerializableString sstr) throws IOException {
        _verifyValueWrite("write a string");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        char[] text = sstr.asQuotedChars();
        int len = text.length;
        if (len < 32) {
            int room = this._outputEnd - this._outputTail;
            if (len > room) {
                _flushBuffer();
            }
            System.arraycopy(text, 0, this._outputBuffer, this._outputTail, len);
            this._outputTail += len;
        } else {
            _flushBuffer();
            this._writer.write(text, 0, len);
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawUTF8String(byte[] text, int offset, int length) throws IOException {
        _reportUnsupportedOperation();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeUTF8String(byte[] text, int offset, int length) throws IOException {
        _reportUnsupportedOperation();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(String text) throws IOException {
        int len = text.length();
        int room = this._outputEnd - this._outputTail;
        if (room == 0) {
            _flushBuffer();
            room = this._outputEnd - this._outputTail;
        }
        if (room >= len) {
            text.getChars(0, len, this._outputBuffer, this._outputTail);
            this._outputTail += len;
            return;
        }
        writeRawLong(text);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(String text, int start, int len) throws IOException {
        int room = this._outputEnd - this._outputTail;
        if (room < len) {
            _flushBuffer();
            room = this._outputEnd - this._outputTail;
        }
        if (room >= len) {
            text.getChars(start, start + len, this._outputBuffer, this._outputTail);
            this._outputTail += len;
            return;
        }
        writeRawLong(text.substring(start, start + len));
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(SerializableString text) throws IOException {
        writeRaw(text.getValue());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(char[] text, int offset, int len) throws IOException {
        if (len < 32) {
            int room = this._outputEnd - this._outputTail;
            if (len > room) {
                _flushBuffer();
            }
            System.arraycopy(text, offset, this._outputBuffer, this._outputTail, len);
            this._outputTail += len;
            return;
        }
        _flushBuffer();
        this._writer.write(text, offset, len);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(char c) throws IOException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = c;
    }

    private void writeRawLong(String text) throws IOException {
        int room = this._outputEnd - this._outputTail;
        text.getChars(0, room, this._outputBuffer, this._outputTail);
        this._outputTail += room;
        _flushBuffer();
        int offset = room;
        int len = text.length() - room;
        while (len > this._outputEnd) {
            int amount = this._outputEnd;
            text.getChars(offset, offset + amount, this._outputBuffer, 0);
            this._outputHead = 0;
            this._outputTail = amount;
            _flushBuffer();
            offset += amount;
            len -= amount;
        }
        text.getChars(offset, offset + len, this._outputBuffer, 0);
        this._outputHead = 0;
        this._outputTail = len;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeBinary(Base64Variant b64variant, byte[] data, int offset, int len) throws IOException, JsonGenerationException {
        _verifyValueWrite("write a binary value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        _writeBinary(b64variant, data, offset, offset + len);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public int writeBinary(Base64Variant b64variant, InputStream data, int dataLength) throws IOException, JsonGenerationException {
        int bytes;
        _verifyValueWrite("write a binary value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        byte[] encodingBuffer = this._ioContext.allocBase64Buffer();
        try {
            if (dataLength < 0) {
                bytes = _writeBinary(b64variant, data, encodingBuffer);
            } else {
                int missing = _writeBinary(b64variant, data, encodingBuffer, dataLength);
                if (missing > 0) {
                    _reportError("Too few bytes available: missing " + missing + " bytes (out of " + dataLength + ")");
                }
                bytes = dataLength;
            }
            this._ioContext.releaseBase64Buffer(encodingBuffer);
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr2 = this._outputBuffer;
            int i2 = this._outputTail;
            this._outputTail = i2 + 1;
            cArr2[i2] = this._quoteChar;
            return bytes;
        } catch (Throwable th) {
            this._ioContext.releaseBase64Buffer(encodingBuffer);
            throw th;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(short s) throws IOException {
        _verifyValueWrite("write a number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedShort(s);
            return;
        }
        if (this._outputTail + 6 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputInt(s, this._outputBuffer, this._outputTail);
    }

    private void _writeQuotedShort(short s) throws IOException {
        if (this._outputTail + 8 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        this._outputTail = NumberOutput.outputInt(s, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(int i) throws IOException {
        _verifyValueWrite("write a number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedInt(i);
            return;
        }
        if (this._outputTail + 11 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputInt(i, this._outputBuffer, this._outputTail);
    }

    private void _writeQuotedInt(int i) throws IOException {
        if (this._outputTail + 13 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr[i2] = this._quoteChar;
        this._outputTail = NumberOutput.outputInt(i, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr2[i3] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(long l) throws IOException {
        _verifyValueWrite("write a number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedLong(l);
            return;
        }
        if (this._outputTail + 21 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputLong(l, this._outputBuffer, this._outputTail);
    }

    private void _writeQuotedLong(long l) throws IOException {
        if (this._outputTail + 23 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        this._outputTail = NumberOutput.outputLong(l, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(BigInteger value) throws IOException {
        _verifyValueWrite("write a number");
        if (value == null) {
            _writeNull();
        } else if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(value.toString());
        } else {
            writeRaw(value.toString());
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(double d) throws IOException {
        if (this._cfgNumbersAsStrings || (isEnabled(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS) && (Double.isNaN(d) || Double.isInfinite(d)))) {
            writeString(String.valueOf(d));
            return;
        }
        _verifyValueWrite("write a number");
        writeRaw(String.valueOf(d));
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(float f) throws IOException {
        if (this._cfgNumbersAsStrings || (isEnabled(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS) && (Float.isNaN(f) || Float.isInfinite(f)))) {
            writeString(String.valueOf(f));
            return;
        }
        _verifyValueWrite("write a number");
        writeRaw(String.valueOf(f));
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(BigDecimal value) throws IOException {
        _verifyValueWrite("write a number");
        if (value == null) {
            _writeNull();
        } else if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(_asString(value));
        } else {
            writeRaw(_asString(value));
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(String encodedValue) throws IOException {
        _verifyValueWrite("write a number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(encodedValue);
        } else {
            writeRaw(encodedValue);
        }
    }

    private void _writeQuotedRaw(String value) throws IOException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        writeRaw(value);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeBoolean(boolean state) throws IOException {
        int ptr;
        _verifyValueWrite("write a boolean value");
        if (this._outputTail + 5 >= this._outputEnd) {
            _flushBuffer();
        }
        int ptr2 = this._outputTail;
        char[] buf = this._outputBuffer;
        if (state) {
            buf[ptr2] = 't';
            int ptr3 = ptr2 + 1;
            buf[ptr3] = 'r';
            int ptr4 = ptr3 + 1;
            buf[ptr4] = 'u';
            ptr = ptr4 + 1;
            buf[ptr] = 'e';
        } else {
            buf[ptr2] = 'f';
            int ptr5 = ptr2 + 1;
            buf[ptr5] = 'a';
            int ptr6 = ptr5 + 1;
            buf[ptr6] = 'l';
            int ptr7 = ptr6 + 1;
            buf[ptr7] = 's';
            ptr = ptr7 + 1;
            buf[ptr] = 'e';
        }
        this._outputTail = ptr + 1;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNull() throws IOException {
        _verifyValueWrite("write a null");
        _writeNull();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase
    protected void _verifyValueWrite(String typeMsg) throws IOException {
        char c;
        int status = this._writeContext.writeValue();
        if (this._cfgPrettyPrinter != null) {
            _verifyPrettyValueWrite(typeMsg, status);
            return;
        }
        switch (status) {
            case 1:
                c = ',';
                break;
            case 2:
                c = ':';
                break;
            case 3:
                if (this._rootValueSeparator != null) {
                    writeRaw(this._rootValueSeparator.getValue());
                    return;
                }
                return;
            case 4:
            default:
                return;
            case 5:
                _reportCantWriteValueExpectName(typeMsg);
                return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = c;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator, java.io.Flushable
    public void flush() throws IOException {
        _flushBuffer();
        if (this._writer != null && isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)) {
            this._writer.flush();
        }
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        super.close();
        if (this._outputBuffer != null && isEnabled(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT)) {
            while (true) {
                JsonStreamContext ctxt = getOutputContext();
                if (ctxt.inArray()) {
                    writeEndArray();
                } else if (!ctxt.inObject()) {
                    break;
                } else {
                    writeEndObject();
                }
            }
        }
        _flushBuffer();
        this._outputHead = 0;
        this._outputTail = 0;
        if (this._writer != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonGenerator.Feature.AUTO_CLOSE_TARGET)) {
                this._writer.close();
            } else if (isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)) {
                this._writer.flush();
            }
        }
        _releaseBuffers();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase
    protected void _releaseBuffers() {
        char[] buf = this._outputBuffer;
        if (buf != null) {
            this._outputBuffer = null;
            this._ioContext.releaseConcatBuffer(buf);
        }
    }

    private void _writeString(String text) throws IOException {
        int len = text.length();
        if (len > this._outputEnd) {
            _writeLongString(text);
            return;
        }
        if (this._outputTail + len > this._outputEnd) {
            _flushBuffer();
        }
        text.getChars(0, len, this._outputBuffer, this._outputTail);
        if (this._characterEscapes != null) {
            _writeStringCustom(len);
        } else if (this._maximumNonEscapedChar != 0) {
            _writeStringASCII(len, this._maximumNonEscapedChar);
        } else {
            _writeString2(len);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001d, code lost:
        if (r4 <= 0) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x001f, code lost:
        r8._writer.write(r8._outputBuffer, r8._outputHead, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0028, code lost:
        r5 = r8._outputBuffer;
        r6 = r8._outputTail;
        r8._outputTail = r6 + 1;
        r0 = r5[r6];
        _prependOrWriteCharacterEscape(r0, r2[r0]);
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0017, code lost:
        r4 = r8._outputTail - r8._outputHead;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeString2(int r9) throws java.io.IOException {
        /*
            r8 = this;
            int r5 = r8._outputTail
            int r1 = r5 + r9
            int[] r2 = r8._outputEscapes
            int r3 = r2.length
        L7:
            int r5 = r8._outputTail
            if (r5 >= r1) goto L40
        Lb:
            char[] r5 = r8._outputBuffer
            int r6 = r8._outputTail
            char r0 = r5[r6]
            if (r0 >= r3) goto L38
            r5 = r2[r0]
            if (r5 == 0) goto L38
            int r5 = r8._outputTail
            int r6 = r8._outputHead
            int r4 = r5 - r6
            if (r4 <= 0) goto L28
            java.io.Writer r5 = r8._writer
            char[] r6 = r8._outputBuffer
            int r7 = r8._outputHead
            r5.write(r6, r7, r4)
        L28:
            char[] r5 = r8._outputBuffer
            int r6 = r8._outputTail
            int r7 = r6 + 1
            r8._outputTail = r7
            char r0 = r5[r6]
            r5 = r2[r0]
            r8._prependOrWriteCharacterEscape(r0, r5)
            goto L7
        L38:
            int r5 = r8._outputTail
            int r5 = r5 + 1
            r8._outputTail = r5
            if (r5 < r1) goto Lb
        L40:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeString2(int):void");
    }

    private void _writeLongString(String text) throws IOException {
        _flushBuffer();
        int textLen = text.length();
        int offset = 0;
        do {
            int max = this._outputEnd;
            int segmentLen = offset + max > textLen ? textLen - offset : max;
            text.getChars(offset, offset + segmentLen, this._outputBuffer, 0);
            if (this._characterEscapes != null) {
                _writeSegmentCustom(segmentLen);
            } else if (this._maximumNonEscapedChar != 0) {
                _writeSegmentASCII(segmentLen, this._maximumNonEscapedChar);
            } else {
                _writeSegment(segmentLen);
            }
            offset += segmentLen;
        } while (offset < textLen);
    }

    private void _writeSegment(int end) throws IOException {
        char c;
        int[] escCodes = this._outputEscapes;
        int escLen = escCodes.length;
        int ptr = 0;
        int start = 0;
        while (ptr < end) {
            do {
                c = this._outputBuffer[ptr];
                if (c < escLen && escCodes[c] != 0) {
                    break;
                }
                ptr++;
            } while (ptr < end);
            int flushLen = ptr - start;
            if (flushLen > 0) {
                this._writer.write(this._outputBuffer, start, flushLen);
                if (ptr >= end) {
                    return;
                }
            }
            ptr++;
            start = _prependOrWriteCharacterEscape(this._outputBuffer, ptr, end, c, escCodes[c]);
        }
    }

    private void _writeString(char[] text, int offset, int len) throws IOException {
        int offset2;
        if (this._characterEscapes != null) {
            _writeStringCustom(text, offset, len);
        } else if (this._maximumNonEscapedChar != 0) {
            _writeStringASCII(text, offset, len, this._maximumNonEscapedChar);
        } else {
            int len2 = len + offset;
            int[] escCodes = this._outputEscapes;
            int escLen = escCodes.length;
            while (offset < len2) {
                int start = offset;
                while (true) {
                    char c = text[offset];
                    if (c < escLen && escCodes[c] != 0) {
                        offset2 = offset;
                        break;
                    }
                    offset++;
                    if (offset >= len2) {
                        offset2 = offset;
                        break;
                    }
                }
                int newAmount = offset2 - start;
                if (newAmount < 32) {
                    if (this._outputTail + newAmount > this._outputEnd) {
                        _flushBuffer();
                    }
                    if (newAmount > 0) {
                        System.arraycopy(text, start, this._outputBuffer, this._outputTail, newAmount);
                        this._outputTail += newAmount;
                    }
                } else {
                    _flushBuffer();
                    this._writer.write(text, start, newAmount);
                }
                if (offset2 < len2) {
                    offset = offset2 + 1;
                    char c2 = text[offset2];
                    _appendCharacterEscape(c2, escCodes[c2]);
                } else {
                    return;
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0045 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringASCII(int r10, int r11) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r9 = this;
            int r6 = r9._outputTail
            int r1 = r6 + r10
            int[] r3 = r9._outputEscapes
            int r6 = r3.length
            int r7 = r11 + 1
            int r4 = java.lang.Math.min(r6, r7)
            r2 = 0
        Le:
            int r6 = r9._outputTail
            if (r6 >= r1) goto L45
        L12:
            char[] r6 = r9._outputBuffer
            int r7 = r9._outputTail
            char r0 = r6[r7]
            if (r0 >= r4) goto L39
            r2 = r3[r0]
            if (r2 == 0) goto L3d
        L1e:
            int r6 = r9._outputTail
            int r7 = r9._outputHead
            int r5 = r6 - r7
            if (r5 <= 0) goto L2f
            java.io.Writer r6 = r9._writer
            char[] r7 = r9._outputBuffer
            int r8 = r9._outputHead
            r6.write(r7, r8, r5)
        L2f:
            int r6 = r9._outputTail
            int r6 = r6 + 1
            r9._outputTail = r6
            r9._prependOrWriteCharacterEscape(r0, r2)
            goto Le
        L39:
            if (r0 <= r11) goto L3d
            r2 = -1
            goto L1e
        L3d:
            int r6 = r9._outputTail
            int r6 = r6 + 1
            r9._outputTail = r6
            if (r6 < r1) goto L12
        L45:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringASCII(int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0018 A[EDGE_INSN: B:25:0x0018->B:8:0x0018 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeSegmentASCII(int r11, int r12) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r10 = this;
            int[] r6 = r10._outputEscapes
            int r0 = r6.length
            int r1 = r12 + 1
            int r7 = java.lang.Math.min(r0, r1)
            r2 = 0
            r5 = 0
            r9 = r2
        Lc:
            if (r2 >= r11) goto L25
        Le:
            char[] r0 = r10._outputBuffer
            char r4 = r0[r2]
            if (r4 >= r7) goto L26
            r5 = r6[r4]
            if (r5 == 0) goto L2a
        L18:
            int r8 = r2 - r9
            if (r8 <= 0) goto L2f
            java.io.Writer r0 = r10._writer
            char[] r1 = r10._outputBuffer
            r0.write(r1, r9, r8)
            if (r2 < r11) goto L2f
        L25:
            return
        L26:
            if (r4 <= r12) goto L2a
            r5 = -1
            goto L18
        L2a:
            int r2 = r2 + 1
            if (r2 < r11) goto Le
            goto L18
        L2f:
            int r2 = r2 + 1
            char[] r1 = r10._outputBuffer
            r0 = r10
            r3 = r11
            int r9 = r0._prependOrWriteCharacterEscape(r1, r2, r3, r4, r5)
            goto Lc
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeSegmentASCII(int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0016 A[EDGE_INSN: B:29:0x0016->B:9:0x0016 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringASCII(char[] r9, int r10, int r11, int r12) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r8 = this;
            int r11 = r11 + r10
            int[] r2 = r8._outputEscapes
            int r6 = r2.length
            int r7 = r12 + 1
            int r3 = java.lang.Math.min(r6, r7)
            r1 = 0
        Lb:
            if (r10 >= r11) goto L36
            r5 = r10
        Le:
            char r0 = r9[r10]
            if (r0 >= r3) goto L37
            r1 = r2[r0]
            if (r1 == 0) goto L3b
        L16:
            int r4 = r10 - r5
            r6 = 32
            if (r4 >= r6) goto L40
            int r6 = r8._outputTail
            int r6 = r6 + r4
            int r7 = r8._outputEnd
            if (r6 <= r7) goto L26
            r8._flushBuffer()
        L26:
            if (r4 <= 0) goto L34
            char[] r6 = r8._outputBuffer
            int r7 = r8._outputTail
            java.lang.System.arraycopy(r9, r5, r6, r7, r4)
            int r6 = r8._outputTail
            int r6 = r6 + r4
            r8._outputTail = r6
        L34:
            if (r10 < r11) goto L49
        L36:
            return
        L37:
            if (r0 <= r12) goto L3b
            r1 = -1
            goto L16
        L3b:
            int r10 = r10 + 1
            if (r10 < r11) goto Le
            goto L16
        L40:
            r8._flushBuffer()
            java.io.Writer r6 = r8._writer
            r6.write(r9, r5, r4)
            goto L34
        L49:
            int r10 = r10 + 1
            r8._appendCharacterEscape(r0, r1)
            goto Lb
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringASCII(char[], int, int, int):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0028, code lost:
        r6 = r11._outputTail - r11._outputHead;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x002e, code lost:
        if (r6 <= 0) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x0030, code lost:
        r11._writer.write(r11._outputBuffer, r11._outputHead, r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0039, code lost:
        r11._outputTail++;
        _prependOrWriteCharacterEscape(r0, r3);
     */
    /* JADX WARN: Removed duplicated region for block: B:26:0x005c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringCustom(int r12) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r11 = this;
            int r8 = r11._outputTail
            int r2 = r8 + r12
            int[] r4 = r11._outputEscapes
            int r8 = r11._maximumNonEscapedChar
            r9 = 1
            if (r8 >= r9) goto L43
            r7 = 65535(0xffff, float:9.1834E-41)
        Le:
            int r8 = r4.length
            int r9 = r7 + 1
            int r5 = java.lang.Math.min(r8, r9)
            r3 = 0
            com.fasterxml.jackson.core.io.CharacterEscapes r1 = r11._characterEscapes
        L18:
            int r8 = r11._outputTail
            if (r8 >= r2) goto L5c
        L1c:
            char[] r8 = r11._outputBuffer
            int r9 = r11._outputTail
            char r0 = r8[r9]
            if (r0 >= r5) goto L46
            r3 = r4[r0]
            if (r3 == 0) goto L54
        L28:
            int r8 = r11._outputTail
            int r9 = r11._outputHead
            int r6 = r8 - r9
            if (r6 <= 0) goto L39
            java.io.Writer r8 = r11._writer
            char[] r9 = r11._outputBuffer
            int r10 = r11._outputHead
            r8.write(r9, r10, r6)
        L39:
            int r8 = r11._outputTail
            int r8 = r8 + 1
            r11._outputTail = r8
            r11._prependOrWriteCharacterEscape(r0, r3)
            goto L18
        L43:
            int r7 = r11._maximumNonEscapedChar
            goto Le
        L46:
            if (r0 <= r7) goto L4a
            r3 = -1
            goto L28
        L4a:
            com.fasterxml.jackson.core.SerializableString r8 = r1.getEscapeSequence(r0)
            r11._currentEscape = r8
            if (r8 == 0) goto L54
            r3 = -2
            goto L28
        L54:
            int r8 = r11._outputTail
            int r8 = r8 + 1
            r11._outputTail = r8
            if (r8 < r2) goto L1c
        L5c:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringCustom(int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0022 A[EDGE_INSN: B:31:0x0022->B:11:0x0022 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeSegmentCustom(int r13) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r12 = this;
            int[] r7 = r12._outputEscapes
            int r0 = r12._maximumNonEscapedChar
            r1 = 1
            if (r0 >= r1) goto L30
            r10 = 65535(0xffff, float:9.1834E-41)
        La:
            int r0 = r7.length
            int r1 = r10 + 1
            int r8 = java.lang.Math.min(r0, r1)
            com.fasterxml.jackson.core.io.CharacterEscapes r6 = r12._characterEscapes
            r2 = 0
            r5 = 0
            r11 = r2
        L16:
            if (r2 >= r13) goto L2f
        L18:
            char[] r0 = r12._outputBuffer
            char r4 = r0[r2]
            if (r4 >= r8) goto L33
            r5 = r7[r4]
            if (r5 == 0) goto L41
        L22:
            int r9 = r2 - r11
            if (r9 <= 0) goto L46
            java.io.Writer r0 = r12._writer
            char[] r1 = r12._outputBuffer
            r0.write(r1, r11, r9)
            if (r2 < r13) goto L46
        L2f:
            return
        L30:
            int r10 = r12._maximumNonEscapedChar
            goto La
        L33:
            if (r4 <= r10) goto L37
            r5 = -1
            goto L22
        L37:
            com.fasterxml.jackson.core.SerializableString r0 = r6.getEscapeSequence(r4)
            r12._currentEscape = r0
            if (r0 == 0) goto L41
            r5 = -2
            goto L22
        L41:
            int r2 = r2 + 1
            if (r2 < r13) goto L18
            goto L22
        L46:
            int r2 = r2 + 1
            char[] r1 = r12._outputBuffer
            r0 = r12
            r3 = r13
            int r11 = r0._prependOrWriteCharacterEscape(r1, r2, r3, r4, r5)
            goto L16
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeSegmentCustom(int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0020 A[EDGE_INSN: B:34:0x0020->B:12:0x0020 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringCustom(char[] r11, int r12, int r13) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r10 = this;
            int r13 = r13 + r12
            int[] r3 = r10._outputEscapes
            int r8 = r10._maximumNonEscapedChar
            r9 = 1
            if (r8 >= r9) goto L41
            r5 = 65535(0xffff, float:9.1834E-41)
        Lb:
            int r8 = r3.length
            int r9 = r5 + 1
            int r4 = java.lang.Math.min(r8, r9)
            com.fasterxml.jackson.core.io.CharacterEscapes r1 = r10._characterEscapes
            r2 = 0
        L15:
            if (r12 >= r13) goto L40
            r7 = r12
        L18:
            char r0 = r11[r12]
            if (r0 >= r4) goto L44
            r2 = r3[r0]
            if (r2 == 0) goto L52
        L20:
            int r6 = r12 - r7
            r8 = 32
            if (r6 >= r8) goto L57
            int r8 = r10._outputTail
            int r8 = r8 + r6
            int r9 = r10._outputEnd
            if (r8 <= r9) goto L30
            r10._flushBuffer()
        L30:
            if (r6 <= 0) goto L3e
            char[] r8 = r10._outputBuffer
            int r9 = r10._outputTail
            java.lang.System.arraycopy(r11, r7, r8, r9, r6)
            int r8 = r10._outputTail
            int r8 = r8 + r6
            r10._outputTail = r8
        L3e:
            if (r12 < r13) goto L60
        L40:
            return
        L41:
            int r5 = r10._maximumNonEscapedChar
            goto Lb
        L44:
            if (r0 <= r5) goto L48
            r2 = -1
            goto L20
        L48:
            com.fasterxml.jackson.core.SerializableString r8 = r1.getEscapeSequence(r0)
            r10._currentEscape = r8
            if (r8 == 0) goto L52
            r2 = -2
            goto L20
        L52:
            int r12 = r12 + 1
            if (r12 < r13) goto L18
            goto L20
        L57:
            r10._flushBuffer()
            java.io.Writer r8 = r10._writer
            r8.write(r11, r7, r6)
            goto L3e
        L60:
            int r12 = r12 + 1
            r10._appendCharacterEscape(r0, r2)
            goto L15
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringCustom(char[], int, int):void");
    }

    protected void _writeBinary(Base64Variant b64variant, byte[] input, int inputPtr, int inputEnd) throws IOException, JsonGenerationException {
        int safeInputEnd = inputEnd - 3;
        int safeOutputEnd = this._outputEnd - 6;
        int chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
        int inputPtr2 = inputPtr;
        while (inputPtr2 <= safeInputEnd) {
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr3 = inputPtr2 + 1;
            int inputPtr4 = inputPtr3 + 1;
            int inputPtr5 = inputPtr4 + 1;
            this._outputTail = b64variant.encodeBase64Chunk((((input[inputPtr2] << 8) | (input[inputPtr3] & 255)) << 8) | (input[inputPtr4] & 255), this._outputBuffer, this._outputTail);
            chunksBeforeLF--;
            if (chunksBeforeLF <= 0) {
                char[] cArr = this._outputBuffer;
                int i = this._outputTail;
                this._outputTail = i + 1;
                cArr[i] = '\\';
                char[] cArr2 = this._outputBuffer;
                int i2 = this._outputTail;
                this._outputTail = i2 + 1;
                cArr2[i2] = 'n';
                chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
            }
            inputPtr2 = inputPtr5;
        }
        int inputLeft = inputEnd - inputPtr2;
        if (inputLeft > 0) {
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr6 = inputPtr2 + 1;
            int b24 = input[inputPtr2] << 16;
            if (inputLeft == 2) {
                int i3 = inputPtr6 + 1;
                b24 |= (input[inputPtr6] & 255) << 8;
            }
            this._outputTail = b64variant.encodeBase64Partial(b24, inputLeft, this._outputBuffer, this._outputTail);
        }
    }

    protected int _writeBinary(Base64Variant b64variant, InputStream data, byte[] readBuffer, int bytesLeft) throws IOException, JsonGenerationException {
        int inputEnd;
        int amount;
        int inputPtr = 0;
        int inputEnd2 = 0;
        int lastFullOffset = -3;
        int safeOutputEnd = this._outputEnd - 6;
        int chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
        while (bytesLeft > 2) {
            if (inputPtr > lastFullOffset) {
                inputEnd2 = _readMore(data, readBuffer, inputPtr, inputEnd2, bytesLeft);
                inputPtr = 0;
                if (inputEnd2 < 3) {
                    break;
                }
                lastFullOffset = inputEnd2 - 3;
            }
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr2 = inputPtr + 1;
            int inputPtr3 = inputPtr2 + 1;
            int inputPtr4 = inputPtr3 + 1;
            bytesLeft -= 3;
            this._outputTail = b64variant.encodeBase64Chunk((((readBuffer[inputPtr] << 8) | (readBuffer[inputPtr2] & 255)) << 8) | (readBuffer[inputPtr3] & 255), this._outputBuffer, this._outputTail);
            chunksBeforeLF--;
            if (chunksBeforeLF <= 0) {
                char[] cArr = this._outputBuffer;
                int i = this._outputTail;
                this._outputTail = i + 1;
                cArr[i] = '\\';
                char[] cArr2 = this._outputBuffer;
                int i2 = this._outputTail;
                this._outputTail = i2 + 1;
                cArr2[i2] = 'n';
                chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
            }
            inputPtr = inputPtr4;
        }
        if (bytesLeft > 0 && (inputEnd = _readMore(data, readBuffer, inputPtr, inputEnd2, bytesLeft)) > 0) {
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr5 = 0 + 1;
            int b24 = readBuffer[0] << 16;
            if (inputPtr5 < inputEnd) {
                b24 |= (readBuffer[inputPtr5] & 255) << 8;
                amount = 2;
            } else {
                amount = 1;
            }
            this._outputTail = b64variant.encodeBase64Partial(b24, amount, this._outputBuffer, this._outputTail);
            return bytesLeft - amount;
        }
        return bytesLeft;
    }

    protected int _writeBinary(Base64Variant b64variant, InputStream data, byte[] readBuffer) throws IOException, JsonGenerationException {
        int inputPtr = 0;
        int inputEnd = 0;
        int lastFullOffset = -3;
        int bytesDone = 0;
        int safeOutputEnd = this._outputEnd - 6;
        int chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
        while (true) {
            if (inputPtr > lastFullOffset) {
                inputEnd = _readMore(data, readBuffer, inputPtr, inputEnd, readBuffer.length);
                inputPtr = 0;
                if (inputEnd < 3) {
                    break;
                }
                lastFullOffset = inputEnd - 3;
            }
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr2 = inputPtr + 1;
            int b24 = readBuffer[inputPtr] << 8;
            int inputPtr3 = inputPtr2 + 1;
            int inputPtr4 = inputPtr3 + 1;
            bytesDone += 3;
            this._outputTail = b64variant.encodeBase64Chunk(((b24 | (readBuffer[inputPtr2] & 255)) << 8) | (readBuffer[inputPtr3] & 255), this._outputBuffer, this._outputTail);
            chunksBeforeLF--;
            if (chunksBeforeLF <= 0) {
                char[] cArr = this._outputBuffer;
                int i = this._outputTail;
                this._outputTail = i + 1;
                cArr[i] = '\\';
                char[] cArr2 = this._outputBuffer;
                int i2 = this._outputTail;
                this._outputTail = i2 + 1;
                cArr2[i2] = 'n';
                chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
            }
            inputPtr = inputPtr4;
        }
        if (0 < inputEnd) {
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr5 = 0 + 1;
            int b242 = readBuffer[0] << 16;
            int amount = 1;
            if (inputPtr5 < inputEnd) {
                b242 |= (readBuffer[inputPtr5] & 255) << 8;
                amount = 2;
            }
            int bytesDone2 = bytesDone + amount;
            this._outputTail = b64variant.encodeBase64Partial(b242, amount, this._outputBuffer, this._outputTail);
            return bytesDone2;
        }
        return bytesDone;
    }

    private int _readMore(InputStream in, byte[] readBuffer, int inputPtr, int inputEnd, int maxRead) throws IOException {
        int i = 0;
        for (int inputPtr2 = inputPtr; inputPtr2 < inputEnd; inputPtr2++) {
            readBuffer[i] = readBuffer[inputPtr2];
            i++;
        }
        int inputEnd2 = i;
        int maxRead2 = Math.min(maxRead, readBuffer.length);
        do {
            int length = maxRead2 - inputEnd2;
            if (length == 0) {
                break;
            }
            int count = in.read(readBuffer, inputEnd2, length);
            if (count < 0) {
                return inputEnd2;
            }
            inputEnd2 += count;
        } while (inputEnd2 < 3);
        return inputEnd2;
    }

    private final void _writeNull() throws IOException {
        if (this._outputTail + 4 >= this._outputEnd) {
            _flushBuffer();
        }
        int ptr = this._outputTail;
        char[] buf = this._outputBuffer;
        buf[ptr] = 'n';
        int ptr2 = ptr + 1;
        buf[ptr2] = 'u';
        int ptr3 = ptr2 + 1;
        buf[ptr3] = 'l';
        int ptr4 = ptr3 + 1;
        buf[ptr4] = 'l';
        this._outputTail = ptr4 + 1;
    }

    private void _prependOrWriteCharacterEscape(char ch, int escCode) throws IOException, JsonGenerationException {
        String escape;
        int ptr;
        if (escCode >= 0) {
            if (this._outputTail >= 2) {
                int ptr2 = this._outputTail - 2;
                this._outputHead = ptr2;
                this._outputBuffer[ptr2] = '\\';
                this._outputBuffer[ptr2 + 1] = (char) escCode;
                return;
            }
            char[] buf = this._entityBuffer;
            if (buf == null) {
                buf = _allocateEntityBuffer();
            }
            this._outputHead = this._outputTail;
            buf[1] = (char) escCode;
            this._writer.write(buf, 0, 2);
        } else if (escCode != -2) {
            if (this._outputTail >= 6) {
                char[] buf2 = this._outputBuffer;
                int ptr3 = this._outputTail - 6;
                this._outputHead = ptr3;
                buf2[ptr3] = '\\';
                int ptr4 = ptr3 + 1;
                buf2[ptr4] = 'u';
                if (ch > 255) {
                    int hi = (ch >> '\b') & 255;
                    int ptr5 = ptr4 + 1;
                    buf2[ptr5] = HEX_CHARS[hi >> 4];
                    ptr = ptr5 + 1;
                    buf2[ptr] = HEX_CHARS[hi & 15];
                    ch = (char) (ch & 255);
                } else {
                    int ptr6 = ptr4 + 1;
                    buf2[ptr6] = '0';
                    ptr = ptr6 + 1;
                    buf2[ptr] = '0';
                }
                int ptr7 = ptr + 1;
                buf2[ptr7] = HEX_CHARS[ch >> 4];
                buf2[ptr7 + 1] = HEX_CHARS[ch & 15];
                return;
            }
            char[] buf3 = this._entityBuffer;
            if (buf3 == null) {
                buf3 = _allocateEntityBuffer();
            }
            this._outputHead = this._outputTail;
            if (ch > 255) {
                int hi2 = (ch >> '\b') & 255;
                int lo = ch & 255;
                buf3[10] = HEX_CHARS[hi2 >> 4];
                buf3[11] = HEX_CHARS[hi2 & 15];
                buf3[12] = HEX_CHARS[lo >> 4];
                buf3[13] = HEX_CHARS[lo & 15];
                this._writer.write(buf3, 8, 6);
                return;
            }
            buf3[6] = HEX_CHARS[ch >> 4];
            buf3[7] = HEX_CHARS[ch & 15];
            this._writer.write(buf3, 2, 6);
        } else {
            if (this._currentEscape == null) {
                escape = this._characterEscapes.getEscapeSequence(ch).getValue();
            } else {
                escape = this._currentEscape.getValue();
                this._currentEscape = null;
            }
            int len = escape.length();
            if (this._outputTail >= len) {
                int ptr8 = this._outputTail - len;
                this._outputHead = ptr8;
                escape.getChars(0, len, this._outputBuffer, ptr8);
                return;
            }
            this._outputHead = this._outputTail;
            this._writer.write(escape);
        }
    }

    private int _prependOrWriteCharacterEscape(char[] buffer, int ptr, int end, char ch, int escCode) throws IOException, JsonGenerationException {
        String escape;
        int ptr2;
        if (escCode >= 0) {
            if (ptr > 1 && ptr < end) {
                ptr -= 2;
                buffer[ptr] = '\\';
                buffer[ptr + 1] = (char) escCode;
            } else {
                char[] ent = this._entityBuffer;
                if (ent == null) {
                    ent = _allocateEntityBuffer();
                }
                ent[1] = (char) escCode;
                this._writer.write(ent, 0, 2);
            }
            return ptr;
        } else if (escCode != -2) {
            if (ptr > 5 && ptr < end) {
                int ptr3 = ptr - 6;
                int ptr4 = ptr3 + 1;
                buffer[ptr3] = '\\';
                int ptr5 = ptr4 + 1;
                buffer[ptr4] = 'u';
                if (ch > 255) {
                    int hi = (ch >> '\b') & 255;
                    int ptr6 = ptr5 + 1;
                    buffer[ptr5] = HEX_CHARS[hi >> 4];
                    ptr2 = ptr6 + 1;
                    buffer[ptr6] = HEX_CHARS[hi & 15];
                    ch = (char) (ch & 255);
                } else {
                    int ptr7 = ptr5 + 1;
                    buffer[ptr5] = '0';
                    ptr2 = ptr7 + 1;
                    buffer[ptr7] = '0';
                }
                int ptr8 = ptr2 + 1;
                buffer[ptr2] = HEX_CHARS[ch >> 4];
                buffer[ptr8] = HEX_CHARS[ch & 15];
                ptr = ptr8 - 5;
            } else {
                char[] ent2 = this._entityBuffer;
                if (ent2 == null) {
                    ent2 = _allocateEntityBuffer();
                }
                this._outputHead = this._outputTail;
                if (ch > 255) {
                    int hi2 = (ch >> '\b') & 255;
                    int lo = ch & 255;
                    ent2[10] = HEX_CHARS[hi2 >> 4];
                    ent2[11] = HEX_CHARS[hi2 & 15];
                    ent2[12] = HEX_CHARS[lo >> 4];
                    ent2[13] = HEX_CHARS[lo & 15];
                    this._writer.write(ent2, 8, 6);
                } else {
                    ent2[6] = HEX_CHARS[ch >> 4];
                    ent2[7] = HEX_CHARS[ch & 15];
                    this._writer.write(ent2, 2, 6);
                }
            }
            return ptr;
        } else {
            if (this._currentEscape == null) {
                escape = this._characterEscapes.getEscapeSequence(ch).getValue();
            } else {
                escape = this._currentEscape.getValue();
                this._currentEscape = null;
            }
            int len = escape.length();
            if (ptr >= len && ptr < end) {
                ptr -= len;
                escape.getChars(0, len, buffer, ptr);
            } else {
                this._writer.write(escape);
            }
            return ptr;
        }
    }

    private void _appendCharacterEscape(char ch, int escCode) throws IOException, JsonGenerationException {
        String escape;
        int ptr;
        if (escCode >= 0) {
            if (this._outputTail + 2 > this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = '\\';
            char[] cArr2 = this._outputBuffer;
            int i2 = this._outputTail;
            this._outputTail = i2 + 1;
            cArr2[i2] = (char) escCode;
        } else if (escCode != -2) {
            if (this._outputTail + 5 >= this._outputEnd) {
                _flushBuffer();
            }
            int ptr2 = this._outputTail;
            char[] buf = this._outputBuffer;
            int ptr3 = ptr2 + 1;
            buf[ptr2] = '\\';
            int ptr4 = ptr3 + 1;
            buf[ptr3] = 'u';
            if (ch > 255) {
                int hi = (ch >> '\b') & 255;
                int ptr5 = ptr4 + 1;
                buf[ptr4] = HEX_CHARS[hi >> 4];
                ptr = ptr5 + 1;
                buf[ptr5] = HEX_CHARS[hi & 15];
                ch = (char) (ch & 255);
            } else {
                int ptr6 = ptr4 + 1;
                buf[ptr4] = '0';
                ptr = ptr6 + 1;
                buf[ptr6] = '0';
            }
            int ptr7 = ptr + 1;
            buf[ptr] = HEX_CHARS[ch >> 4];
            buf[ptr7] = HEX_CHARS[ch & 15];
            this._outputTail = ptr7 + 1;
        } else {
            if (this._currentEscape == null) {
                escape = this._characterEscapes.getEscapeSequence(ch).getValue();
            } else {
                escape = this._currentEscape.getValue();
                this._currentEscape = null;
            }
            int len = escape.length();
            if (this._outputTail + len > this._outputEnd) {
                _flushBuffer();
                if (len > this._outputEnd) {
                    this._writer.write(escape);
                    return;
                }
            }
            escape.getChars(0, len, this._outputBuffer, this._outputTail);
            this._outputTail += len;
        }
    }

    private char[] _allocateEntityBuffer() {
        char[] buf = {'\\', 0, '\\', 'u', '0', '0', 0, 0, '\\', 'u'};
        this._entityBuffer = buf;
        return buf;
    }

    protected void _flushBuffer() throws IOException {
        int len = this._outputTail - this._outputHead;
        if (len > 0) {
            int offset = this._outputHead;
            this._outputHead = 0;
            this._outputTail = 0;
            this._writer.write(this._outputBuffer, offset, len);
        }
    }
}
