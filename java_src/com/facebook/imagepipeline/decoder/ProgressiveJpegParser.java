package com.facebook.imagepipeline.decoder;

import com.facebook.common.internal.Closeables;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Throwables;
import com.facebook.common.util.StreamUtil;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.ByteArrayPool;
import com.facebook.imagepipeline.memory.PooledByteArrayBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class ProgressiveJpegParser {
    private static final int BUFFER_SIZE = 16384;
    private static final int NOT_A_JPEG = 6;
    private static final int READ_FIRST_JPEG_BYTE = 0;
    private static final int READ_MARKER_FIRST_BYTE_OR_ENTROPY_DATA = 2;
    private static final int READ_MARKER_SECOND_BYTE = 3;
    private static final int READ_SECOND_JPEG_BYTE = 1;
    private static final int READ_SIZE_FIRST_BYTE = 4;
    private static final int READ_SIZE_SECOND_BYTE = 5;
    private final ByteArrayPool mByteArrayPool;
    private int mBytesParsed = 0;
    private int mLastByteRead = 0;
    private int mNextFullScanNumber = 0;
    private int mBestScanEndOffset = 0;
    private int mBestScanNumber = 0;
    private int mParserState = 0;

    public ProgressiveJpegParser(ByteArrayPool byteArrayPool) {
        this.mByteArrayPool = (ByteArrayPool) Preconditions.checkNotNull(byteArrayPool);
    }

    public boolean parseMoreData(EncodedImage encodedImage) {
        if (this.mParserState == 6) {
            return false;
        }
        int dataBufferSize = encodedImage.getSize();
        if (dataBufferSize <= this.mBytesParsed) {
            return false;
        }
        InputStream bufferedDataStream = new PooledByteArrayBufferedInputStream(encodedImage.getInputStream(), this.mByteArrayPool.get(16384), this.mByteArrayPool);
        try {
            StreamUtil.skip(bufferedDataStream, this.mBytesParsed);
            return doParseMoreData(bufferedDataStream);
        } catch (IOException ioe) {
            Throwables.propagate(ioe);
            return false;
        } finally {
            Closeables.closeQuietly(bufferedDataStream);
        }
    }

    private boolean doParseMoreData(InputStream inputStream) {
        int nextByte;
        int oldBestScanNumber = this.mBestScanNumber;
        while (this.mParserState != 6 && (nextByte = inputStream.read()) != -1) {
            try {
                this.mBytesParsed++;
                switch (this.mParserState) {
                    case 0:
                        if (nextByte == 255) {
                            this.mParserState = 1;
                            break;
                        } else {
                            this.mParserState = 6;
                            break;
                        }
                    case 1:
                        if (nextByte == 216) {
                            this.mParserState = 2;
                            break;
                        } else {
                            this.mParserState = 6;
                            break;
                        }
                    case 2:
                        if (nextByte != 255) {
                            break;
                        } else {
                            this.mParserState = 3;
                            break;
                        }
                    case 3:
                        if (nextByte == 255) {
                            this.mParserState = 3;
                            break;
                        } else if (nextByte == 0) {
                            this.mParserState = 2;
                            break;
                        } else {
                            if (nextByte == 218 || nextByte == 217) {
                                newScanOrImageEndFound(this.mBytesParsed - 2);
                            }
                            if (doesMarkerStartSegment(nextByte)) {
                                this.mParserState = 4;
                                break;
                            } else {
                                this.mParserState = 2;
                                break;
                            }
                        }
                    case 4:
                        this.mParserState = 5;
                        break;
                    case 5:
                        int size = (this.mLastByteRead << 8) + nextByte;
                        int bytesToSkip = size - 2;
                        StreamUtil.skip(inputStream, bytesToSkip);
                        this.mBytesParsed += bytesToSkip;
                        this.mParserState = 2;
                        break;
                    default:
                        Preconditions.checkState(false);
                        break;
                }
                this.mLastByteRead = nextByte;
            } catch (IOException ioe) {
                Throwables.propagate(ioe);
            }
        }
        return (this.mParserState == 6 || this.mBestScanNumber == oldBestScanNumber) ? false : true;
    }

    private static boolean doesMarkerStartSegment(int markerSecondByte) {
        boolean z = true;
        if (markerSecondByte == 1) {
            return false;
        }
        if (markerSecondByte >= 208 && markerSecondByte <= 215) {
            return false;
        }
        if (markerSecondByte == 217 || markerSecondByte == 216) {
            z = false;
        }
        return z;
    }

    private void newScanOrImageEndFound(int offset) {
        if (this.mNextFullScanNumber > 0) {
            this.mBestScanEndOffset = offset;
        }
        int i = this.mNextFullScanNumber;
        this.mNextFullScanNumber = i + 1;
        this.mBestScanNumber = i;
    }

    public boolean isJpeg() {
        return this.mBytesParsed > 1 && this.mParserState != 6;
    }

    public int getBestScanEndOffset() {
        return this.mBestScanEndOffset;
    }

    public int getBestScanNumber() {
        return this.mBestScanNumber;
    }
}
