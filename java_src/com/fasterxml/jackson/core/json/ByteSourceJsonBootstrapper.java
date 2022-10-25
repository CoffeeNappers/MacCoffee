package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.format.InputAccessor;
import com.fasterxml.jackson.core.format.MatchStrength;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.MergedStream;
import com.fasterxml.jackson.core.io.UTF32Reader;
import com.fasterxml.jackson.core.sym.ByteQuadsCanonicalizer;
import com.fasterxml.jackson.core.sym.CharsToNameCanonicalizer;
import java.io.ByteArrayInputStream;
import java.io.CharConversionException;
import java.io.DataInput;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
/* loaded from: classes.dex */
public final class ByteSourceJsonBootstrapper {
    static final byte UTF8_BOM_1 = -17;
    static final byte UTF8_BOM_2 = -69;
    static final byte UTF8_BOM_3 = -65;
    private boolean _bigEndian;
    private final boolean _bufferRecyclable;
    private int _bytesPerChar;
    private final IOContext _context;
    private final InputStream _in;
    private final byte[] _inputBuffer;
    private int _inputEnd;
    private int _inputPtr;

    public ByteSourceJsonBootstrapper(IOContext ctxt, InputStream in) {
        this._bigEndian = true;
        this._context = ctxt;
        this._in = in;
        this._inputBuffer = ctxt.allocReadIOBuffer();
        this._inputPtr = 0;
        this._inputEnd = 0;
        this._bufferRecyclable = true;
    }

    public ByteSourceJsonBootstrapper(IOContext ctxt, byte[] inputBuffer, int inputStart, int inputLen) {
        this._bigEndian = true;
        this._context = ctxt;
        this._in = null;
        this._inputBuffer = inputBuffer;
        this._inputPtr = inputStart;
        this._inputEnd = inputStart + inputLen;
        this._bufferRecyclable = false;
    }

    public JsonEncoding detectEncoding() throws IOException {
        JsonEncoding enc;
        boolean foundEncoding = false;
        if (ensureLoaded(4)) {
            int quad = (this._inputBuffer[this._inputPtr] << 24) | ((this._inputBuffer[this._inputPtr + 1] & 255) << 16) | ((this._inputBuffer[this._inputPtr + 2] & 255) << 8) | (this._inputBuffer[this._inputPtr + 3] & 255);
            if (handleBOM(quad)) {
                foundEncoding = true;
            } else if (checkUTF32(quad)) {
                foundEncoding = true;
            } else if (checkUTF16(quad >>> 16)) {
                foundEncoding = true;
            }
        } else if (ensureLoaded(2)) {
            int i16 = ((this._inputBuffer[this._inputPtr] & 255) << 8) | (this._inputBuffer[this._inputPtr + 1] & 255);
            if (checkUTF16(i16)) {
                foundEncoding = true;
            }
        }
        if (!foundEncoding) {
            enc = JsonEncoding.UTF8;
        } else {
            switch (this._bytesPerChar) {
                case 1:
                    enc = JsonEncoding.UTF8;
                    break;
                case 2:
                    if (!this._bigEndian) {
                        enc = JsonEncoding.UTF16_LE;
                        break;
                    } else {
                        enc = JsonEncoding.UTF16_BE;
                        break;
                    }
                case 3:
                default:
                    throw new RuntimeException("Internal error");
                case 4:
                    if (!this._bigEndian) {
                        enc = JsonEncoding.UTF32_LE;
                        break;
                    } else {
                        enc = JsonEncoding.UTF32_BE;
                        break;
                    }
            }
        }
        this._context.setEncoding(enc);
        return enc;
    }

