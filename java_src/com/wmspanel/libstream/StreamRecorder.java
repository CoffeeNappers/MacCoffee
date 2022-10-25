package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.os.Handler;
import android.util.Log;
import com.wmspanel.libstream.Streamer;
import java.io.File;
import java.io.IOException;
/* JADX INFO: Access modifiers changed from: package-private */
@TargetApi(18)
/* loaded from: classes3.dex */
public class StreamRecorder {
    private static final String TAG = "StreamRecorder";
    private BufferItem mCurrentItem;
    private Streamer.Listener mListener;
    private long mMessageIndex;
    private Streamer.MODE mMode;
    private MediaMuxer mMuxer;
    private File mOutputFile;
    private Thread mRecorderThread;
    private StreamBuffer mStreamBuffer;
    private int mAudioTrackIndex = -1;
    private int mVideoTrackIndex = -1;
    private Object mLock = new Object();
    private Streamer.RECORD_STATE mState = Streamer.RECORD_STATE.FAILED;

    /* JADX INFO: Access modifiers changed from: package-private */
    public StreamRecorder(StreamBuffer streamBuffer, Streamer.Listener listener, File file, Streamer.MODE mode) {
        if (streamBuffer == null) {
            throw new IllegalArgumentException("StreamBuffer is null");
        }
        this.mStreamBuffer = streamBuffer;
        this.mListener = listener;
        this.mMode = mode;
        this.mOutputFile = file;
        Log.d(TAG, "Mux to mp4: " + this.mOutputFile.getAbsolutePath());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean start() {
        try {
            this.mMuxer = new MediaMuxer(this.mOutputFile.toString(), 0);
            setRecordState(Streamer.RECORD_STATE.INITIALIZED);
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setRecordState(Streamer.RECORD_STATE.FAILED);
        }
        return this.mState != Streamer.RECORD_STATE.FAILED;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addAudioTrack(MediaFormat audioFormat) {
        synchronized (this.mLock) {
            if (this.mAudioTrackIndex == -1) {
                if (this.mMuxer != null) {
                    this.mAudioTrackIndex = this.mMuxer.addTrack(audioFormat);
                }
                startRecorderThread();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addVideoTrack(MediaFormat videoFormat) {
        synchronized (this.mLock) {
            if (this.mVideoTrackIndex == -1) {
                if (this.mMuxer != null) {
                    this.mVideoTrackIndex = this.mMuxer.addTrack(videoFormat);
                }
                startRecorderThread();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stop() {
        if (this.mRecorderThread != null) {
            this.mRecorderThread.interrupt();
            this.mRecorderThread = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r2v0, types: [android.media.MediaMuxer, com.wmspanel.libstream.BufferItem, com.wmspanel.libstream.StreamBuffer, java.io.File] */
    public void stopMuxer() {
        try {
            if (this.mMuxer != null) {
                this.mMuxer.stop();
                this.mMuxer.release();
            }
        } catch (IllegalStateException e) {
            if (this.mOutputFile != null) {
                this.mOutputFile.delete();
            }
            Log.e(TAG, Log.getStackTraceString(e));
        } finally {
            this.mMuxer = null;
            this.mStreamBuffer = null;
            this.mVideoTrackIndex = -1;
            this.mAudioTrackIndex = -1;
            this.mOutputFile = null;
            this.mCurrentItem = null;
            this.mMessageIndex = 0L;
            setRecordState(Streamer.RECORD_STATE.STOPPED);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0028 A[Catch: all -> 0x0021, DONT_GENERATE, TryCatch #0 {, blocks: (B:4:0x0004, B:5:0x000e, B:6:0x0011, B:10:0x0017, B:12:0x001b, B:14:0x001f, B:19:0x0024, B:21:0x0028, B:23:0x002a, B:25:0x002e), top: B:30:0x0004 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x002e A[Catch: all -> 0x0021, DONT_GENERATE, TRY_LEAVE, TryCatch #0 {, blocks: (B:4:0x0004, B:5:0x000e, B:6:0x0011, B:10:0x0017, B:12:0x001b, B:14:0x001f, B:19:0x0024, B:21:0x0028, B:23:0x002a, B:25:0x002e), top: B:30:0x0004 }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0030  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0016 A[ADDED_TO_REGION, ORIG_RETURN, RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void startRecorderThread() {
        /*
            r4 = this;
            r3 = -1
            java.lang.Object r1 = r4.mLock
            monitor-enter(r1)
            int[] r0 = com.wmspanel.libstream.StreamRecorder.AnonymousClass3.dx     // Catch: java.lang.Throwable -> L21
            com.wmspanel.libstream.Streamer$MODE r2 = r4.mMode     // Catch: java.lang.Throwable -> L21
            int r2 = r2.ordinal()     // Catch: java.lang.Throwable -> L21
            r0 = r0[r2]     // Catch: java.lang.Throwable -> L21
            switch(r0) {
                case 1: goto L17;
                case 2: goto L24;
                case 3: goto L2a;
                default: goto L11;
            }     // Catch: java.lang.Throwable -> L21
        L11:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L21
            java.lang.Thread r0 = r4.mRecorderThread
            if (r0 == 0) goto L30
        L16:
            return
        L17:
            int r0 = r4.mVideoTrackIndex     // Catch: java.lang.Throwable -> L21
            if (r0 == r3) goto L1f
            int r0 = r4.mAudioTrackIndex     // Catch: java.lang.Throwable -> L21
            if (r0 != r3) goto L24
        L1f:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L21
            goto L16
        L21:
            r0 = move-exception
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L21
            throw r0
        L24:
            int r0 = r4.mAudioTrackIndex     // Catch: java.lang.Throwable -> L21
            if (r0 != r3) goto L2a
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L21
            goto L16
        L2a:
            int r0 = r4.mVideoTrackIndex     // Catch: java.lang.Throwable -> L21
            if (r0 != r3) goto L11
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L21
            goto L16
        L30:
            android.media.MediaMuxer r0 = r4.mMuxer
            if (r0 == 0) goto L16
            com.wmspanel.libstream.StreamRecorder$1 r0 = new com.wmspanel.libstream.StreamRecorder$1
            r0.<init>()
            r4.mRecorderThread = r0
            java.lang.Thread r0 = r4.mRecorderThread
            r1 = 1
            r0.setPriority(r1)
            java.lang.Thread r0 = r4.mRecorderThread
            r0.start()
            goto L16
        */
        throw new UnsupportedOperationException("Method not decompiled: com.wmspanel.libstream.StreamRecorder.startRecorderThread():void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setRecordState(Streamer.RECORD_STATE state) {
        Handler handler;
        if (state != this.mState) {
            this.mState = state;
            if (this.mListener != null && (handler = this.mListener.getHandler()) != null) {
                handler.post(new Runnable() { // from class: com.wmspanel.libstream.StreamRecorder.2
                    @Override // java.lang.Runnable
                    public void run() {
                        StreamRecorder.this.mListener.onRecordStateChanged(StreamRecorder.this.mState);
                    }
                });
            }
        }
    }
}
