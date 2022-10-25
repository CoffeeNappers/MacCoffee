package com.fasterxml.jackson.core.io;

import android.support.v4.media.TransportMediator;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.exoplayer2.C;
import io.sentry.connection.AbstractConnection;
/* loaded from: classes.dex */
public final class NumberOutput {
    private static final String[] sSmallIntStrs;
    private static final String[] sSmallIntStrs2;
    private static int MILLION = 1000000;
    private static int BILLION = 1000000000;
    private static long BILLION_L = C.NANOS_PER_SECOND;
    private static long MIN_INT_AS_LONG = -2147483648L;
    private static long MAX_INT_AS_LONG = 2147483647L;
    static final String SMALLEST_INT = String.valueOf(Integer.MIN_VALUE);
    static final String SMALLEST_LONG = String.valueOf(Long.MIN_VALUE);
    private static final int[] TRIPLET_TO_CHARS = new int[1000];

    static {
        int fullIx = 0;
        for (int i1 = 0; i1 < 10; i1++) {
            int i2 = 0;
            while (i2 < 10) {
                int i3 = 0;
                int fullIx2 = fullIx;
                while (i3 < 10) {
                    int enc = ((i1 + 48) << 16) | ((i2 + 48) << 8) | (i3 + 48);
                    TRIPLET_TO_CHARS[fullIx2] = enc;
                    i3++;
                    fullIx2++;
                }
                i2++;
                fullIx = fullIx2;
            }
        }
        sSmallIntStrs = new String[]{AppEventsConstants.EVENT_PARAM_VALUE_NO, AppEventsConstants.EVENT_PARAM_VALUE_YES, "2", "3", "4", "5", AbstractConnection.SENTRY_PROTOCOL_VERSION, "7", "8", "9", "10"};
        sSmallIntStrs2 = new String[]{"-1", "-2", "-3", "-4", "-5", "-6", "-7", "-8", "-9", "-10"};
    }

    public static int outputInt(int v, char[] b, int off) {
        int off2;
        if (v < 0) {
            if (v == Integer.MIN_VALUE) {
                return _outputSmallestI(b, off);
            }
            b[off] = '-';
            v = -v;
            off++;
        }
        if (v < MILLION) {
            if (v < 1000) {
                if (v < 10) {
                    b[off] = (char) (v + 48);
                    return off + 1;
                }
                return _leading3(v, b, off);
            }
            int thousands = v / 1000;
            return _full3(v - (thousands * 1000), b, _leading3(thousands, b, off));
        } else if (v >= BILLION) {
            int v2 = v - BILLION;
            if (v2 >= BILLION) {
                v2 -= BILLION;
                b[off] = '2';
                off2 = off + 1;
            } else {
                b[off] = '1';
                off2 = off + 1;
            }
            return _outputFullBillion(v2, b, off2);
        } else {
            int newValue = v / 1000;
            int ones = v - (newValue * 1000);
            int newValue2 = newValue / 1000;
            return _full3(ones, b, _full3(newValue - (newValue2 * 1000), b, _leading3(newValue2, b, off)));
        }
    }

    public static int outputInt(int v, byte[] b, int off) {
        int off2;
        int off3;
        if (v < 0) {
            if (v == Integer.MIN_VALUE) {
                return _outputSmallestI(b, off);
            }
            b[off] = 45;
            v = -v;
            off++;
        }
        if (v < MILLION) {
            if (v < 1000) {
                if (v < 10) {
                    b[off] = (byte) (v + 48);
                    off3 = off + 1;
                } else {
                    off3 = _leading3(v, b, off);
                }
            } else {
                int thousands = v / 1000;
                off3 = _full3(v - (thousands * 1000), b, _leading3(thousands, b, off));
            }
            return off3;
        } else if (v >= BILLION) {
            int v2 = v - BILLION;
            if (v2 >= BILLION) {
                v2 -= BILLION;
                b[off] = 50;
                off2 = off + 1;
            } else {
                b[off] = 49;
                off2 = off + 1;
            }
            return _outputFullBillion(v2, b, off2);
        } else {
            int newValue = v / 1000;
            int ones = v - (newValue * 1000);
            int newValue2 = newValue / 1000;
            return _full3(ones, b, _full3(newValue - (newValue2 * 1000), b, _leading3(newValue2, b, off)));
        }
    }