    public static int skipUTF8BOM(DataInput input) throws IOException {
        int b = input.readUnsignedByte();
        if (b != 239) {
            return b;
        }
        int b2 = input.readUnsignedByte();
        if (b2 != 187) {
            throw new IOException("Unexpected byte 0x" + Integer.toHexString(b2) + " following 0xEF; should get 0xBB as part of UTF-8 BOM");
        }
        int b3 = input.readUnsignedByte();
        if (b3 != 191) {
            throw new IOException("Unexpected byte 0x" + Integer.toHexString(b3) + " following 0xEF 0xBB; should get 0xBF as part of UTF-8 BOM");
        }
        return input.readUnsignedByte();
    }

    public Reader constructReader() throws IOException {
        InputStream in;
        JsonEncoding enc = this._context.getEncoding();
        switch (enc.bits()) {
            case 8:
            case 16:
                InputStream in2 = this._in;
                if (in2 == null) {
                    in = new ByteArrayInputStream(this._inputBuffer, this._inputPtr, this._inputEnd);
                } else {
                    in = this._inputPtr < this._inputEnd ? new MergedStream(this._context, in2, this._inputBuffer, this._inputPtr, this._inputEnd) : in2;
                }
                return new InputStreamReader(in, enc.getJavaName());
            case 32:
                return new UTF32Reader(this._context, this._in, this._inputBuffer, this._inputPtr, this._inputEnd, this._context.getEncoding().isBigEndian());
            default:
                throw new RuntimeException("Internal error");
        }
    }

    public JsonParser constructParser(int parserFeatures, ObjectCodec codec, ByteQuadsCanonicalizer rootByteSymbols, CharsToNameCanonicalizer rootCharSymbols, int factoryFeatures) throws IOException {
        JsonEncoding enc = detectEncoding();
        if (enc != JsonEncoding.UTF8 || !JsonFactory.Feature.CANONICALIZE_FIELD_NAMES.enabledIn(factoryFeatures)) {
            return new ReaderBasedJsonParser(this._context, parserFeatures, constructReader(), codec, rootCharSymbols.makeChild(factoryFeatures));
        }
        ByteQuadsCanonicalizer can = rootByteSymbols.makeChild(factoryFeatures);
        return new UTF8StreamJsonParser(this._context, parserFeatures, this._in, codec, can, this._inputBuffer, this._inputPtr, this._inputEnd, this._bufferRecyclable);
    }

    public static MatchStrength hasJSONFormat(InputAccessor acc) throws IOException {
        if (!acc.hasMoreBytes()) {
            return MatchStrength.INCONCLUSIVE;
        }
        byte b = acc.nextByte();
        if (b == -17) {
            if (!acc.hasMoreBytes()) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (acc.nextByte() != -69) {
                return MatchStrength.NO_MATCH;
            }
            if (!acc.hasMoreBytes()) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (acc.nextByte() != -65) {
                return MatchStrength.NO_MATCH;
            }
            if (!acc.hasMoreBytes()) {
                return MatchStrength.INCONCLUSIVE;
            }
            b = acc.nextByte();
        }
        int ch = skipSpace(acc, b);
        if (ch < 0) {
            return MatchStrength.INCONCLUSIVE;
        }
        if (ch == 123) {
            int ch2 = skipSpace(acc);
            if (ch2 < 0) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (ch2 == 34 || ch2 == 125) {
                return MatchStrength.SOLID_MATCH;
            }
            return MatchStrength.NO_MATCH;
        } else if (ch == 91) {
            int ch3 = skipSpace(acc);
            if (ch3 < 0) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (ch3 == 93 || ch3 == 91) {
                return MatchStrength.SOLID_MATCH;
            }
            return MatchStrength.SOLID_MATCH;
        } else {
            MatchStrength strength = MatchStrength.WEAK_MATCH;
            if (ch != 34) {
                if (ch > 57 || ch < 48) {
                    if (ch == 45) {
                        int ch4 = skipSpace(acc);
                        if (ch4 < 0) {
                            return MatchStrength.INCONCLUSIVE;
                        }
                        return (ch4 > 57 || ch4 < 48) ? MatchStrength.NO_MATCH : strength;
                    } else if (ch == 110) {
                        return tryMatch(acc, "ull", strength);
                    } else {
                        if (ch == 116) {
                            return tryMatch(acc, "rue", strength);
                        }
                        if (ch == 102) {
                            return tryMatch(acc, "alse", strength);
                        }
                        return MatchStrength.NO_MATCH;
                    }
                }
                return strength;
            }
            return strength;
        }
    }

