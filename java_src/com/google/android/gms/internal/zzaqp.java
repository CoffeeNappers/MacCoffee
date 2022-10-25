package com.google.android.gms.internal;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
/* loaded from: classes2.dex */
public class zzaqp implements Closeable {
    private static final char[] bro = ")]}'\n".toCharArray();
    private int[] brA;
    private long bru;
    private int brv;
    private String brw;
    private int bry;
    private String[] brz;
    private final Reader in;
    private boolean brp = false;
    private final char[] brq = new char[1024];
    private int pos = 0;
    private int limit = 0;
    private int brr = 0;
    private int brs = 0;
    private int brt = 0;
    private int[] brx = new int[32];

    static {
        zzapu.bph = new zzapu() { // from class: com.google.android.gms.internal.zzaqp.1
            @Override // com.google.android.gms.internal.zzapu
            public void zzi(zzaqp zzaqpVar) throws IOException {
                if (zzaqpVar instanceof zzaqf) {
                    ((zzaqf) zzaqpVar).bt();
                    return;
                }
                int i = zzaqpVar.brt;
                if (i == 0) {
                    i = zzaqpVar.bD();
                }
                if (i == 13) {
                    zzaqpVar.brt = 9;
                } else if (i == 12) {
                    zzaqpVar.brt = 8;
                } else if (i == 14) {
                    zzaqpVar.brt = 10;
                } else {
                    String valueOf = String.valueOf(zzaqpVar.bq());
                    int lineNumber = zzaqpVar.getLineNumber();
                    int columnNumber = zzaqpVar.getColumnNumber();
                    String path = zzaqpVar.getPath();
                    throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 70 + String.valueOf(path).length()).append("Expected a name but was ").append(valueOf).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
                }
            }
        };
    }

    public zzaqp(Reader reader) {
        this.bry = 0;
        int[] iArr = this.brx;
        int i = this.bry;
        this.bry = i + 1;
        iArr[i] = 6;
        this.brz = new String[32];
        this.brA = new int[32];
        if (reader == null) {
            throw new NullPointerException("in == null");
        }
        this.in = reader;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public int bD() throws IOException {
        int i = this.brx[this.bry - 1];
        if (i == 1) {
            this.brx[this.bry - 1] = 2;
        } else if (i == 2) {
            switch (zzdi(true)) {
                case 44:
                    break;
                case 59:
                    bI();
                    break;
                case 93:
                    this.brt = 4;
                    return 4;
                default:
                    throw zzuv("Unterminated array");
            }
        } else if (i == 3 || i == 5) {
            this.brx[this.bry - 1] = 4;
            if (i == 5) {
                switch (zzdi(true)) {
                    case 44:
                        break;
                    case 59:
                        bI();
                        break;
                    case 125:
                        this.brt = 2;
                        return 2;
                    default:
                        throw zzuv("Unterminated object");
                }
            }
            int zzdi = zzdi(true);
            switch (zzdi) {
                case 34:
                    this.brt = 13;
                    return 13;
                case 39:
                    bI();
                    this.brt = 12;
                    return 12;
                case 125:
                    if (i == 5) {
                        throw zzuv("Expected name");
                    }
                    this.brt = 2;
                    return 2;
                default:
                    bI();
                    this.pos--;
                    if (!zzc((char) zzdi)) {
                        throw zzuv("Expected name");
                    }
                    this.brt = 14;
                    return 14;
            }
        } else if (i == 4) {
            this.brx[this.bry - 1] = 5;
            switch (zzdi(true)) {
                case 58:
                    break;
                case 59:
                case 60:
                default:
                    throw zzuv("Expected ':'");
                case 61:
                    bI();
                    if ((this.pos < this.limit || zzago(1)) && this.brq[this.pos] == '>') {
                        this.pos++;
                        break;
                    }
                    break;
            }
        } else if (i == 6) {
            if (this.brp) {
                bL();
            }
            this.brx[this.bry - 1] = 7;
        } else if (i == 7) {
            if (zzdi(false) == -1) {
                this.brt = 17;
                return 17;
            }
            bI();
            this.pos--;
        } else if (i == 8) {
            throw new IllegalStateException("JsonReader is closed");
        }
        switch (zzdi(true)) {
            case 34:
                if (this.bry == 1) {
                    bI();
                }
                this.brt = 9;
                return 9;
            case 39:
                bI();
                this.brt = 8;
                return 8;
            case 44:
            case 59:
                break;
            case 91:
                this.brt = 3;
                return 3;
            case 93:
                if (i == 1) {
                    this.brt = 4;
                    return 4;
                }
                break;
            case 123:
                this.brt = 1;
                return 1;
            default:
                this.pos--;
                if (this.bry == 1) {
                    bI();
                }
                int bE = bE();
                if (bE != 0) {
                    return bE;
                }
                int bF = bF();
                if (bF != 0) {
                    return bF;
                }
                if (!zzc(this.brq[this.pos])) {
                    throw zzuv("Expected value");
                }
                bI();
                this.brt = 10;
                return 10;
        }
        if (i == 1 || i == 2) {
            bI();
            this.pos--;
            this.brt = 7;
            return 7;
        }
        throw zzuv("Unexpected value");
    }

    private int bE() throws IOException {
        String str;
        String str2;
        int i;
        char c = this.brq[this.pos];
        if (c == 't' || c == 'T') {
            str = "true";
            str2 = "TRUE";
            i = 5;
        } else if (c == 'f' || c == 'F') {
            str = "false";
            str2 = "FALSE";
            i = 6;
        } else if (c != 'n' && c != 'N') {
            return 0;
        } else {
            str = "null";
            str2 = "NULL";
            i = 7;
        }
        int length = str.length();
        for (int i2 = 1; i2 < length; i2++) {
            if (this.pos + i2 >= this.limit && !zzago(i2 + 1)) {
                return 0;
            }
            char c2 = this.brq[this.pos + i2];
            if (c2 != str.charAt(i2) && c2 != str2.charAt(i2)) {
                return 0;
            }
        }
        if ((this.pos + length < this.limit || zzago(length + 1)) && zzc(this.brq[this.pos + length])) {
            return 0;
        }
        this.pos += length;
        this.brt = i;
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:105:?, code lost:
        return 15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:?, code lost:
        return 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0021, code lost:
        if (r3 != 2) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0023, code lost:
        if (r4 == false) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0029, code lost:
        if (r6 != Long.MIN_VALUE) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x002b, code lost:
        if (r5 == false) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x002d, code lost:
        if (r5 == false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x002f, code lost:
        r15.bru = r6;
        r15.pos += r10;
        r15.brt = 15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0052, code lost:
        if (zzc(r2) == false) goto L10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0054, code lost:
        return 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x00dc, code lost:
        r6 = -r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x00e0, code lost:
        if (r3 == 2) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x00e3, code lost:
        if (r3 == 4) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x00e6, code lost:
        if (r3 != 7) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x00e8, code lost:
        r15.brv = r10;
        r15.brt = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x00f0, code lost:
        return 0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int bF() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzaqp.bF():int");
    }

    private String bG() throws IOException {
        String sb;
        StringBuilder sb2 = null;
        int i = 0;
        while (true) {
            if (this.pos + i < this.limit) {
                switch (this.brq[this.pos + i]) {
                    case '\t':
                    case '\n':
                    case '\f':
                    case '\r':
                    case ' ':
                    case ',':
                    case ':':
                    case '[':
                    case ']':
                    case '{':
                    case '}':
                        break;
                    case '#':
                    case '/':
                    case ';':
                    case '=':
                    case '\\':
                        bI();
                        break;
                    default:
                        i++;
                }
            } else if (i >= this.brq.length) {
                if (sb2 == null) {
                    sb2 = new StringBuilder();
                }
                sb2.append(this.brq, this.pos, i);
                this.pos = i + this.pos;
                if (!zzago(1)) {
                    i = 0;
                } else {
                    i = 0;
                }
            } else if (zzago(i + 1)) {
            }
        }
        if (sb2 == null) {
            sb = new String(this.brq, this.pos, i);
        } else {
            sb2.append(this.brq, this.pos, i);
            sb = sb2.toString();
        }
        this.pos = i + this.pos;
        return sb;
    }

    private void bH() throws IOException {
        do {
            int i = 0;
            while (this.pos + i < this.limit) {
                switch (this.brq[this.pos + i]) {
                    case '\t':
                    case '\n':
                    case '\f':
                    case '\r':
                    case ' ':
                    case ',':
                    case ':':
                    case '[':
                    case ']':
                    case '{':
                    case '}':
                        this.pos = i + this.pos;
                        return;
                    case '#':
                    case '/':
                    case ';':
                    case '=':
                    case '\\':
                        bI();
                        this.pos = i + this.pos;
                        return;
                    default:
                        i++;
                }
            }
            this.pos = i + this.pos;
        } while (zzago(1));
    }

    private void bI() throws IOException {
        if (!this.brp) {
            throw zzuv("Use JsonReader.setLenient(true) to accept malformed JSON");
        }
    }

    private void bJ() throws IOException {
        char c;
        do {
            if (this.pos >= this.limit && !zzago(1)) {
                return;
            }
            char[] cArr = this.brq;
            int i = this.pos;
            this.pos = i + 1;
            c = cArr[i];
            if (c == '\n') {
                this.brr++;
                this.brs = this.pos;
                return;
            }
        } while (c != '\r');
    }

    private char bK() throws IOException {
        int i;
        if (this.pos != this.limit || zzago(1)) {
            char[] cArr = this.brq;
            int i2 = this.pos;
            this.pos = i2 + 1;
            char c = cArr[i2];
            switch (c) {
                case '\n':
                    this.brr++;
                    this.brs = this.pos;
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
                    if (this.pos + 4 > this.limit && !zzago(4)) {
                        throw zzuv("Unterminated escape sequence");
                    }
                    int i3 = this.pos;
                    int i4 = i3 + 4;
                    char c2 = 0;
                    for (int i5 = i3; i5 < i4; i5++) {
                        char c3 = this.brq[i5];
                        char c4 = (char) (c2 << 4);
                        if (c3 >= '0' && c3 <= '9') {
                            i = c3 - '0';
                        } else if (c3 >= 'a' && c3 <= 'f') {
                            i = (c3 - 'a') + 10;
                        } else if (c3 < 'A' || c3 > 'F') {
                            String valueOf = String.valueOf(new String(this.brq, this.pos, 4));
                            throw new NumberFormatException(valueOf.length() != 0 ? "\\u".concat(valueOf) : new String("\\u"));
                        } else {
                            i = (c3 - 'A') + 10;
                        }
                        c2 = (char) (c4 + i);
                    }
                    this.pos += 4;
                    return c2;
                default:
                    return c;
            }
        }
        throw zzuv("Unterminated escape sequence");
    }

    private void bL() throws IOException {
        zzdi(true);
        this.pos--;
        if (this.pos + bro.length <= this.limit || zzago(bro.length)) {
            for (int i = 0; i < bro.length; i++) {
                if (this.brq[this.pos + i] != bro[i]) {
                    return;
                }
            }
            this.pos += bro.length;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getColumnNumber() {
        return (this.pos - this.brs) + 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getLineNumber() {
        return this.brr + 1;
    }

    private void zzagn(int i) {
        if (this.bry == this.brx.length) {
            int[] iArr = new int[this.bry * 2];
            int[] iArr2 = new int[this.bry * 2];
            String[] strArr = new String[this.bry * 2];
            System.arraycopy(this.brx, 0, iArr, 0, this.bry);
            System.arraycopy(this.brA, 0, iArr2, 0, this.bry);
            System.arraycopy(this.brz, 0, strArr, 0, this.bry);
            this.brx = iArr;
            this.brA = iArr2;
            this.brz = strArr;
        }
        int[] iArr3 = this.brx;
        int i2 = this.bry;
        this.bry = i2 + 1;
        iArr3[i2] = i;
    }

    private boolean zzago(int i) throws IOException {
        char[] cArr = this.brq;
        this.brs -= this.pos;
        if (this.limit != this.pos) {
            this.limit -= this.pos;
            System.arraycopy(cArr, this.pos, cArr, 0, this.limit);
        } else {
            this.limit = 0;
        }
        this.pos = 0;
        do {
            int read = this.in.read(cArr, this.limit, cArr.length - this.limit);
            if (read == -1) {
                return false;
            }
            this.limit = read + this.limit;
            if (this.brr == 0 && this.brs == 0 && this.limit > 0 && cArr[0] == 65279) {
                this.pos++;
                this.brs++;
                i++;
            }
        } while (this.limit < i);
        return true;
    }

    private boolean zzc(char c) throws IOException {
        switch (c) {
            case '\t':
            case '\n':
            case '\f':
            case '\r':
            case ' ':
            case ',':
            case ':':
            case '[':
            case ']':
            case '{':
            case '}':
                break;
            default:
                return true;
            case '#':
            case '/':
            case ';':
            case '=':
            case '\\':
                bI();
                break;
        }
        return false;
    }

    private String zzd(char c) throws IOException {
        char[] cArr = this.brq;
        StringBuilder sb = new StringBuilder();
        do {
            int i = this.pos;
            int i2 = this.limit;
            int i3 = i;
            while (i3 < i2) {
                int i4 = i3 + 1;
                char c2 = cArr[i3];
                if (c2 == c) {
                    this.pos = i4;
                    sb.append(cArr, i, (i4 - i) - 1);
                    return sb.toString();
                }
                if (c2 == '\\') {
                    this.pos = i4;
                    sb.append(cArr, i, (i4 - i) - 1);
                    sb.append(bK());
                    i = this.pos;
                    i2 = this.limit;
                    i4 = i;
                } else if (c2 == '\n') {
                    this.brr++;
                    this.brs = i4;
                }
                i3 = i4;
            }
            sb.append(cArr, i, i3 - i);
            this.pos = i3;
        } while (zzago(1));
        throw zzuv("Unterminated string");
    }

    private int zzdi(boolean z) throws IOException {
        char[] cArr = this.brq;
        int i = this.pos;
        int i2 = this.limit;
        while (true) {
            if (i == i2) {
                this.pos = i;
                if (!zzago(1)) {
                    if (!z) {
                        return -1;
                    }
                    String valueOf = String.valueOf("End of input at line ");
                    throw new EOFException(new StringBuilder(String.valueOf(valueOf).length() + 30).append(valueOf).append(getLineNumber()).append(" column ").append(getColumnNumber()).toString());
                }
                i = this.pos;
                i2 = this.limit;
            }
            int i3 = i + 1;
            char c = cArr[i];
            if (c == '\n') {
                this.brr++;
                this.brs = i3;
                i = i3;
            } else if (c == ' ' || c == '\r') {
                i = i3;
            } else if (c == '\t') {
                i = i3;
            } else if (c == '/') {
                this.pos = i3;
                if (i3 == i2) {
                    this.pos--;
                    boolean zzago = zzago(2);
                    this.pos++;
                    if (!zzago) {
                        return c;
                    }
                }
                bI();
                switch (cArr[this.pos]) {
                    case '*':
                        this.pos++;
                        if (!zzuu("*/")) {
                            throw zzuv("Unterminated comment");
                        }
                        i = this.pos + 2;
                        i2 = this.limit;
                        continue;
                    case '/':
                        this.pos++;
                        bJ();
                        i = this.pos;
                        i2 = this.limit;
                        continue;
                    default:
                        return c;
                }
            } else if (c != '#') {
                this.pos = i3;
                return c;
            } else {
                this.pos = i3;
                bI();
                bJ();
                i = this.pos;
                i2 = this.limit;
            }
        }
    }

    private void zze(char c) throws IOException {
        char[] cArr = this.brq;
        do {
            int i = this.pos;
            int i2 = this.limit;
            int i3 = i;
            while (i3 < i2) {
                int i4 = i3 + 1;
                char c2 = cArr[i3];
                if (c2 == c) {
                    this.pos = i4;
                    return;
                }
                if (c2 == '\\') {
                    this.pos = i4;
                    bK();
                    i4 = this.pos;
                    i2 = this.limit;
                } else if (c2 == '\n') {
                    this.brr++;
                    this.brs = i4;
                }
                i3 = i4;
            }
            this.pos = i3;
        } while (zzago(1));
        throw zzuv("Unterminated string");
    }

    private boolean zzuu(String str) throws IOException {
        while (true) {
            if (this.pos + str.length() <= this.limit || zzago(str.length())) {
                if (this.brq[this.pos] != '\n') {
                    for (int i = 0; i < str.length(); i++) {
                        if (this.brq[this.pos + i] == str.charAt(i)) {
                        }
                    }
                    return true;
                }
                this.brr++;
                this.brs = this.pos + 1;
                this.pos++;
            } else {
                return false;
            }
        }
    }

    private IOException zzuv(String str) throws IOException {
        int lineNumber = getLineNumber();
        int columnNumber = getColumnNumber();
        String path = getPath();
        throw new zzaqs(new StringBuilder(String.valueOf(str).length() + 45 + String.valueOf(path).length()).append(str).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
    }

    public void beginArray() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 3) {
            zzagn(1);
            this.brA[this.bry - 1] = 0;
            this.brt = 0;
            return;
        }
        String valueOf = String.valueOf(bq());
        int lineNumber = getLineNumber();
        int columnNumber = getColumnNumber();
        String path = getPath();
        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 74 + String.valueOf(path).length()).append("Expected BEGIN_ARRAY but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
    }

    public void beginObject() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 1) {
            zzagn(3);
            this.brt = 0;
            return;
        }
        String valueOf = String.valueOf(bq());
        int lineNumber = getLineNumber();
        int columnNumber = getColumnNumber();
        String path = getPath();
        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 75 + String.valueOf(path).length()).append("Expected BEGIN_OBJECT but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
    }

    public zzaqq bq() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        switch (i) {
            case 1:
                return zzaqq.BEGIN_OBJECT;
            case 2:
                return zzaqq.END_OBJECT;
            case 3:
                return zzaqq.BEGIN_ARRAY;
            case 4:
                return zzaqq.END_ARRAY;
            case 5:
            case 6:
                return zzaqq.BOOLEAN;
            case 7:
                return zzaqq.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return zzaqq.STRING;
            case 12:
            case 13:
            case 14:
                return zzaqq.NAME;
            case 15:
            case 16:
                return zzaqq.NUMBER;
            case 17:
                return zzaqq.END_DOCUMENT;
            default:
                throw new AssertionError();
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.brt = 0;
        this.brx[0] = 8;
        this.bry = 1;
        this.in.close();
    }

    public void endArray() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i != 4) {
            String valueOf = String.valueOf(bq());
            int lineNumber = getLineNumber();
            int columnNumber = getColumnNumber();
            String path = getPath();
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 72 + String.valueOf(path).length()).append("Expected END_ARRAY but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
        }
        this.bry--;
        int[] iArr = this.brA;
        int i2 = this.bry - 1;
        iArr[i2] = iArr[i2] + 1;
        this.brt = 0;
    }

    public void endObject() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i != 2) {
            String valueOf = String.valueOf(bq());
            int lineNumber = getLineNumber();
            int columnNumber = getColumnNumber();
            String path = getPath();
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 73 + String.valueOf(path).length()).append("Expected END_OBJECT but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
        }
        this.bry--;
        this.brz[this.bry] = null;
        int[] iArr = this.brA;
        int i2 = this.bry - 1;
        iArr[i2] = iArr[i2] + 1;
        this.brt = 0;
    }

    public String getPath() {
        StringBuilder append = new StringBuilder().append('$');
        int i = this.bry;
        for (int i2 = 0; i2 < i; i2++) {
            switch (this.brx[i2]) {
                case 1:
                case 2:
                    append.append('[').append(this.brA[i2]).append(']');
                    break;
                case 3:
                case 4:
                case 5:
                    append.append('.');
                    if (this.brz[i2] != null) {
                        append.append(this.brz[i2]);
                        break;
                    } else {
                        break;
                    }
            }
        }
        return append.toString();
    }

    public boolean hasNext() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        return (i == 2 || i == 4) ? false : true;
    }

    public final boolean isLenient() {
        return this.brp;
    }

    public boolean nextBoolean() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 5) {
            this.brt = 0;
            int[] iArr = this.brA;
            int i2 = this.bry - 1;
            iArr[i2] = iArr[i2] + 1;
            return true;
        } else if (i == 6) {
            this.brt = 0;
            int[] iArr2 = this.brA;
            int i3 = this.bry - 1;
            iArr2[i3] = iArr2[i3] + 1;
            return false;
        } else {
            String valueOf = String.valueOf(bq());
            int lineNumber = getLineNumber();
            int columnNumber = getColumnNumber();
            String path = getPath();
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 72 + String.valueOf(path).length()).append("Expected a boolean but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
        }
    }

    public double nextDouble() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 15) {
            this.brt = 0;
            int[] iArr = this.brA;
            int i2 = this.bry - 1;
            iArr[i2] = iArr[i2] + 1;
            return this.bru;
        }
        if (i == 16) {
            this.brw = new String(this.brq, this.pos, this.brv);
            this.pos += this.brv;
        } else if (i == 8 || i == 9) {
            this.brw = zzd(i == 8 ? '\'' : '\"');
        } else if (i == 10) {
            this.brw = bG();
        } else if (i != 11) {
            String valueOf = String.valueOf(bq());
            int lineNumber = getLineNumber();
            int columnNumber = getColumnNumber();
            String path = getPath();
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 71 + String.valueOf(path).length()).append("Expected a double but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
        }
        this.brt = 11;
        double parseDouble = Double.parseDouble(this.brw);
        if (!this.brp && (Double.isNaN(parseDouble) || Double.isInfinite(parseDouble))) {
            int lineNumber2 = getLineNumber();
            int columnNumber2 = getColumnNumber();
            String path2 = getPath();
            throw new zzaqs(new StringBuilder(String.valueOf(path2).length() + 102).append("JSON forbids NaN and infinities: ").append(parseDouble).append(" at line ").append(lineNumber2).append(" column ").append(columnNumber2).append(" path ").append(path2).toString());
        }
        this.brw = null;
        this.brt = 0;
        int[] iArr2 = this.brA;
        int i3 = this.bry - 1;
        iArr2[i3] = iArr2[i3] + 1;
        return parseDouble;
    }

    public int nextInt() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 15) {
            int i2 = (int) this.bru;
            if (this.bru != i2) {
                long j = this.bru;
                int lineNumber = getLineNumber();
                int columnNumber = getColumnNumber();
                String path = getPath();
                throw new NumberFormatException(new StringBuilder(String.valueOf(path).length() + 89).append("Expected an int but was ").append(j).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
            }
            this.brt = 0;
            int[] iArr = this.brA;
            int i3 = this.bry - 1;
            iArr[i3] = iArr[i3] + 1;
            return i2;
        }
        if (i == 16) {
            this.brw = new String(this.brq, this.pos, this.brv);
            this.pos += this.brv;
        } else if (i != 8 && i != 9) {
            String valueOf = String.valueOf(bq());
            int lineNumber2 = getLineNumber();
            int columnNumber2 = getColumnNumber();
            String path2 = getPath();
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 69 + String.valueOf(path2).length()).append("Expected an int but was ").append(valueOf).append(" at line ").append(lineNumber2).append(" column ").append(columnNumber2).append(" path ").append(path2).toString());
        } else {
            this.brw = zzd(i == 8 ? '\'' : '\"');
            try {
                int parseInt = Integer.parseInt(this.brw);
                this.brt = 0;
                int[] iArr2 = this.brA;
                int i4 = this.bry - 1;
                iArr2[i4] = iArr2[i4] + 1;
                return parseInt;
            } catch (NumberFormatException e) {
            }
        }
        this.brt = 11;
        double parseDouble = Double.parseDouble(this.brw);
        int i5 = (int) parseDouble;
        if (i5 != parseDouble) {
            String str = this.brw;
            int lineNumber3 = getLineNumber();
            int columnNumber3 = getColumnNumber();
            String path3 = getPath();
            throw new NumberFormatException(new StringBuilder(String.valueOf(str).length() + 69 + String.valueOf(path3).length()).append("Expected an int but was ").append(str).append(" at line ").append(lineNumber3).append(" column ").append(columnNumber3).append(" path ").append(path3).toString());
        }
        this.brw = null;
        this.brt = 0;
        int[] iArr3 = this.brA;
        int i6 = this.bry - 1;
        iArr3[i6] = iArr3[i6] + 1;
        return i5;
    }

    public long nextLong() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 15) {
            this.brt = 0;
            int[] iArr = this.brA;
            int i2 = this.bry - 1;
            iArr[i2] = iArr[i2] + 1;
            return this.bru;
        }
        if (i == 16) {
            this.brw = new String(this.brq, this.pos, this.brv);
            this.pos += this.brv;
        } else if (i != 8 && i != 9) {
            String valueOf = String.valueOf(bq());
            int lineNumber = getLineNumber();
            int columnNumber = getColumnNumber();
            String path = getPath();
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 69 + String.valueOf(path).length()).append("Expected a long but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
        } else {
            this.brw = zzd(i == 8 ? '\'' : '\"');
            try {
                long parseLong = Long.parseLong(this.brw);
                this.brt = 0;
                int[] iArr2 = this.brA;
                int i3 = this.bry - 1;
                iArr2[i3] = iArr2[i3] + 1;
                return parseLong;
            } catch (NumberFormatException e) {
            }
        }
        this.brt = 11;
        double parseDouble = Double.parseDouble(this.brw);
        long j = (long) parseDouble;
        if (j != parseDouble) {
            String str = this.brw;
            int lineNumber2 = getLineNumber();
            int columnNumber2 = getColumnNumber();
            String path2 = getPath();
            throw new NumberFormatException(new StringBuilder(String.valueOf(str).length() + 69 + String.valueOf(path2).length()).append("Expected a long but was ").append(str).append(" at line ").append(lineNumber2).append(" column ").append(columnNumber2).append(" path ").append(path2).toString());
        }
        this.brw = null;
        this.brt = 0;
        int[] iArr3 = this.brA;
        int i4 = this.bry - 1;
        iArr3[i4] = iArr3[i4] + 1;
        return j;
    }

    public String nextName() throws IOException {
        String zzd;
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 14) {
            zzd = bG();
        } else if (i == 12) {
            zzd = zzd('\'');
        } else if (i != 13) {
            String valueOf = String.valueOf(bq());
            int lineNumber = getLineNumber();
            int columnNumber = getColumnNumber();
            String path = getPath();
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 69 + String.valueOf(path).length()).append("Expected a name but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
        } else {
            zzd = zzd('\"');
        }
        this.brt = 0;
        this.brz[this.bry - 1] = zzd;
        return zzd;
    }

    public void nextNull() throws IOException {
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 7) {
            this.brt = 0;
            int[] iArr = this.brA;
            int i2 = this.bry - 1;
            iArr[i2] = iArr[i2] + 1;
            return;
        }
        String valueOf = String.valueOf(bq());
        int lineNumber = getLineNumber();
        int columnNumber = getColumnNumber();
        String path = getPath();
        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 67 + String.valueOf(path).length()).append("Expected null but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
    }

    public String nextString() throws IOException {
        String str;
        int i = this.brt;
        if (i == 0) {
            i = bD();
        }
        if (i == 10) {
            str = bG();
        } else if (i == 8) {
            str = zzd('\'');
        } else if (i == 9) {
            str = zzd('\"');
        } else if (i == 11) {
            str = this.brw;
            this.brw = null;
        } else if (i == 15) {
            str = Long.toString(this.bru);
        } else if (i != 16) {
            String valueOf = String.valueOf(bq());
            int lineNumber = getLineNumber();
            int columnNumber = getColumnNumber();
            String path = getPath();
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 71 + String.valueOf(path).length()).append("Expected a string but was ").append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(columnNumber).append(" path ").append(path).toString());
        } else {
            str = new String(this.brq, this.pos, this.brv);
            this.pos += this.brv;
        }
        this.brt = 0;
        int[] iArr = this.brA;
        int i2 = this.bry - 1;
        iArr[i2] = iArr[i2] + 1;
        return str;
    }

    public final void setLenient(boolean z) {
        this.brp = z;
    }

    public void skipValue() throws IOException {
        int i = 0;
        do {
            int i2 = this.brt;
            if (i2 == 0) {
                i2 = bD();
            }
            if (i2 == 3) {
                zzagn(1);
                i++;
            } else if (i2 == 1) {
                zzagn(3);
                i++;
            } else if (i2 == 4) {
                this.bry--;
                i--;
            } else if (i2 == 2) {
                this.bry--;
                i--;
            } else if (i2 == 14 || i2 == 10) {
                bH();
            } else if (i2 == 8 || i2 == 12) {
                zze('\'');
            } else if (i2 == 9 || i2 == 13) {
                zze('\"');
            } else if (i2 == 16) {
                this.pos += this.brv;
            }
            this.brt = 0;
        } while (i != 0);
        int[] iArr = this.brA;
        int i3 = this.bry - 1;
        iArr[i3] = iArr[i3] + 1;
        this.brz[this.bry - 1] = "null";
    }

    public String toString() {
        String valueOf = String.valueOf(getClass().getSimpleName());
        int lineNumber = getLineNumber();
        return new StringBuilder(String.valueOf(valueOf).length() + 39).append(valueOf).append(" at line ").append(lineNumber).append(" column ").append(getColumnNumber()).toString();
    }
}
