package com.vkontakte.android.fragments;

import android.app.DialogFragment;
import android.app.Fragment;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;
import com.facebook.imagepipeline.common.RotationOptions;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Result;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.vk.core.util.Screen;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.barcode.CameraConfigurationManager;
import com.vkontakte.android.barcode.DecodeResultListener;
import com.vkontakte.android.barcode.DecodeRunnable;
import com.vkontakte.android.ui.BarcodeViewfinderLayout;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class BarcodeShareFragment extends DialogFragment implements DecodeResultListener, TextureView.SurfaceTextureListener {
    private Camera camera;
    private DecodeRunnable decodeRunnable;
    private DialogInterface.OnDismissListener dismissListener;
    private boolean hasSurface;
    private View view;

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setStyle(1, 0);
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.view = inflater.inflate(R.layout.barcode_share, (ViewGroup) null);
        this.view.postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.BarcodeShareFragment.1
            @Override // java.lang.Runnable
            public void run() {
                if (BarcodeShareFragment.this.getActivity() != null && BarcodeShareFragment.this.view != null) {
                    ViewUtils.setVisibilityAnimated(BarcodeShareFragment.this.view.findViewById(R.id.barcode_share_explain), 8);
                }
            }
        }, 2000L);
        ImageView myCode = (ImageView) this.view.findViewById(R.id.my_barcode_view);
        try {
            Map<EncodeHintType, Object> hints = new HashMap<>();
            hints.put(EncodeHintType.MARGIN, 0);
            QRCodeWriter writer = new QRCodeWriter();
            BitMatrix matrix = writer.encode("http://vk.com/id" + VKAccountManager.getCurrent().getUid(), BarcodeFormat.QR_CODE, RotationOptions.ROTATE_180, RotationOptions.ROTATE_180, hints);
            int[] pixels = new int[matrix.getWidth() * matrix.getHeight()];
            Bitmap bitmap = Bitmap.createBitmap(matrix.getWidth(), matrix.getHeight(), Bitmap.Config.ARGB_8888);
            for (int i = 0; i < matrix.getHeight(); i++) {
                for (int j = 0; j < matrix.getWidth(); j++) {
                    pixels[(bitmap.getWidth() * i) + j] = matrix.get(i, j) ? ViewCompat.MEASURED_STATE_MASK : -1;
                }
            }
            bitmap.setPixels(pixels, 0, matrix.getWidth(), 0, 0, matrix.getWidth(), matrix.getHeight());
            myCode.setImageBitmap(bitmap);
        } catch (Exception x) {
            Log.w("vk", x);
        }
        return this.view;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.view = null;
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        TextureView textureView = (TextureView) this.view.findViewById(R.id.preview_view);
        textureView.setScaleX(1.000001f);
        textureView.setScaleY(1.000001f);
        SurfaceTexture texture = textureView.getSurfaceTexture();
        textureView.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.BarcodeShareFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (BarcodeShareFragment.this.camera != null) {
                    BarcodeShareFragment.this.camera.autoFocus(null);
                }
            }
        });
        if (this.hasSurface) {
            initCamera(texture);
        } else {
            textureView.setSurfaceTextureListener(this);
        }
    }

    @Override // android.app.Fragment
    public void onPause() {
        if (this.decodeRunnable != null) {
            this.decodeRunnable.stop();
            this.decodeRunnable = null;
        }
        if (this.camera != null) {
            this.camera.stopPreview();
            this.camera.release();
            this.camera = null;
        }
        TextureView textureView = (TextureView) this.view.findViewById(R.id.preview_view);
        textureView.setSurfaceTextureListener(null);
        super.onPause();
    }

    @Override // android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateCameraRotation();
    }

    private void initCamera(SurfaceTexture texture) {
        try {
            if (this.camera != null) {
                throw new IllegalStateException("Camera not null on initialization");
            }
            this.camera = Camera.open();
            if (this.camera == null) {
                throw new IllegalStateException("Camera is null");
            }
            CameraConfigurationManager.configure(this.camera);
            try {
                this.camera.setPreviewTexture(texture);
                this.camera.startPreview();
                this.camera.autoFocus(null);
            } catch (IOException e) {
                Log.e("vk", "Cannot start preview", e);
            }
            updateCameraRotation();
            this.decodeRunnable = new DecodeRunnable(getActivity(), this.camera, this);
            new Thread(this.decodeRunnable).start();
            this.decodeRunnable.startScanning();
        } catch (Throwable t) {
            Log.e("vk", "Cannot init camera", t);
            Toast.makeText(getActivity(), (int) R.string.error, 0).show();
            this.view.postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.BarcodeShareFragment.3
                @Override // java.lang.Runnable
                public void run() {
                    BarcodeShareFragment.this.dismiss();
                }
            }, 250L);
        }
    }

    @Override // com.vkontakte.android.barcode.DecodeResultListener
    public void onDecodeResult(Result result) {
        String text = result.getText();
        if (text.matches("http://vk\\.com/id[0-9]+")) {
            getFragmentManager().beginTransaction().remove(this).commit();
            Fragment nearby = getFragmentManager().findFragmentByTag("nearby_dlg");
            if (nearby != null) {
                getFragmentManager().beginTransaction().remove(nearby).commit();
            }
            Intent intent = new Intent(getActivity(), LinkRedirActivity.class);
            intent.setData(Uri.parse(text));
            startActivity(intent);
        } else if (this.decodeRunnable != null) {
            this.decodeRunnable.startScanning();
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
        Log.i("vk", "Surface created");
        if (!this.hasSurface) {
            this.hasSurface = true;
            initCamera(surface);
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
        this.hasSurface = false;
        return true;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureUpdated(SurfaceTexture surface) {
    }

    private void updateCameraRotation() {
        final boolean horizontal;
        int i = 1;
        if (this.camera != null) {
            Display display = ((WindowManager) getActivity().getSystemService("window")).getDefaultDisplay();
            Point size = new Point();
            display.getSize(size);
            if (((display.getRotation() == 0 || display.getRotation() == 2) && size.x < size.y) || ((display.getRotation() == 1 || display.getRotation() == 3) && size.x > size.y)) {
                horizontal = display.getRotation() == 1 || display.getRotation() == 3;
                switch (display.getRotation()) {
                    case 0:
                        this.camera.setDisplayOrientation(90);
                        break;
                    case 1:
                        this.camera.setDisplayOrientation(0);
                        break;
                    case 2:
                        this.camera.setDisplayOrientation(RotationOptions.ROTATE_270);
                        break;
                    case 3:
                        this.camera.setDisplayOrientation(RotationOptions.ROTATE_180);
                        break;
                }
            } else {
                horizontal = display.getRotation() == 0 || display.getRotation() == 2;
                switch (display.getRotation()) {
                    case 0:
                        this.camera.setDisplayOrientation(0);
                        break;
                    case 1:
                        this.camera.setDisplayOrientation(RotationOptions.ROTATE_270);
                        break;
                    case 2:
                        this.camera.setDisplayOrientation(RotationOptions.ROTATE_180);
                        break;
                    case 3:
                        this.camera.setDisplayOrientation(90);
                        break;
                }
            }
            this.view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.BarcodeShareFragment.4
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    BarcodeShareFragment.this.view.getViewTreeObserver().removeOnPreDrawListener(this);
                    Camera.Size previewSize = BarcodeShareFragment.this.camera.getParameters().getPreviewSize();
                    BarcodeViewfinderLayout texWrap = (BarcodeViewfinderLayout) BarcodeShareFragment.this.view.findViewById(R.id.preview_crop);
                    int realSize = Global.scale(220.0f);
                    if (!horizontal) {
                        int tmp = previewSize.width;
                        previewSize.width = previewSize.height;
                        previewSize.height = tmp;
                    }
                    Log.i("vk", "preview size = " + previewSize.width + "x" + previewSize.height + ", view size=" + realSize);
                    if (previewSize.width > previewSize.height) {
                        float scale = realSize / previewSize.height;
                        texWrap.setCrop(Math.round(((previewSize.width - previewSize.height) / 2) * scale), 0);
                        return true;
                    }
                    float scale2 = realSize / previewSize.width;
                    texWrap.setCrop(0, Math.round(((previewSize.height - previewSize.width) / 2) * scale2));
                    return true;
                }
            });
            boolean horLayout = size.x > size.y && !Screen.isTablet(this.view.getContext());
            LinearLayout linearLayout = (LinearLayout) this.view;
            if (horLayout) {
                i = 0;
            }
            linearLayout.setOrientation(i);
            this.view.setPadding(0, 0, horizontal ? Global.scale(5.0f) : 0, horLayout ? 0 : Global.scale(5.0f));
        }
    }

    @Override // android.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
        if (this.dismissListener != null) {
            this.dismissListener.onDismiss(dialog);
        }
    }

    public void setOnDismissListener(DialogInterface.OnDismissListener l) {
        this.dismissListener = l;
    }
}
