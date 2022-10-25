package okio;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
/* loaded from: classes3.dex */
public interface BufferedSink extends Sink {
    Buffer buffer();

    BufferedSink emit() throws IOException;

    /* renamed from: emitCompleteSegments */
    BufferedSink mo1211emitCompleteSegments() throws IOException;

    @Override // okio.Sink, java.io.Flushable
    void flush() throws IOException;

    OutputStream outputStream();

    /* renamed from: write */
    BufferedSink mo1212write(ByteString byteString) throws IOException;

    BufferedSink write(Source source, long j) throws IOException;

    /* renamed from: write */
    BufferedSink mo1213write(byte[] bArr) throws IOException;

    /* renamed from: write */
    BufferedSink mo1214write(byte[] bArr, int i, int i2) throws IOException;

    long writeAll(Source source) throws IOException;

    /* renamed from: writeByte */
    BufferedSink mo1215writeByte(int i) throws IOException;

    /* renamed from: writeDecimalLong */
    BufferedSink mo1216writeDecimalLong(long j) throws IOException;

    /* renamed from: writeHexadecimalUnsignedLong */
    BufferedSink mo1217writeHexadecimalUnsignedLong(long j) throws IOException;

    /* renamed from: writeInt */
    BufferedSink mo1218writeInt(int i) throws IOException;

    /* renamed from: writeIntLe */
    BufferedSink mo1219writeIntLe(int i) throws IOException;

    /* renamed from: writeLong */
    BufferedSink mo1220writeLong(long j) throws IOException;

    /* renamed from: writeLongLe */
    BufferedSink mo1221writeLongLe(long j) throws IOException;

    /* renamed from: writeShort */
    BufferedSink mo1222writeShort(int i) throws IOException;

    /* renamed from: writeShortLe */
    BufferedSink mo1223writeShortLe(int i) throws IOException;

    /* renamed from: writeString */
    BufferedSink mo1224writeString(String str, int i, int i2, Charset charset) throws IOException;

    /* renamed from: writeString */
    BufferedSink mo1225writeString(String str, Charset charset) throws IOException;

    /* renamed from: writeUtf8 */
    BufferedSink mo1226writeUtf8(String str) throws IOException;

    /* renamed from: writeUtf8 */
    BufferedSink mo1227writeUtf8(String str, int i, int i2) throws IOException;

    /* renamed from: writeUtf8CodePoint */
    BufferedSink mo1228writeUtf8CodePoint(int i) throws IOException;
}
