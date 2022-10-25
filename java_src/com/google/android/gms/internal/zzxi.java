package com.google.android.gms.internal;

import android.net.Uri;
import android.text.TextUtils;
import com.facebook.common.util.UriUtil;
import com.vk.media.camera.CameraUtilsEffects;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class zzxi {
    private static final String TAG = zzxi.class.getSimpleName();
    private static final char[] aCH = "0123456789ABCDEF".toCharArray();
    private static final Pattern aCI = Pattern.compile("/\\.\\.");
    private static final Pattern aCJ = Pattern.compile("0[1-7][0-7]*");
    private static final Pattern aCK = Pattern.compile("0x[0-9a-f]*", 2);
    private static final Pattern aCL = Pattern.compile("^((?:0x[0-9a-f]+|[0-9\\\\.])+)$", 2);
    private final String aCM;
    private final String aCN;
    private final int aCO;
    private final String mPath;
    private final String zzae;
    private final String zzapy;

    /* loaded from: classes2.dex */
    private static class zza {
        private static final String[] aCP = {UriUtil.HTTP_SCHEME, UriUtil.HTTPS_SCHEME, "ftp"};
        private final String aCM;
        private final Uri aCQ;
        private final URI aCR;
        private final Boolean aCS;
        private final Integer aCT;
        private final String gl;

        private zza(String str) {
            this.gl = str;
            this.aCQ = Uri.parse(this.gl);
            try {
                new URI(this.gl);
            } catch (URISyntaxException e) {
            } finally {
                this.aCR = null;
            }
            this.aCM = getScheme();
            this.aCS = Boolean.valueOf(zzccw());
            this.aCT = Integer.valueOf(zzccv());
        }

        /* JADX INFO: Access modifiers changed from: private */
        public int getPort() {
            return this.aCT.intValue();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getScheme() {
            if (this.aCM != null) {
                return this.aCM;
            }
            String scheme = this.aCQ != null ? this.aCQ.getScheme() : null;
            if (TextUtils.isEmpty(scheme)) {
            }
            if (TextUtils.isEmpty(scheme) && !TextUtils.isEmpty(this.gl)) {
                int indexOf = this.gl.indexOf(":");
                if (indexOf != -1) {
                    String lowerCase = this.gl.substring(0, indexOf).toLowerCase(Locale.US);
                    if (zzom(lowerCase)) {
                        scheme = lowerCase;
                    }
                }
                if (TextUtils.isEmpty(scheme)) {
                    scheme = this.gl.startsWith("www.") ? UriUtil.HTTP_SCHEME : UriUtil.HTTP_SCHEME;
                }
            }
            if (scheme == null) {
                return null;
            }
            return scheme.toLowerCase(Locale.US);
        }

        private int zzccv() {
            int port;
            if (this.aCT != null) {
                return this.aCT.intValue();
            }
            if (this.aCQ != null && (port = this.aCQ.getPort()) != -1) {
                return port;
            }
            return -1;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean zzccw() {
            return this.aCS != null ? this.aCS.booleanValue() : zzom(this.aCM);
        }

        private static boolean zzom(String str) {
            if (TextUtils.isEmpty(str)) {
                return false;
            }
            for (int i = 0; i < aCP.length; i++) {
                if (aCP[i].equals(str)) {
                    return true;
                }
            }
            return false;
        }
    }

    public zzxi(String str) {
        String str2;
        if (!zzoi(str)) {
            this.zzae = null;
            this.aCM = null;
            this.aCN = null;
            this.aCO = -1;
            this.mPath = null;
            this.zzapy = null;
            return;
        }
        String replaceAll = str.replaceAll("^\\s+", "").replaceAll("\\s+$", "").replaceAll("[\\t\\n\\r]", "");
        int indexOf = replaceAll.indexOf(35);
        replaceAll = indexOf != -1 ? replaceAll.substring(0, indexOf) : replaceAll;
        zza zzaVar = new zza(replaceAll);
        if (!zzaVar.zzccw()) {
            this.zzae = null;
            this.aCM = null;
            this.aCN = null;
            this.aCO = -1;
            this.mPath = null;
            this.zzapy = null;
            return;
        }
        this.aCM = zzaVar.getScheme();
        this.aCO = zzaVar.getPort();
        if (this.aCM != null) {
            String str3 = this.aCM;
            replaceAll = replaceAll.replaceAll(new StringBuilder(String.valueOf(str3).length() + 2).append("^").append(str3).append(":").toString(), "");
        }
        String zzok = zzok(replaceAll.replaceAll("^/+", ""));
        int indexOf2 = zzok.indexOf(63);
        if (indexOf2 != -1) {
            int i = indexOf2 + 1;
            str2 = i < zzok.length() ? zzok.substring(i) : "";
            zzok = zzok.substring(0, indexOf2);
        } else {
            str2 = null;
        }
        String zzoe = zzoe(zzok);
        if (TextUtils.isEmpty(zzoe)) {
            this.zzae = null;
            this.aCN = null;
            this.mPath = null;
            this.zzapy = null;
            return;
        }
        String zzoh = zzoh(zzok);
        this.aCN = zzoj(zzoe);
        this.mPath = zzoj(zzoh);
        this.zzapy = !TextUtils.isEmpty(str2) ? zzoj(str2) : str2;
        this.zzae = zzok;
    }

    private static boolean isHexDigit(char c) {
        return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'F') || (c >= 'a' && c <= 'f');
    }

    private static final void zza(Exception exc) {
    }

    private static Byte zzc(byte[] bArr, int i) {
        if (i + 2 < bArr.length && ((char) (bArr[i] & 255)) == '%') {
            char c = (char) (bArr[i + 1] & 255);
            char c2 = (char) (bArr[i + 2] & 255);
            if (isHexDigit(c) && isHexDigit(c2)) {
                return Byte.valueOf((byte) ((Integer.parseInt(new StringBuilder(1).append(c).toString(), 16) * 16) + Integer.parseInt(new StringBuilder(1).append(c2).toString(), 16)));
            }
            return null;
        }
        return null;
    }

    private List<String> zzcct() {
        if (TextUtils.isEmpty(this.aCN)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        char[] charArray = this.aCN.toCharArray();
        boolean z = false;
        for (int length = charArray.length - 2; length > 0 && arrayList.size() < 4; length--) {
            if (charArray[length] == '.') {
                if (z) {
                    arrayList.add(this.aCN.substring(length + 1));
                } else {
                    z = true;
                }
            }
        }
        arrayList.add(this.aCN);
        return arrayList;
    }

    private List<String> zzccu() {
        if (TextUtils.isEmpty(this.mPath)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        char[] charArray = this.mPath.toCharArray();
        for (int i = 0; i < charArray.length && arrayList.size() < 4; i++) {
            if (charArray[i] == '/') {
                arrayList.add(this.mPath.substring(0, i + 1));
            }
        }
        if (!arrayList.isEmpty() && !((String) arrayList.get(arrayList.size() - 1)).equals(this.mPath)) {
            arrayList.add(this.mPath);
        }
        if (!TextUtils.isEmpty(this.zzapy)) {
            String str = this.mPath;
            String str2 = this.zzapy;
            arrayList.add(new StringBuilder(String.valueOf(str).length() + 1 + String.valueOf(str2).length()).append(str).append("?").append(str2).toString());
        }
        return arrayList;
    }

    private String zzoe(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        int indexOf = str.indexOf(47);
        if (indexOf != -1) {
            str = str.substring(0, indexOf);
        }
        int indexOf2 = str.indexOf(64);
        if (indexOf2 != -1) {
            str = str.substring(indexOf2 + 1);
        }
        if (this.aCO != -1) {
            str = str.replaceAll(new StringBuilder(13).append(":").append(this.aCO).append("$").toString(), "");
        }
        String replaceAll = str.replaceAll("^\\.*", "").replaceAll("\\.*$", "").replaceAll("\\.+", ".");
        String zzof = zzof(replaceAll);
        if (zzof == null) {
            zzof = replaceAll;
        }
        return zzof.toLowerCase(Locale.getDefault());
    }

    private static String zzof(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        String replaceAll = str.replaceAll("^\\[", "").replaceAll("\\]$", "");
        if (zzxg.zznw(replaceAll)) {
            String zza2 = zzxg.zza(zzxg.zzod(replaceAll));
            return zza2.contains(":") ? String.format("[%s]", zza2) : zza2;
        } else if (TextUtils.isDigitsOnly(str)) {
            String zzog = zzog(str);
            if (TextUtils.isEmpty(zzog)) {
                return null;
            }
            return zzog;
        } else if (!aCL.matcher(replaceAll).find()) {
            return null;
        } else {
            Matcher matcher = aCJ.matcher(replaceAll);
            StringBuffer stringBuffer = new StringBuffer();
            while (matcher.find()) {
                matcher.appendReplacement(stringBuffer, new StringBuilder(11).append(Integer.parseInt(matcher.group(), 8)).toString());
            }
            matcher.appendTail(stringBuffer);
            Matcher matcher2 = aCK.matcher(stringBuffer.toString());
            StringBuffer stringBuffer2 = new StringBuffer();
            while (matcher2.find()) {
                matcher2.appendReplacement(stringBuffer2, new StringBuilder(11).append(Integer.parseInt(matcher2.group().substring(2), 16)).toString());
            }
            matcher2.appendTail(stringBuffer2);
            String stringBuffer3 = stringBuffer2.toString();
            return stringBuffer3.contains(":") ? String.format("[%s]", stringBuffer3) : stringBuffer3;
        }
    }

    private static String zzog(String str) {
        byte[] bArr;
        int i = 0;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            BigInteger bigInteger = new BigInteger(str);
            byte[] byteArray = bigInteger.toByteArray();
            if (byteArray.length < 4) {
                return null;
            }
            byte[] copyOfRange = Arrays.copyOfRange(byteArray, byteArray.length - 4, byteArray.length);
            if (bigInteger.equals(new BigInteger(new byte[]{0, copyOfRange[0], copyOfRange[1], copyOfRange[2], copyOfRange[3]}))) {
                return Inet4Address.getByAddress(copyOfRange).getHostAddress();
            }
            if (byteArray.length >= 16) {
                bArr = Arrays.copyOfRange(byteArray, byteArray.length - 16, byteArray.length);
            } else {
                bArr = new byte[16];
                int length = 16 - byteArray.length;
                int i2 = 1;
                int i3 = 0;
                while (i2 <= length) {
                    bArr[i3] = 0;
                    i2++;
                    i3++;
                }
                while (i < byteArray.length) {
                    int i4 = i3 + 1;
                    bArr[i3] = byteArray[i];
                    i++;
                    i3 = i4;
                }
            }
            return String.format("[%s]", Inet6Address.getByAddress(bArr).getHostAddress());
        } catch (ArrayIndexOutOfBoundsException e) {
            zza(e);
            return null;
        } catch (NumberFormatException e2) {
            zza(e2);
            return null;
        } catch (UnknownHostException e3) {
            zza(e3);
            return null;
        }
    }

    private String zzoh(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        int indexOf = str.indexOf(47);
        String replaceAll = (indexOf != -1 ? str.substring(indexOf) : CameraUtilsEffects.FILE_DELIM).replaceAll("/\\./", CameraUtilsEffects.FILE_DELIM).replaceAll("/\\.$", CameraUtilsEffects.FILE_DELIM);
        if (aCI.matcher(replaceAll).find()) {
            try {
                replaceAll = new URI(this.aCM, "host", replaceAll, null).normalize().getRawPath();
            } catch (URISyntaxException e) {
            }
        }
        return replaceAll.replaceAll("/+", CameraUtilsEffects.FILE_DELIM);
    }

    private static boolean zzoi(String str) {
        return !TextUtils.isEmpty(str);
    }

    private static String zzoj(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            byte[] bytes = str.getBytes("UTF-8");
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                char c = (char) (b & 255);
                if (c <= ' ' || c > '~' || c == '#' || c == '%') {
                    sb.append("%");
                    sb.append(aCH[c >>> 4]);
                    sb.append(aCH[c & 15]);
                } else {
                    sb.append(c);
                }
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    private static String zzok(String str) {
        String str2;
        Object obj = null;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        int i = 0;
        while (true) {
            str2 = str;
            if (str2.equals(obj) || i >= 1024) {
                break;
            }
            str = zzol(str2);
            i++;
            obj = str2;
        }
        return str2;
    }

    private static String zzol(String str) {
        try {
            byte[] bytes = str.replace("\\x", "%").getBytes("UTF-8");
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(bytes.length);
            int i = 0;
            while (i < bytes.length) {
                byte b = bytes[i];
                if (((char) (b & 255)) >= 128) {
                    byteArrayOutputStream.write(b);
                } else {
                    Byte zzc = zzc(bytes, i);
                    if (zzc != null) {
                        byteArrayOutputStream.write(zzc.byteValue());
                        i += 2;
                    } else {
                        byteArrayOutputStream.write(b);
                    }
                }
                i++;
            }
            try {
                return new String(byteArrayOutputStream.toByteArray(), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                return null;
            }
        } catch (UnsupportedEncodingException e2) {
            return null;
        }
    }

    public List<String> zzccr() {
        List<String> zzcct;
        List<String> zzccu;
        if (TextUtils.isEmpty(this.zzae)) {
            return null;
        }
        String zzof = zzof(this.aCN);
        if (zzof != null) {
            zzcct = new ArrayList<>();
            zzcct.add(zzof);
        } else {
            zzcct = zzcct();
        }
        if (zzcct == null || zzcct.isEmpty() || (zzccu = zzccu()) == null || zzccu.isEmpty()) {
            return null;
        }
        LinkedList linkedList = new LinkedList();
        for (String str : zzcct) {
            for (String str2 : zzccu) {
                String valueOf = String.valueOf(str);
                String valueOf2 = String.valueOf(str2);
                linkedList.add(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
            }
        }
        return !linkedList.isEmpty() ? linkedList : null;
    }

    public List<zzxf> zzccs() {
        MessageDigest messageDigest;
        List<String> zzccr = zzccr();
        if (zzccr == null || zzccr.isEmpty()) {
            return null;
        }
        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            zza(e);
            messageDigest = null;
        }
        if (messageDigest == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(zzccr.size());
        for (String str : zzccr) {
            if (!TextUtils.isEmpty(str)) {
                try {
                    arrayList.add(new zzxf(messageDigest.digest(str.getBytes("UTF-8"))));
                } catch (UnsupportedEncodingException e2) {
                    zza(e2);
                }
                messageDigest.reset();
            }
        }
        return !arrayList.isEmpty() ? arrayList : null;
    }
}
