package com.wmspanel.libstream;

import android.util.Log;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes3.dex */
class n {
    private static final String TAG = "RtspParser";
    private static final Pattern da = Pattern.compile("RTSP\\/1.0\\s+(\\d\\d\\d)\\s+(.+)");
    private static final Pattern db = Pattern.compile("(\\S+):\\s+(.*)");
    private int dc;
    private String dd;
    private a de = a.INTERLEAVED;
    private int df = 0;
    private Boolean dg = false;
    private HashMap<String, String> dh = new HashMap<>();

    /* loaded from: classes3.dex */
    enum a {
        INTERLEAVED,
        STATUS_LINE,
        HDR_LINE,
        BODY
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Boolean aa() {
        return this.dg;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int ab() {
        return this.dc;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String d(String str) {
        return this.dh.get(str.toUpperCase());
    }

    Boolean e(String str) {
        Matcher matcher = da.matcher(str);
        if (!matcher.find()) {
            return false;
        }
        this.dc = Integer.parseInt(matcher.group(1));
        Log.d(TAG, "status_code=" + this.dc);
        this.dd = matcher.group(2);
        Log.d(TAG, "status_text=" + this.dd);
        return true;
    }

    Boolean f(String str) {
        Matcher matcher = db.matcher(str);
        if (!matcher.find()) {
            return false;
        }
        String trim = matcher.group(1).trim();
        String trim2 = matcher.group(2).trim();
        if (trim.equalsIgnoreCase("Content-length")) {
            this.df = Integer.parseInt(trim2);
            Log.d(TAG, "content_length_=" + this.df);
        } else if (trim.equalsIgnoreCase("WWW-Authenticate")) {
            int indexOf = trim2.indexOf(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            if (-1 != indexOf) {
                String substring = trim2.substring(0, indexOf);
                String trim3 = trim2.substring(indexOf + 1).trim();
                if (substring.equalsIgnoreCase("Digest")) {
                    a("WWW-Authenticate-Digest", trim3);
                } else if (substring.equalsIgnoreCase("Basic")) {
                    a("WWW-Authenticate-Basic", trim3);
                } else {
                    Log.d(TAG, "unsupported auth scheme=" + substring);
                    return true;
                }
            }
        } else {
            Log.d(TAG, trim + ": " + trim2);
            this.dh.put(trim.toUpperCase(), trim2);
        }
        return true;
    }

    private void a(String str, String str2) {
        String[] split;
        for (String str3 : str2.split(",")) {
            int indexOf = str3.indexOf("=");
            if (indexOf != -1) {
                String trim = str3.substring(0, indexOf).trim();
                if (trim.length() != 0) {
                    this.dh.put((str + "-" + trim).toUpperCase().toUpperCase(), str3.substring(indexOf + 1).replace("\"", "").trim());
                }
            }
        }
    }

    int a(byte[] bArr, int i, int i2, StringBuilder sb) {
        Boolean bool = false;
        while (i < i2) {
            if (bool.booleanValue() && bArr[i] == 10) {
                return sb.length() + 2;
            }
            bool = false;
            if (bArr[i] == 13) {
                bool = true;
            } else {
                sb.append((char) bArr[i]);
            }
            i++;
        }
        return -1;
    }

    public int b(byte[] bArr, int i) {
        int i2 = 0;
        while (i > 0) {
            switch (this.de) {
                case INTERLEAVED:
                    this.dc = -1;
                    this.dd = "";
                    this.dh.clear();
                    this.df = 0;
                    if (i >= 4) {
                        if (bArr[i2] == 82 && bArr[i2 + 1] == 84 && bArr[i2 + 2] == 83 && bArr[i2 + 3] == 80) {
                            this.de = a.STATUS_LINE;
                            break;
                        } else {
                            return i2;
                        }
                    } else {
                        return 0;
                    }
                case STATUS_LINE:
                    StringBuilder sb = new StringBuilder();
                    int a2 = a(bArr, i2, i, sb);
                    if (-1 != a2) {
                        i2 += a2;
                        if (!e(sb.toString()).booleanValue()) {
                            Log.e(TAG, "unable to parse status line: " + ((Object) sb));
                            this.de = a.INTERLEAVED;
                            return -1;
                        }
                        this.de = a.HDR_LINE;
                        break;
                    } else {
                        return i2;
                    }
                case HDR_LINE:
                    StringBuilder sb2 = new StringBuilder();
                    int a3 = a(bArr, i2, i, sb2);
                    if (-1 != a3) {
                        i2 += a3;
                        if (sb2.length() > 0) {
                            if (f(sb2.toString()).booleanValue()) {
                                break;
                            } else {
                                Log.e(TAG, "unable to parse header line: " + ((Object) sb2));
                                this.de = a.INTERLEAVED;
                                return -1;
                            }
                        } else if (this.df > 0) {
                            this.de = a.BODY;
                            break;
                        } else {
                            this.dg = true;
                            this.de = a.INTERLEAVED;
                            return i2;
                        }
                    } else {
                        return i2;
                    }
                case BODY:
                    if (i >= this.df) {
                        int i3 = i2 + this.df;
                        this.dg = true;
                        this.de = a.INTERLEAVED;
                        return i3;
                    }
                    return i2;
            }
        }
        return 0;
    }
}
