package com.facebook.imageutils;

import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.util.Pair;
import java.io.IOException;
import java.io.InputStream;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class WebpUtil {
    private static final String VP8L_HEADER = "VP8L";
    private static final String VP8X_HEADER = "VP8X";
    private static final String VP8_HEADER = "VP8 ";

    private WebpUtil() {
    }

    @Nullable
    public static Pair<Integer, Integer> getSize(InputStream is) {
        Pair<Integer, Integer> pair = null;
        byte[] headerBuffer = new byte[4];
        try {
            try {
                is.read(headerBuffer);
                if (compare(headerBuffer, "RIFF")) {
                    getInt(is);
                    is.read(headerBuffer);
                    if (compare(headerBuffer, "WEBP")) {
                        is.read(headerBuffer);
                        String headerAsString = getHeader(headerBuffer);
                        if (VP8_HEADER.equals(headerAsString)) {
                            pair = getVP8Dimension(is);
                            if (is != null) {
                                try {
                                    is.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                        } else if (VP8L_HEADER.equals(headerAsString)) {
                            pair = getVP8LDimension(is);
                            if (is != null) {
                                try {
                                    is.close();
                                } catch (IOException e2) {
                                    e2.printStackTrace();
                                }
                            }
                        } else if (VP8X_HEADER.equals(headerAsString)) {
                            pair = getVP8XDimension(is);
                            if (is != null) {
                                try {
                                    is.close();
                                } catch (IOException e3) {
                                    e3.printStackTrace();
                                }
                            }
                        } else if (is != null) {
                            try {
                                is.close();
                            } catch (IOException e4) {
                                e4.printStackTrace();
                            }
                        }
                    } else if (is != null) {
                        try {
                            is.close();
                        } catch (IOException e5) {
                            e5.printStackTrace();
                        }
                    }
                } else if (is != null) {
                    try {
                        is.close();
                    } catch (IOException e6) {
                        e6.printStackTrace();
                    }
                }
            } catch (Throwable th) {
                if (is != null) {
                    try {
                        is.close();
                    } catch (IOException e7) {
                        e7.printStackTrace();
                    }
                }
                throw th;
            }
        } catch (IOException e8) {
            e8.printStackTrace();
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e9) {
                    e9.printStackTrace();
                }
            }
        }
        return pair;
    }

    private static Pair<Integer, Integer> getVP8Dimension(InputStream is) throws IOException {
        is.skip(7L);
        short sign1 = getShort(is);
        short sign2 = getShort(is);
        short sign3 = getShort(is);
        if (sign1 == 157 && sign2 == 1 && sign3 == 42) {
            return new Pair<>(Integer.valueOf(get2BytesAsInt(is)), Integer.valueOf(get2BytesAsInt(is)));
        }
        return null;
    }

    private static Pair<Integer, Integer> getVP8LDimension(InputStream is) throws IOException {
        getInt(is);
        byte check = getByte(is);
        if (check != 47) {
            return null;
        }
        int data1 = ((byte) is.read()) & 255;
        int data2 = ((byte) is.read()) & 255;
        int data3 = ((byte) is.read()) & 255;
        int data4 = ((byte) is.read()) & 255;
        int width = (((data2 & 63) << 8) | data1) + 1;
        int height = (((data4 & 15) << 10) | (data3 << 2) | ((data2 & 192) >> 6)) + 1;
        return new Pair<>(Integer.valueOf(width), Integer.valueOf(height));
    }

    private static Pair<Integer, Integer> getVP8XDimension(InputStream is) throws IOException {
        is.skip(8L);
        return new Pair<>(Integer.valueOf(read3Bytes(is) + 1), Integer.valueOf(read3Bytes(is) + 1));
    }

    private static boolean compare(byte[] what, String with) {
        if (what.length != with.length()) {
            return false;
        }
        for (int i = 0; i < what.length; i++) {
            if (with.charAt(i) != what[i]) {
                return false;
            }
        }
        return true;
    }

    private static String getHeader(byte[] header) {
        StringBuilder str = new StringBuilder();
        for (byte b : header) {
            str.append((char) b);
        }
        return str.toString();
    }

    private static int getInt(InputStream is) throws IOException {
        byte byte1 = (byte) is.read();
        byte byte2 = (byte) is.read();
        byte byte3 = (byte) is.read();
        byte byte4 = (byte) is.read();
        return ((byte4 << 24) & ViewCompat.MEASURED_STATE_MASK) | ((byte3 << 16) & 16711680) | ((byte2 << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) | (byte1 & 255);
    }

    public static int get2BytesAsInt(InputStream is) throws IOException {
        byte byte1 = (byte) is.read();
        byte byte2 = (byte) is.read();
        return ((byte2 << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) | (byte1 & 255);
    }

    private static int read3Bytes(InputStream is) throws IOException {
        byte byte1 = getByte(is);
        byte byte2 = getByte(is);
        byte byte3 = getByte(is);
        return ((byte3 << 16) & 16711680) | ((byte2 << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) | (byte1 & 255);
    }

    private static short getShort(InputStream is) throws IOException {
        return (short) (is.read() & 255);
    }

    private static byte getByte(InputStream is) throws IOException {
        return (byte) (is.read() & 255);
    }

    private static boolean isBitOne(byte input, int bitIndex) {
        return ((input >> (bitIndex % 8)) & 1) == 1;
    }
}
