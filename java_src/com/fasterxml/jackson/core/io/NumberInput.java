package com.fasterxml.jackson.core.io;

import java.math.BigDecimal;
/* loaded from: classes.dex */
public final class NumberInput {
    static final long L_BILLION = 1000000000;
    public static final String NASTY_SMALL_DOUBLE = "2.2250738585072012e-308";
    static final String MIN_LONG_STR_NO_SIGN = String.valueOf(Long.MIN_VALUE).substring(1);
    static final String MAX_LONG_STR = String.valueOf(Long.MAX_VALUE);

    public static int parseInt(char[] ch, int off, int len) {
        int off2;
        int off3;
        int off4;
        int off5;
        int off6;
        int num = ch[off] - '0';
        if (len > 4) {
            off = off + 1 + 1 + 1 + 1;
            num = (((((((num * 10) + (ch[off2] - '0')) * 10) + (ch[off3] - '0')) * 10) + (ch[off4] - '0')) * 10) + (ch[off] - '0');
            len -= 4;
            if (len > 4) {
                int off7 = off + 1 + 1 + 1;
                return (((((((num * 10) + (ch[off5] - '0')) * 10) + (ch[off6] - '0')) * 10) + (ch[off7] - '0')) * 10) + (ch[off7 + 1] - '0');
            }
        }
        if (len > 1) {
            int off8 = off + 1;
            num = (num * 10) + (ch[off8] - '0');
            if (len > 2) {
                int off9 = off8 + 1;
                num = (num * 10) + (ch[off9] - '0');
                if (len > 3) {
                    num = (num * 10) + (ch[off9 + 1] - '0');
                }
            }
        }
        return num;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:51:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int parseInt(java.lang.String r10) {
        /*
            r6 = 1
            r2 = 0
            r9 = 57
            r8 = 48
            char r0 = r10.charAt(r2)
            int r1 = r10.length()
            r7 = 45
            if (r0 != r7) goto L13
            r2 = r6
        L13:
            r4 = 1
            if (r2 == 0) goto L31
            if (r1 == r6) goto L1c
            r6 = 10
            if (r1 <= r6) goto L21
        L1c:
            int r3 = java.lang.Integer.parseInt(r10)
        L20:
            return r3
        L21:
            int r5 = r4 + 1
            char r0 = r10.charAt(r4)
        L27:
            if (r0 > r9) goto L2b
            if (r0 >= r8) goto L3a
        L2b:
            int r3 = java.lang.Integer.parseInt(r10)
            r4 = r5
            goto L20
        L31:
            r6 = 9
            if (r1 <= r6) goto L8b
            int r3 = java.lang.Integer.parseInt(r10)
            goto L20
        L3a:
            int r3 = r0 + (-48)
            if (r5 >= r1) goto L86
            int r4 = r5 + 1
            char r0 = r10.charAt(r5)
            if (r0 > r9) goto L48
            if (r0 >= r8) goto L4d
        L48:
            int r3 = java.lang.Integer.parseInt(r10)
            goto L20
        L4d:
            int r6 = r3 * 10
            int r7 = r0 + (-48)
            int r3 = r6 + r7
            if (r4 >= r1) goto L87
            int r5 = r4 + 1
            char r0 = r10.charAt(r4)
            if (r0 > r9) goto L5f
            if (r0 >= r8) goto L65
        L5f:
            int r3 = java.lang.Integer.parseInt(r10)
            r4 = r5
            goto L20
        L65:
            int r6 = r3 * 10
            int r7 = r0 + (-48)
            int r3 = r6 + r7
            if (r5 >= r1) goto L86
        L6d:
            r4 = r5
            int r5 = r4 + 1
            char r0 = r10.charAt(r4)
            if (r0 > r9) goto L78
            if (r0 >= r8) goto L7e
        L78:
            int r3 = java.lang.Integer.parseInt(r10)
            r4 = r5
            goto L20
        L7e:
            int r6 = r3 * 10
            int r7 = r0 + (-48)
            int r3 = r6 + r7
            if (r5 < r1) goto L6d
        L86:
            r4 = r5
        L87:
            if (r2 == 0) goto L20
            int r3 = -r3
            goto L20
        L8b:
            r5 = r4
            goto L27
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.io.NumberInput.parseInt(java.lang.String):int");
    }

    public static long parseLong(char[] ch, int off, int len) {
        int len1 = len - 9;
        long val = parseInt(ch, off, len1) * 1000000000;
        return parseInt(ch, off + len1, 9) + val;
    }

    public static long parseLong(String s) {
        int length = s.length();
        return length <= 9 ? parseInt(s) : Long.parseLong(s);
    }

    public static boolean inLongRange(char[] ch, int off, int len, boolean negative) {
        String cmpStr = negative ? MIN_LONG_STR_NO_SIGN : MAX_LONG_STR;
        int cmpLen = cmpStr.length();
        if (len < cmpLen) {
            return true;
        }
        if (len > cmpLen) {
            return false;
        }
        for (int i = 0; i < cmpLen; i++) {
            int diff = ch[off + i] - cmpStr.charAt(i);
            if (diff != 0) {
                return diff < 0;
            }
        }
        return true;
    }

    public static boolean inLongRange(String s, boolean negative) {
        String cmp = negative ? MIN_LONG_STR_NO_SIGN : MAX_LONG_STR;
        int cmpLen = cmp.length();
        int alen = s.length();
        if (alen < cmpLen) {
            return true;
        }
        if (alen > cmpLen) {
            return false;
        }
        for (int i = 0; i < cmpLen; i++) {
            int diff = s.charAt(i) - cmp.charAt(i);
            if (diff != 0) {
                return diff < 0;
            }
        }
        return true;
    }

    public static int parseAsInt(String s, int def) {
        String s2;
        int len;
        if (s != null && (len = (s2 = s.trim()).length()) != 0) {
            int i = 0;
            if (0 < len) {
                char c = s2.charAt(0);
                if (c == '+') {
                    s2 = s2.substring(1);
                    len = s2.length();
                } else if (c == '-') {
                    i = 0 + 1;
                }
            }
            while (i < len) {
                char c2 = s2.charAt(i);
                if (c2 <= '9' && c2 >= '0') {
                    i++;
                } else {
                    try {
                        return (int) parseDouble(s2);
                    } catch (NumberFormatException e) {
                        return def;
                    }
                }
            }
            try {
                return Integer.parseInt(s2);
            } catch (NumberFormatException e2) {
                return def;
            }
        }
        return def;
    }

    public static long parseAsLong(String s, long def) {
        String s2;
        int len;
        if (s != null && (len = (s2 = s.trim()).length()) != 0) {
            int i = 0;
            if (0 < len) {
                char c = s2.charAt(0);
                if (c == '+') {
                    s2 = s2.substring(1);
                    len = s2.length();
                } else if (c == '-') {
                    i = 0 + 1;
                }
            }
            while (i < len) {
                char c2 = s2.charAt(i);
                if (c2 <= '9' && c2 >= '0') {
                    i++;
                } else {
                    try {
                        return (long) parseDouble(s2);
                    } catch (NumberFormatException e) {
                        return def;
                    }
                }
            }
            try {
                return Long.parseLong(s2);
            } catch (NumberFormatException e2) {
                return def;
            }
        }
        return def;
    }

    public static double parseAsDouble(String s, double def) {
        if (s != null) {
            String s2 = s.trim();
            int len = s2.length();
            if (len != 0) {
                try {
                    return parseDouble(s2);
                } catch (NumberFormatException e) {
                    return def;
                }
            }
            return def;
        }
        return def;
    }

    public static double parseDouble(String s) throws NumberFormatException {
        if (NASTY_SMALL_DOUBLE.equals(s)) {
            return Double.MIN_VALUE;
        }
        return Double.parseDouble(s);
    }

    public static BigDecimal parseBigDecimal(String s) throws NumberFormatException {
        try {
            return new BigDecimal(s);
        } catch (NumberFormatException e) {
            throw _badBD(s);
        }
    }

    public static BigDecimal parseBigDecimal(char[] b) throws NumberFormatException {
        return parseBigDecimal(b, 0, b.length);
    }

    public static BigDecimal parseBigDecimal(char[] b, int off, int len) throws NumberFormatException {
        try {
            return new BigDecimal(b, off, len);
        } catch (NumberFormatException e) {
            throw _badBD(new String(b, off, len));
        }
    }

    private static NumberFormatException _badBD(String s) {
        return new NumberFormatException("Value \"" + s + "\" can not be represented as BigDecimal");
    }
}
