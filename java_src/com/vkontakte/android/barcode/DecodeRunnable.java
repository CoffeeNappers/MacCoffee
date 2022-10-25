package com.vkontakte.android.barcode;

import android.app.Activity;
import android.hardware.Camera;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.PlanarYUVLuminanceSource;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;
import com.vkontakte.android.R;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
/* loaded from: classes2.dex */
public class DecodeRunnable implements Runnable, Camera.PreviewCallback {
    private static final String TAG = DecodeRunnable.class.getSimpleName();
    private final Activity activity;
    private final Camera camera;
    private Handler handler;
    private final CountDownLatch handlerInitLatch;
    private final int height;
    private final byte[] previewBuffer;
    private DecodeResultListener resultListener;
    private boolean running;
    private final int width;

    public DecodeRunnable(Activity activity, Camera camera, DecodeResultListener listener) {
        this.activity = activity;
        this.camera = camera;
        Camera.Parameters parameters = camera.getParameters();
        Camera.Size previewSize = parameters.getPreviewSize();
        this.height = previewSize.height;
        this.width = previewSize.width;
        this.previewBuffer = new byte[((this.height * this.width) * 3) / 2];
        this.running = true;
        this.handlerInitLatch = new CountDownLatch(1);
        this.resultListener = listener;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Handler getHandler() {
        try {
            this.handlerInitLatch.await();
        } catch (InterruptedException e) {
        }
        return this.handler;
    }

    @Override // java.lang.Runnable
    public void run() {
        Looper.prepare();
        this.handler = new DecodeHandler();
        this.handlerInitLatch.countDown();
        Looper.loop();
    }

    public void startScanning() {
        getHandler().obtainMessage(R.id.decode_start).sendToTarget();
    }

    public void stop() {
        getHandler().obtainMessage(R.id.quit).sendToTarget();
    }

    @Override // android.hardware.Camera.PreviewCallback
    public void onPreviewFrame(byte[] data, Camera camera) {
        if (this.running) {
            getHandler().obtainMessage(R.id.decode, data).sendToTarget();
        }
    }

    /* loaded from: classes2.dex */
    private final class DecodeHandler extends Handler {
        private final Map<DecodeHintType, Object> hints = new EnumMap(DecodeHintType.class);

        DecodeHandler() {
            this.hints.put(DecodeHintType.POSSIBLE_FORMATS, Arrays.asList(BarcodeFormat.AZTEC, BarcodeFormat.QR_CODE, BarcodeFormat.DATA_MATRIX));
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            if (DecodeRunnable.this.running) {
                switch (message.what) {
                    case R.id.decode /* 2131755030 */:
                        decode((byte[]) message.obj);
                        return;
                    case R.id.decode_failed /* 2131755031 */:
                        DecodeRunnable.this.camera.addCallbackBuffer(DecodeRunnable.this.previewBuffer);
                        return;
                    case R.id.decode_start /* 2131755032 */:
                        DecodeRunnable.this.camera.setPreviewCallbackWithBuffer(DecodeRunnable.this);
                        DecodeRunnable.this.camera.addCallbackBuffer(DecodeRunnable.this.previewBuffer);
                        return;
                    case R.id.decode_succeeded /* 2131755033 */:
                        final Result result = (Result) message.obj;
                        DecodeRunnable.this.activity.runOnUiThread(new Runnable() { // from class: com.vkontakte.android.barcode.DecodeRunnable.DecodeHandler.1
                            @Override // java.lang.Runnable
                            public void run() {
                                DecodeRunnable.this.resultListener.onDecodeResult(result);
                            }
                        });
                        return;
                    case R.id.quit /* 2131755134 */:
                        DecodeRunnable.this.running = false;
                        Looper.myLooper().quit();
                        return;
                    default:
                        return;
                }
            }
        }

        private void decode(byte[] data) {
            Message message;
            Result rawResult = null;
            int subtendedWidth = Math.round(Math.min(DecodeRunnable.this.width, DecodeRunnable.this.height) * 0.7f);
            int subtendedHeight = Math.round(Math.min(DecodeRunnable.this.width, DecodeRunnable.this.height) * 0.7f);
            int excessWidth = DecodeRunnable.this.width - subtendedWidth;
            int excessHeight = DecodeRunnable.this.height - subtendedHeight;
            PlanarYUVLuminanceSource source = new PlanarYUVLuminanceSource(data, DecodeRunnable.this.width, DecodeRunnable.this.height, excessWidth / 2, excessHeight / 2, subtendedWidth, subtendedHeight, false);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
            try {
                rawResult = new MultiFormatReader().decode(bitmap, this.hints);
            } catch (ReaderException e) {
            }
            Handler handler = DecodeRunnable.this.getHandler();
            if (rawResult != null) {
                Log.i(DecodeRunnable.TAG, "Decode succeeded: " + rawResult.getText());
                message = handler.obtainMessage(R.id.decode_succeeded, rawResult);
            } else {
                message = handler.obtainMessage(R.id.decode_failed);
            }
            message.sendToTarget();
        }
    }
}
