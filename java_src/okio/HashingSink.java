package okio;

import io.fabric.sdk.android.services.common.CommonUtils;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
/* loaded from: classes3.dex */
public final class HashingSink extends ForwardingSink {
    private final Mac mac;
    private final MessageDigest messageDigest;

    public static HashingSink md5(Sink sink) {
        return new HashingSink(sink, CommonUtils.MD5_INSTANCE);
    }

    public static HashingSink sha1(Sink sink) {
        return new HashingSink(sink, CommonUtils.SHA1_INSTANCE);
    }

    public static HashingSink sha256(Sink sink) {
        return new HashingSink(sink, "SHA-256");
    }

    public static HashingSink hmacSha1(Sink sink, ByteString key) {
        return new HashingSink(sink, key, "HmacSHA1");
    }

    public static HashingSink hmacSha256(Sink sink, ByteString key) {
        return new HashingSink(sink, key, "HmacSHA256");
    }

    private HashingSink(Sink sink, String algorithm) {
        super(sink);
        try {
            this.messageDigest = MessageDigest.getInstance(algorithm);
            this.mac = null;
        } catch (NoSuchAlgorithmException e) {
            throw new AssertionError();
        }
    }

    private HashingSink(Sink sink, ByteString key, String algorithm) {
        super(sink);
        try {
            this.mac = Mac.getInstance(algorithm);
            this.mac.init(new SecretKeySpec(key.toByteArray(), algorithm));
            this.messageDigest = null;
        } catch (InvalidKeyException e) {
            throw new IllegalArgumentException(e);
        } catch (NoSuchAlgorithmException e2) {
            throw new AssertionError();
        }
    }

    @Override // okio.ForwardingSink, okio.Sink
    public void write(Buffer source, long byteCount) throws IOException {
        Util.checkOffsetAndCount(source.size, 0L, byteCount);
        long hashedCount = 0;
        Segment s = source.head;
        while (hashedCount < byteCount) {
            int toHash = (int) Math.min(byteCount - hashedCount, s.limit - s.pos);
            if (this.messageDigest != null) {
                this.messageDigest.update(s.data, s.pos, toHash);
            } else {
                this.mac.update(s.data, s.pos, toHash);
            }
            hashedCount += toHash;
            s = s.next;
        }
        super.write(source, byteCount);
    }

    public ByteString hash() {
        byte[] result = this.messageDigest != null ? this.messageDigest.digest() : this.mac.doFinal();
        return ByteString.of(result);
    }
}
