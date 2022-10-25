package com.vkontakte.android.audio.player.exo;

import android.net.Uri;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DataSpec;
import com.google.android.exoplayer2.upstream.TransferListener;
import com.vkontakte.android.audio.utils.Utils;
import java.io.EOFException;
import java.io.IOException;
import java.io.RandomAccessFile;
/* loaded from: classes2.dex */
final class AudioFileDataSource implements DataSource {
    private long bytesRemaining;
    private RandomAccessFile file;
    private final TransferListener<? super AudioFileDataSource> listener;
    private boolean opened;
    private Uri uri;

    /* loaded from: classes2.dex */
    private static class FileDataSourceException extends IOException {
        FileDataSourceException(IOException cause) {
            super(cause);
        }
    }

    public AudioFileDataSource() {
        this(null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AudioFileDataSource(TransferListener<? super AudioFileDataSource> listener) {
        this.listener = listener;
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public long open(DataSpec dataSpec) throws FileDataSourceException {
        try {
            this.uri = Uri.parse(AudioCacheHelper.getPlayedUrlFromUrl(dataSpec.uri));
            this.file = new RandomAccessFile(this.uri.getPath(), "r");
            this.file.seek(dataSpec.position);
            this.bytesRemaining = dataSpec.length == -1 ? this.file.length() - dataSpec.position : dataSpec.length;
            if (this.bytesRemaining < 0) {
                throw new EOFException();
            }
            this.opened = true;
            if (this.listener != null) {
                this.listener.onTransferStart(this, dataSpec);
            }
            return this.bytesRemaining;
        } catch (IOException e) {
            throw new FileDataSourceException(e);
        }
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public int read(byte[] buffer, int offset, int readLength) throws FileDataSourceException {
        if (readLength == 0) {
            return 0;
        }
        if (this.bytesRemaining == 0) {
            return -1;
        }
        try {
            long filePointer = this.file.getFilePointer();
            int bytesRead = this.file.read(buffer, offset, (int) Math.min(this.bytesRemaining, readLength));
            Utils.doXor(buffer, offset, bytesRead, filePointer);
            if (bytesRead > 0) {
                this.bytesRemaining -= bytesRead;
                if (this.listener != null) {
                    this.listener.onBytesTransferred(this, bytesRead);
                    return bytesRead;
                }
                return bytesRead;
            }
            return bytesRead;
        } catch (IOException e) {
            throw new FileDataSourceException(e);
        }
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public Uri getUri() {
        return this.uri;
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource
    public void close() throws FileDataSourceException {
        boolean z;
        this.uri = null;
        try {
            try {
                if (this.file != null) {
                    this.file.close();
                }
                if (!z) {
                    return;
                }
            } catch (IOException e) {
                throw new FileDataSourceException(e);
            }
        } finally {
            this.file = null;
            if (this.opened) {
                this.opened = false;
                if (this.listener != null) {
                    this.listener.onTransferEnd(this);
                }
            }
        }
    }
}