    private static MatchStrength tryMatch(InputAccessor acc, String matchStr, MatchStrength fullMatchStrength) throws IOException {
        int len = matchStr.length();
        for (int i = 0; i < len; i++) {
            if (!acc.hasMoreBytes()) {
                MatchStrength fullMatchStrength2 = MatchStrength.INCONCLUSIVE;
                return fullMatchStrength2;
            } else if (acc.nextByte() != matchStr.charAt(i)) {
                MatchStrength fullMatchStrength3 = MatchStrength.NO_MATCH;
                return fullMatchStrength3;
            }
        }
        return fullMatchStrength;
    }

    private static int skipSpace(InputAccessor acc) throws IOException {
        if (!acc.hasMoreBytes()) {
            return -1;
        }
        return skipSpace(acc, acc.nextByte());
    }

    private static int skipSpace(InputAccessor acc, byte b) throws IOException {
        while (true) {
            int ch = b & 255;
            if (ch == 32 || ch == 13 || ch == 10 || ch == 9) {
                if (!acc.hasMoreBytes()) {
                    return -1;
                }
                b = acc.nextByte();
            } else {
                return ch;
            }
        }
    }

    private boolean handleBOM(int quad) throws IOException {
        switch (quad) {
            case -16842752:
                reportWeirdUCS4("3412");
                break;
            case -131072:
                this._inputPtr += 4;
                this._bytesPerChar = 4;
                this._bigEndian = false;
                return true;
            case 65279:
                this._bigEndian = true;
                this._inputPtr += 4;
                this._bytesPerChar = 4;
                return true;
            case 65534:
                reportWeirdUCS4("2143");
                break;
        }
        int msw = quad >>> 16;
        if (msw == 65279) {
            this._inputPtr += 2;
            this._bytesPerChar = 2;
            this._bigEndian = true;
            return true;
        } else if (msw == 65534) {
            this._inputPtr += 2;
            this._bytesPerChar = 2;
            this._bigEndian = false;
            return true;
        } else if ((quad >>> 8) != 15711167) {
            return false;
        } else {
            this._inputPtr += 3;
            this._bytesPerChar = 1;
            this._bigEndian = true;
            return true;
        }
    }

    private boolean checkUTF32(int quad) throws IOException {
        if ((quad >> 8) == 0) {
            this._bigEndian = true;
        } else if ((16777215 & quad) == 0) {
            this._bigEndian = false;
        } else if (((-16711681) & quad) == 0) {
            reportWeirdUCS4("3412");
        } else if (((-65281) & quad) != 0) {
            return false;
        } else {
            reportWeirdUCS4("2143");
        }
        this._bytesPerChar = 4;
        return true;
    }

    private boolean checkUTF16(int i16) {
        if ((65280 & i16) == 0) {
            this._bigEndian = true;
        } else if ((i16 & 255) != 0) {
            return false;
        } else {
            this._bigEndian = false;
        }
        this._bytesPerChar = 2;
        return true;
    }

    private void reportWeirdUCS4(String type) throws IOException {
        throw new CharConversionException("Unsupported UCS-4 endianness (" + type + ") detected");
    }

    protected boolean ensureLoaded(int minimum) throws IOException {
        int count;
        int gotten = this._inputEnd - this._inputPtr;
        while (gotten < minimum) {
            if (this._in == null) {
                count = -1;
            } else {
                count = this._in.read(this._inputBuffer, this._inputEnd, this._inputBuffer.length - this._inputEnd);
            }
            if (count < 1) {
                return false;
            }
            this._inputEnd += count;
            gotten += count;
        }
        return true;
    }
}