    public static int outputLong(long v, char[] b, int off) {
        int off2;
        if (v < 0) {
            if (v > MIN_INT_AS_LONG) {
                return outputInt((int) v, b, off);
            }
            if (v == Long.MIN_VALUE) {
                return _outputSmallestL(b, off);
            }
            b[off] = '-';
            v = -v;
            off++;
        } else if (v <= MAX_INT_AS_LONG) {
            return outputInt((int) v, b, off);
        }
        long upper = v / BILLION_L;
        long v2 = v - (BILLION_L * upper);
        if (upper < BILLION_L) {
            off2 = _outputUptoBillion((int) upper, b, off);
        } else {
            long hi = upper / BILLION_L;
            off2 = _outputFullBillion((int) (upper - (BILLION_L * hi)), b, _leading3((int) hi, b, off));
        }
        return _outputFullBillion((int) v2, b, off2);
    }

    public static int outputLong(long v, byte[] b, int off) {
        int off2;
        if (v < 0) {
            if (v > MIN_INT_AS_LONG) {
                return outputInt((int) v, b, off);
            }
            if (v == Long.MIN_VALUE) {
                return _outputSmallestL(b, off);
            }
            b[off] = 45;
            v = -v;
            off++;
        } else if (v <= MAX_INT_AS_LONG) {
            return outputInt((int) v, b, off);
        }
        long upper = v / BILLION_L;
        long v2 = v - (BILLION_L * upper);
        if (upper < BILLION_L) {
            off2 = _outputUptoBillion((int) upper, b, off);
        } else {
            long hi = upper / BILLION_L;
            off2 = _outputFullBillion((int) (upper - (BILLION_L * hi)), b, _leading3((int) hi, b, off));
        }
        return _outputFullBillion((int) v2, b, off2);
    }

    public static String toString(int v) {
        if (v < sSmallIntStrs.length) {
            if (v >= 0) {
                return sSmallIntStrs[v];
            }
            int v2 = (-v) - 1;
            if (v2 < sSmallIntStrs2.length) {
                return sSmallIntStrs2[v2];
            }
        }
        return Integer.toString(v);
    }

    public static String toString(long v) {
        return (v > 2147483647L || v < -2147483648L) ? Long.toString(v) : toString((int) v);
    }

    public static String toString(double v) {
        return Double.toString(v);
    }

    public static String toString(float v) {
        return Float.toString(v);
    }

