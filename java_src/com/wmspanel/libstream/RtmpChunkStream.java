package com.wmspanel.libstream;

import android.util.Log;
import com.wmspanel.libstream.i;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: classes3.dex */
public class RtmpChunkStream {
    private static final String TAG = "RtmpChunkStream";
    static final int ad = 1;
    static final int ae = 2;
    static final int af = 4;
    static final int ag = 8;
    static final int ah = 16;
    static final int ai = 32;
    static int an = 1048576;
    i ak;
    int ap;
    int aq;
    int ar;
    byte as;
    int at;
    int au;
    int av;
    int aw;
    private boolean aj = false;
    boolean al = false;
    boolean am = true;
    ByteBuffer ao = ByteBuffer.allocate(an);
    boolean ax = true;
    int ay = 0;
    boolean az = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public RtmpChunkStream(i receiver, int cs_id) {
        this.ak = receiver;
        this.aw = cs_id;
    }

    int e(int i) {
        switch (i) {
            case 0:
                return 11;
            case 1:
                return 7;
            case 2:
                return 3;
            default:
                return 0;
        }
    }

    int a(int i, int i2, int i3) {
        return (i2 + i3) - i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int c(ByteBuffer byteBuffer) {
        int i;
        int i2;
        int i3 = 2;
        int i4 = 0;
        this.ay = 0;
        if (this.am) {
            byte b = byteBuffer.get(0);
            int i5 = (b & 255) >> 6;
            int i6 = b & 255 & 63;
            if (i6 == 0) {
                i2 = 2;
            } else {
                i2 = i6 == 1 ? 3 : 1;
            }
            if (!this.al && i5 != 0) {
                Log.e(TAG, "first message for chunk stream must be fmt type 0, fmt=" + Integer.toString(i5) + ", init=" + Boolean.toString(this.al) + ", cs_id=" + Integer.toString(i6));
                return 2;
            } else if (e(i5) + i2 > byteBuffer.position()) {
                return 1;
            } else {
                i = i2 + 0;
                switch (i5) {
                    case 0:
                        int c = j.c(byteBuffer, i);
                        this.ap = c;
                        this.aq = c;
                        this.ar = j.c(byteBuffer, i + 3);
                        this.as = byteBuffer.get(i + 6);
                        this.at = j.e(byteBuffer, i + 7);
                        if (!this.al) {
                            this.al = true;
                        }
                        i += 11;
                        if (this.aq == 16777215) {
                            if (a(i, 0, byteBuffer.limit()) < 4) {
                                return 1;
                            }
                            int d = j.d(byteBuffer, i);
                            this.ap = d;
                            this.aq = d;
                            i += 4;
                        }
                        j.i(this.ao);
                        break;
                    case 1:
                        this.aq = j.c(byteBuffer, i);
                        this.ar = j.c(byteBuffer, i + 3);
                        this.as = byteBuffer.get(i + 6);
                        i += 7;
                        if (this.aq == 16777215) {
                            if (a(i, 0, byteBuffer.limit()) < 4) {
                                return 1;
                            }
                            this.aq = j.d(byteBuffer, i);
                            this.ap += this.aq;
                            i += 4;
                        } else {
                            this.ap += this.aq;
                        }
                        j.i(this.ao);
                        break;
                    case 2:
                        this.aq = j.c(byteBuffer, i);
                        i += 3;
                        if (this.aq == 16777215) {
                            if (a(i, 0, byteBuffer.limit()) < 4) {
                                return 1;
                            }
                            this.aq = j.d(byteBuffer, i);
                            i += 4;
                            this.ap += this.aq;
                            break;
                        } else {
                            this.ap += this.aq;
                            break;
                        }
                    default:
                        if (this.aq >= 16777215) {
                            if (a(i, 0, byteBuffer.limit()) < 4) {
                                return 1;
                            }
                            this.aq = j.d(byteBuffer, i);
                            i += 4;
                        }
                        if (this.ao.position() == 0) {
                            this.ap += this.aq;
                            break;
                        }
                        break;
                }
                this.au = Math.min(this.ar - this.ao.position(), this.ak.L());
                if (this.au == 0) {
                    this.am = true;
                    j.a(byteBuffer, i);
                    return 8;
                }
                this.av = 0;
                this.am = false;
            }
        } else {
            i = 0;
        }
        int min = Math.min(a(i, 0, byteBuffer.position()), this.au - this.av);
        if (min == 0) {
            j.a(byteBuffer, i - 0);
            return 1;
        }
        try {
            this.ao.put(byteBuffer.array(), i, min);
            this.av = min + this.av;
            j.a(byteBuffer, (i + min) - 0);
            if (this.au != this.av) {
                return 1;
            }
            this.am = true;
            Boolean bool = false;
            if (this.ao.position() == this.ar) {
                if (!a(bool)) {
                    if (this.aj) {
                        i3 = 34;
                    }
                    return i3;
                }
                if (!this.ax) {
                    this.ay = -1;
                    this.ax = true;
                }
                if (bool.booleanValue()) {
                    if (this.az) {
                        i4 = 16;
                    }
                    return i4 | 12;
                }
            } else if (this.ax) {
                this.ay = 1;
                this.ax = false;
            }
            return 8;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            return 2;
        }
    }

    boolean a(Boolean bool) {
        boolean z = false;
        if (this.aw == 2) {
            if (this.at == 0) {
                switch (this.as) {
                    case 1:
                        z = E();
                        break;
                    case 2:
                        break;
                    case 3:
                        z = true;
                        break;
                    case 4:
                        z = b(false);
                        break;
                    case 5:
                        z = F();
                        break;
                    case 6:
                        z = true;
                        break;
                    default:
                        z = true;
                        break;
                }
            } else {
                z = true;
            }
        } else {
            switch (this.as) {
                case 20:
                    z = d(this.ao);
                    break;
                default:
                    z = true;
                    break;
            }
        }
        j.i(this.ao);
        return z;
    }

    boolean E() {
        if (this.ar != 4) {
            return false;
        }
        int d = j.d(this.ao, 0);
        if (d > 16777215) {
            d = 16777215;
        }
        if (d < 1) {
            d = 1;
        }
        this.ak.h(d);
        return true;
    }

    boolean F() {
        if (this.ar != 4) {
            return false;
        }
        this.ak.i(j.d(this.ao, 0));
        return true;
    }

    boolean b(Boolean bool) {
        Boolean.valueOf(false);
        if (this.ar == 6 && ((this.ao.get(0) & 255) << 16) + (this.ao.get(1) & 255) == 6) {
            byte[] bArr = new byte[12];
            bArr[0] = 2;
            bArr[6] = 6;
            bArr[7] = 4;
            byte[] bArr2 = {0, 7};
            try {
                this.ak.a(bArr);
                this.ak.a(bArr2);
                this.ak.send(this.ao.array(), 2, 4);
                Boolean.valueOf(true);
                return true;
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
                return false;
            }
        }
        return true;
    }

    boolean d(ByteBuffer byteBuffer) {
        this.aj = false;
        try {
            String g = j.g(byteBuffer, 0);
            int length = g.length() + 3 + 0;
            if (g.equals("_result")) {
                try {
                    double h = j.h(byteBuffer, length);
                    int i = length + 9;
                    switch (this.ak.a(h)) {
                        case RTMP_COMMAND_RESPONSE_UNKNOWN:
                            Log.e(TAG, "unknown command _result response");
                            return false;
                        case RTMP_COMMAND_RESPONSE_CONNECT:
                            this.ak.a(h, this.at);
                            return true;
                        case RTMP_COMMAND_RESPONSE_CREATE_STREAM:
                            a(byteBuffer, i, h);
                            return true;
                        default:
                            return true;
                    }
                } catch (Exception e) {
                    Log.e(TAG, "failed to process transaction id for _result command");
                    Log.e(TAG, Log.getStackTraceString(e));
                    return false;
                }
            } else if (g.equals("onStatus")) {
                try {
                    j.h(byteBuffer, length);
                    int i2 = length + 9;
                    try {
                        j.f(byteBuffer, i2);
                        int i3 = i2 + 1;
                        j.i(byteBuffer, i3);
                        int i4 = i3 + 1;
                        boolean z = false;
                        while (true) {
                            String k = j.k(byteBuffer, i4);
                            if (k != null) {
                                int length2 = i4 + k.length() + 2;
                                if (j.j(byteBuffer, length2) != 2) {
                                    break;
                                }
                                String g2 = j.g(byteBuffer, length2);
                                i4 = length2 + g2.length() + 3;
                                if (k.equals("level") && g2.equals("error")) {
                                    z = true;
                                }
                            } else {
                                break;
                            }
                        }
                        if (z) {
                            return false;
                        }
                        if (this.ak.a(-1.0d) != i.a.RTMP_COMMAND_RESPONSE_PUBLISH) {
                            return true;
                        }
                        this.ak.a(-1.0d, this.at);
                        return true;
                    } catch (Exception e2) {
                        Log.e(TAG, Log.getStackTraceString(e2));
                        return false;
                    }
                } catch (Exception e3) {
                    Log.e(TAG, Log.getStackTraceString(e3));
                    return false;
                }
            } else if (!g.equals("_error")) {
                return true;
            } else {
                Log.e(TAG, "_error response received");
                try {
                    double h2 = j.h(byteBuffer, length);
                    int i5 = length + 9;
                    if (this.ak.a(h2) == i.a.RTMP_COMMAND_RESPONSE_CONNECT) {
                        j.f(byteBuffer, i5);
                        int i6 = i5 + 1;
                        j.i(byteBuffer, i6);
                        int i7 = i6 + 1;
                        while (true) {
                            String k2 = j.k(byteBuffer, i7);
                            if (k2 != null) {
                                int length3 = i7 + k2.length() + 2;
                                if (j.j(byteBuffer, length3) != 2) {
                                    break;
                                }
                                String g3 = j.g(byteBuffer, length3);
                                int length4 = g3.length() + 3 + length3;
                                if (k2.equals("description") && g3.contains("AccessManager.Reject")) {
                                    Log.e(TAG, "AccessManager.Reject");
                                    this.aj = true;
                                    if (!g3.contains("authmod=llnw")) {
                                        i7 = length4;
                                    } else {
                                        int indexOf = g3.indexOf("?");
                                        if (indexOf == -1) {
                                            i7 = length4;
                                        } else if (indexOf == g3.length() - 1) {
                                            i7 = length4;
                                        } else {
                                            ArrayList arrayList = new ArrayList(Arrays.asList(g3.substring(indexOf + 1).split("&")));
                                            HashMap hashMap = new HashMap();
                                            Iterator it = arrayList.iterator();
                                            while (it.hasNext()) {
                                                ArrayList arrayList2 = new ArrayList(Arrays.asList(((String) it.next()).split("=")));
                                                if (arrayList2.size() >= 2) {
                                                    hashMap.put(arrayList2.get(0), arrayList2.get(1));
                                                }
                                            }
                                            String str = (String) hashMap.get("reason");
                                            if (str == null) {
                                                i7 = length4;
                                            } else if (!str.equals("needauth")) {
                                                i7 = length4;
                                            } else {
                                                String str2 = (String) hashMap.get("nonce");
                                                if (str2 == null) {
                                                    i7 = length4;
                                                } else {
                                                    this.ak.b(str2);
                                                }
                                            }
                                        }
                                    }
                                }
                                i7 = length4;
                            } else {
                                break;
                            }
                        }
                    }
                    return false;
                } catch (Exception e4) {
                    Log.e(TAG, Log.getStackTraceString(e4));
                    return false;
                }
            }
        } catch (Exception e5) {
            Log.e(TAG, Log.getStackTraceString(e5));
            return false;
        }
    }

    boolean a(ByteBuffer byteBuffer, int i, double d) {
        try {
            j.f(byteBuffer, i);
            int i2 = i + 1;
            double h = j.h(byteBuffer, i2);
            int i3 = i2 + 9;
            this.ak.a(d, h);
            return true;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int G() {
        return this.ay;
    }
}
