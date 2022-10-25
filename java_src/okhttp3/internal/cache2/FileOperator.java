package okhttp3.internal.cache2;

import android.support.v4.media.session.PlaybackStateCompat;
import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import okio.Buffer;
/* loaded from: classes3.dex */
final class FileOperator {
    private static final int BUFFER_SIZE = 8192;
    private final byte[] byteArray = new byte[8192];
    private final ByteBuffer byteBuffer = ByteBuffer.wrap(this.byteArray);
    private final FileChannel fileChannel;

    public FileOperator(FileChannel fileChannel) {
        this.fileChannel = fileChannel;
    }

    public void write(long pos, Buffer source, long byteCount) throws IOException {
        if (byteCount < 0 || byteCount > source.size()) {
            throw new IndexOutOfBoundsException();
        }
        while (byteCount > 0) {
            try {
                int toWrite = (int) Math.min((long) PlaybackStateCompat.ACTION_PLAY_FROM_URI, byteCount);
                source.read(this.byteArray, 0, toWrite);
                this.byteBuffer.limit(toWrite);
                do {
                    int bytesWritten = this.fileChannel.write(this.byteBuffer, pos);
                    pos += bytesWritten;
                } while (this.byteBuffer.hasRemaining());
                byteCount -= toWrite;
            } finally {
                this.byteBuffer.clear();
            }
        }
    }

    public void read(long pos, Buffer sink, long byteCount) throws IOException {
        if (byteCount < 0) {
            throw new IndexOutOfBoundsException();
        }
        while (byteCount > 0) {
            try {
                this.byteBuffer.limit((int) Math.min((long) PlaybackStateCompat.ACTION_PLAY_FROM_URI, byteCount));
                if (this.fileChannel.read(this.byteBuffer, pos) == -1) {
                    throw new EOFException();
                }
                int bytesRead = this.byteBuffer.position();
                sink.mo1214write(this.byteArray, 0, bytesRead);
                pos += bytesRead;
                byteCount -= bytesRead;
            } finally {
                this.byteBuffer.clear();
            }
        }
    }
}
