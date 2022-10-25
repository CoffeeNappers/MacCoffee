package com.google.android.exoplayer2.decoder;

import com.google.android.exoplayer2.decoder.DecoderInputBuffer;
import com.google.android.exoplayer2.decoder.OutputBuffer;
import com.google.android.exoplayer2.util.Assertions;
import java.lang.Exception;
import java.util.LinkedList;
/* loaded from: classes.dex */
public abstract class SimpleDecoder<I extends DecoderInputBuffer, O extends OutputBuffer, E extends Exception> implements Decoder<I, O, E> {
    private int availableInputBufferCount;
    private final I[] availableInputBuffers;
    private int availableOutputBufferCount;
    private final O[] availableOutputBuffers;
    private final Thread decodeThread;
    private I dequeuedInputBuffer;
    private E exception;
    private boolean flushed;
    private final Object lock = new Object();
    private final LinkedList<I> queuedInputBuffers = new LinkedList<>();
    private final LinkedList<O> queuedOutputBuffers = new LinkedList<>();
    private boolean released;
    private int skippedOutputBufferCount;

    protected abstract I createInputBuffer();

    protected abstract O createOutputBuffer();

    protected abstract E decode(I i, O o, boolean z);

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.android.exoplayer2.decoder.Decoder
    public /* bridge */ /* synthetic */ void queueInputBuffer(Object obj) throws Exception {
        queueInputBuffer((SimpleDecoder<I, O, E>) ((DecoderInputBuffer) obj));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public SimpleDecoder(I[] inputBuffers, O[] outputBuffers) {
        this.availableInputBuffers = inputBuffers;
        this.availableInputBufferCount = inputBuffers.length;
        for (int i = 0; i < this.availableInputBufferCount; i++) {
            this.availableInputBuffers[i] = createInputBuffer();
        }
        this.availableOutputBuffers = outputBuffers;
        this.availableOutputBufferCount = outputBuffers.length;
        for (int i2 = 0; i2 < this.availableOutputBufferCount; i2++) {
            this.availableOutputBuffers[i2] = createOutputBuffer();
        }
        this.decodeThread = new Thread() { // from class: com.google.android.exoplayer2.decoder.SimpleDecoder.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                SimpleDecoder.this.run();
            }
        };
        this.decodeThread.start();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void setInitialInputBufferSize(int size) {
        I[] iArr;
        Assertions.checkState(this.availableInputBufferCount == this.availableInputBuffers.length);
        for (I inputBuffer : this.availableInputBuffers) {
            inputBuffer.ensureSpaceForWrite(size);
        }
    }

    @Override // com.google.android.exoplayer2.decoder.Decoder
    /* renamed from: dequeueInputBuffer */
    public final I mo369dequeueInputBuffer() throws Exception {
        I i;
        I i2;
        synchronized (this.lock) {
            maybeThrowException();
            Assertions.checkState(this.dequeuedInputBuffer == null);
            if (this.availableInputBufferCount == 0) {
                i = null;
            } else {
                I[] iArr = this.availableInputBuffers;
                int i3 = this.availableInputBufferCount - 1;
                this.availableInputBufferCount = i3;
                i = iArr[i3];
            }
            this.dequeuedInputBuffer = i;
            i2 = this.dequeuedInputBuffer;
        }
        return i2;
    }

    public final void queueInputBuffer(I inputBuffer) throws Exception {
        synchronized (this.lock) {
            maybeThrowException();
            Assertions.checkArgument(inputBuffer == this.dequeuedInputBuffer);
            this.queuedInputBuffers.addLast(inputBuffer);
            maybeNotifyDecodeLoop();
            this.dequeuedInputBuffer = null;
        }
    }

    @Override // com.google.android.exoplayer2.decoder.Decoder
    /* renamed from: dequeueOutputBuffer */
    public final O mo370dequeueOutputBuffer() throws Exception {
        O removeFirst;
        synchronized (this.lock) {
            maybeThrowException();
            removeFirst = this.queuedOutputBuffers.isEmpty() ? null : this.queuedOutputBuffers.removeFirst();
        }
        return removeFirst;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void releaseOutputBuffer(O outputBuffer) {
        synchronized (this.lock) {
            releaseOutputBufferInternal(outputBuffer);
            maybeNotifyDecodeLoop();
        }
    }

    @Override // com.google.android.exoplayer2.decoder.Decoder
    public final void flush() {
        synchronized (this.lock) {
            this.flushed = true;
            this.skippedOutputBufferCount = 0;
            if (this.dequeuedInputBuffer != null) {
                releaseInputBufferInternal(this.dequeuedInputBuffer);
                this.dequeuedInputBuffer = null;
            }
            while (!this.queuedInputBuffers.isEmpty()) {
                releaseInputBufferInternal(this.queuedInputBuffers.removeFirst());
            }
            while (!this.queuedOutputBuffers.isEmpty()) {
                releaseOutputBufferInternal(this.queuedOutputBuffers.removeFirst());
            }
        }
    }

    @Override // com.google.android.exoplayer2.decoder.Decoder
    public void release() {
        synchronized (this.lock) {
            this.released = true;
            this.lock.notify();
        }
        try {
            this.decodeThread.join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    private void maybeThrowException() throws Exception {
        if (this.exception != null) {
            throw this.exception;
        }
    }

    private void maybeNotifyDecodeLoop() {
        if (canDecodeBuffer()) {
            this.lock.notify();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void run() {
        do {
            try {
            } catch (InterruptedException e) {
                throw new IllegalStateException(e);
            }
        } while (decode());
    }

    private boolean decode() throws InterruptedException {
        synchronized (this.lock) {
            while (!this.released && !canDecodeBuffer()) {
                this.lock.wait();
            }
            if (this.released) {
                return false;
            }
            I inputBuffer = this.queuedInputBuffers.removeFirst();
            O[] oArr = this.availableOutputBuffers;
            int i = this.availableOutputBufferCount - 1;
            this.availableOutputBufferCount = i;
            O outputBuffer = oArr[i];
            boolean resetDecoder = this.flushed;
            this.flushed = false;
            if (inputBuffer.isEndOfStream()) {
                outputBuffer.addFlag(4);
            } else {
                if (inputBuffer.isDecodeOnly()) {
                    outputBuffer.addFlag(Integer.MIN_VALUE);
                }
                this.exception = decode(inputBuffer, outputBuffer, resetDecoder);
                if (this.exception != null) {
                    synchronized (this.lock) {
                    }
                    return false;
                }
            }
            synchronized (this.lock) {
                if (this.flushed) {
                    releaseOutputBufferInternal(outputBuffer);
                } else if (outputBuffer.isDecodeOnly()) {
                    this.skippedOutputBufferCount++;
                    releaseOutputBufferInternal(outputBuffer);
                } else {
                    outputBuffer.skippedOutputBufferCount = this.skippedOutputBufferCount;
                    this.skippedOutputBufferCount = 0;
                    this.queuedOutputBuffers.addLast(outputBuffer);
                }
                releaseInputBufferInternal(inputBuffer);
            }
            return true;
        }
    }

    private boolean canDecodeBuffer() {
        return !this.queuedInputBuffers.isEmpty() && this.availableOutputBufferCount > 0;
    }

    private void releaseInputBufferInternal(I inputBuffer) {
        inputBuffer.clear();
        I[] iArr = this.availableInputBuffers;
        int i = this.availableInputBufferCount;
        this.availableInputBufferCount = i + 1;
        iArr[i] = inputBuffer;
    }

    private void releaseOutputBufferInternal(O outputBuffer) {
        outputBuffer.clear();
        O[] oArr = this.availableOutputBuffers;
        int i = this.availableOutputBufferCount;
        this.availableOutputBufferCount = i + 1;
        oArr[i] = outputBuffer;
    }
}