    private static int _outputUptoBillion(int v, char[] b, int off) {
        if (v < MILLION) {
            if (v < 1000) {
                return _leading3(v, b, off);
            }
            int thousands = v / 1000;
            int ones = v - (thousands * 1000);
            return _outputUptoMillion(b, off, thousands, ones);
        }
        int thousands2 = v / 1000;
        int ones2 = v - (thousands2 * 1000);
        int millions = thousands2 / 1000;
        int off2 = _leading3(millions, b, off);
        int enc = TRIPLET_TO_CHARS[thousands2 - (millions * 1000)];
        int off3 = off2 + 1;
        b[off2] = (char) (enc >> 16);
        int off4 = off3 + 1;
        b[off3] = (char) ((enc >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int off5 = off4 + 1;
        b[off4] = (char) (enc & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int enc2 = TRIPLET_TO_CHARS[ones2];
        int off6 = off5 + 1;
        b[off5] = (char) (enc2 >> 16);
        int off7 = off6 + 1;
        b[off6] = (char) ((enc2 >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int off8 = off7 + 1;
        b[off7] = (char) (enc2 & TransportMediator.KEYCODE_MEDIA_PAUSE);
        return off8;
    }

    private static int _outputFullBillion(int v, char[] b, int off) {
        int thousands = v / 1000;
        int ones = v - (thousands * 1000);
        int millions = thousands / 1000;
        int enc = TRIPLET_TO_CHARS[millions];
        int off2 = off + 1;
        b[off] = (char) (enc >> 16);
        int off3 = off2 + 1;
        b[off2] = (char) ((enc >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int off4 = off3 + 1;
        b[off3] = (char) (enc & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int enc2 = TRIPLET_TO_CHARS[thousands - (millions * 1000)];
        int off5 = off4 + 1;
        b[off4] = (char) (enc2 >> 16);
        int off6 = off5 + 1;
        b[off5] = (char) ((enc2 >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int off7 = off6 + 1;
        b[off6] = (char) (enc2 & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int enc3 = TRIPLET_TO_CHARS[ones];
        int off8 = off7 + 1;
        b[off7] = (char) (enc3 >> 16);
        int off9 = off8 + 1;
        b[off8] = (char) ((enc3 >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int off10 = off9 + 1;
        b[off9] = (char) (enc3 & TransportMediator.KEYCODE_MEDIA_PAUSE);
        return off10;
    }

    private static int _outputUptoBillion(int v, byte[] b, int off) {
        if (v < MILLION) {
            if (v < 1000) {
                return _leading3(v, b, off);
            }
            int thousands = v / 1000;
            int ones = v - (thousands * 1000);
            return _outputUptoMillion(b, off, thousands, ones);
        }
        int thousands2 = v / 1000;
        int ones2 = v - (thousands2 * 1000);
        int millions = thousands2 / 1000;
        int off2 = _leading3(millions, b, off);
        int enc = TRIPLET_TO_CHARS[thousands2 - (millions * 1000)];
        int off3 = off2 + 1;
        b[off2] = (byte) (enc >> 16);
        int off4 = off3 + 1;
        b[off3] = (byte) (enc >> 8);
        int off5 = off4 + 1;
        b[off4] = (byte) enc;
        int enc2 = TRIPLET_TO_CHARS[ones2];
        int off6 = off5 + 1;
        b[off5] = (byte) (enc2 >> 16);
        int off7 = off6 + 1;
        b[off6] = (byte) (enc2 >> 8);
        int off8 = off7 + 1;
        b[off7] = (byte) enc2;
        return off8;
    }

    private static int _outputFullBillion(int v, byte[] b, int off) {
        int thousands = v / 1000;
        int ones = v - (thousands * 1000);
        int millions = thousands / 1000;
        int enc = TRIPLET_TO_CHARS[millions];
        int off2 = off + 1;
        b[off] = (byte) (enc >> 16);
        int off3 = off2 + 1;
        b[off2] = (byte) (enc >> 8);
        int off4 = off3 + 1;
        b[off3] = (byte) enc;
        int enc2 = TRIPLET_TO_CHARS[thousands - (millions * 1000)];
        int off5 = off4 + 1;
        b[off4] = (byte) (enc2 >> 16);
        int off6 = off5 + 1;
        b[off5] = (byte) (enc2 >> 8);
        int off7 = off6 + 1;
        b[off6] = (byte) enc2;
        int enc3 = TRIPLET_TO_CHARS[ones];
        int off8 = off7 + 1;
        b[off7] = (byte) (enc3 >> 16);
        int off9 = off8 + 1;
        b[off8] = (byte) (enc3 >> 8);
        int off10 = off9 + 1;
        b[off9] = (byte) enc3;
        return off10;
    }

    private static int _outputUptoMillion(char[] b, int off, int thousands, int ones) {
        int enc = TRIPLET_TO_CHARS[thousands];
        if (thousands > 9) {
            if (thousands > 99) {
                b[off] = (char) (enc >> 16);
                off++;
            }
            b[off] = (char) ((enc >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
            off++;
        }
        int off2 = off + 1;
        b[off] = (char) (enc & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int enc2 = TRIPLET_TO_CHARS[ones];
        int off3 = off2 + 1;
        b[off2] = (char) (enc2 >> 16);
        int off4 = off3 + 1;
        b[off3] = (char) ((enc2 >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int off5 = off4 + 1;
        b[off4] = (char) (enc2 & TransportMediator.KEYCODE_MEDIA_PAUSE);
        return off5;
    }

    private static int _outputUptoMillion(byte[] b, int off, int thousands, int ones) {
        int enc = TRIPLET_TO_CHARS[thousands];
        if (thousands > 9) {
            if (thousands > 99) {
                b[off] = (byte) (enc >> 16);
                off++;
            }
            b[off] = (byte) (enc >> 8);
            off++;
        }
        int off2 = off + 1;
        b[off] = (byte) enc;
        int enc2 = TRIPLET_TO_CHARS[ones];
        int off3 = off2 + 1;
        b[off2] = (byte) (enc2 >> 16);
        int off4 = off3 + 1;
        b[off3] = (byte) (enc2 >> 8);
        int off5 = off4 + 1;
        b[off4] = (byte) enc2;
        return off5;
    }

    private static int _leading3(int t, char[] b, int off) {
        int enc = TRIPLET_TO_CHARS[t];
        if (t > 9) {
            if (t > 99) {
                b[off] = (char) (enc >> 16);
                off++;
            }
            b[off] = (char) ((enc >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
            off++;
        }
        int off2 = off + 1;
        b[off] = (char) (enc & TransportMediator.KEYCODE_MEDIA_PAUSE);
        return off2;
    }

    private static int _leading3(int t, byte[] b, int off) {
        int enc = TRIPLET_TO_CHARS[t];
        if (t > 9) {
            if (t > 99) {
                b[off] = (byte) (enc >> 16);
                off++;
            }
            b[off] = (byte) (enc >> 8);
            off++;
        }
        int off2 = off + 1;
        b[off] = (byte) enc;
        return off2;
    }

    private static int _full3(int t, char[] b, int off) {
        int enc = TRIPLET_TO_CHARS[t];
        int off2 = off + 1;
        b[off] = (char) (enc >> 16);
        int off3 = off2 + 1;
        b[off2] = (char) ((enc >> 8) & TransportMediator.KEYCODE_MEDIA_PAUSE);
        int off4 = off3 + 1;
        b[off3] = (char) (enc & TransportMediator.KEYCODE_MEDIA_PAUSE);
        return off4;
    }

    private static int _full3(int t, byte[] b, int off) {
        int enc = TRIPLET_TO_CHARS[t];
        int off2 = off + 1;
        b[off] = (byte) (enc >> 16);
        int off3 = off2 + 1;
        b[off2] = (byte) (enc >> 8);
        int off4 = off3 + 1;
        b[off3] = (byte) enc;
        return off4;
    }

    private static int _outputSmallestL(char[] b, int off) {
        int len = SMALLEST_LONG.length();
        SMALLEST_LONG.getChars(0, len, b, off);
        return off + len;
    }

    private static int _outputSmallestL(byte[] b, int off) {
        int len = SMALLEST_LONG.length();
        int i = 0;
        int off2 = off;
        while (i < len) {
            b[off2] = (byte) SMALLEST_LONG.charAt(i);
            i++;
            off2++;
        }
        return off2;
    }

    private static int _outputSmallestI(char[] b, int off) {
        int len = SMALLEST_INT.length();
        SMALLEST_INT.getChars(0, len, b, off);
        return off + len;
    }

    private static int _outputSmallestI(byte[] b, int off) {
        int len = SMALLEST_INT.length();
        int i = 0;
        int off2 = off;
        while (i < len) {
            b[off2] = (byte) SMALLEST_INT.charAt(i);
            i++;
            off2++;
        }
        return off2;
    }
}
