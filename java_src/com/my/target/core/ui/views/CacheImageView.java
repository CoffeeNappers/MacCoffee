package com.my.target.core.ui.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.view.View;
import android.widget.ImageView;
import com.my.target.Tracer;
import com.my.target.core.utils.e;
import com.my.target.nativeads.models.ImageData;
/* loaded from: classes2.dex */
public class CacheImageView extends ImageView {
    private GradientDrawable a;
    private Bitmap b;
    private int c;
    private int d;
    private ImageData e;
    private Paint f;
    private Rect g;
    private final Rect h;
    private a i;

    public CacheImageView(Context context) {
        super(context);
        this.f = new Paint();
        this.f.setFilterBitmap(true);
        this.h = new Rect();
    }

    public void setImageData(ImageData imageData) {
        this.e = imageData;
        if (imageData == null) {
            setImageBitmap(null);
            return;
        }
        this.b = imageData.getData();
        if (this.b != null) {
            setImageBitmap(this.b);
            return;
        }
        this.i = new a(this, getContext(), (byte) 0);
        this.i.execute(new Void[0]);
    }

    @Override // android.widget.ImageView
    public final void setImageDrawable(Drawable drawable) {
        Tracer.i("Unable to set custom image drawable to generated view");
    }

    @Override // android.widget.ImageView
    public void setImageResource(int i) {
        Tracer.i("Unable to set custom image resource to generated view");
    }

    @Override // android.widget.ImageView
    public void setImageURI(Uri uri) {
        Tracer.i("Unable to set custom image uri to generated view");
    }

    public void setImageBitmap(Bitmap bitmap, boolean z) {
        if (z && Build.VERSION.SDK_INT >= 12) {
            setAlpha(0.0f);
            setImageBitmap(bitmap);
            animate().alpha(1.0f).setDuration(300L);
            return;
        }
        setImageBitmap(bitmap);
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bitmap) {
        this.b = bitmap;
        if (bitmap != null) {
            setBackgroundColor(0);
            this.g = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
            requestLayout();
            invalidate();
        }
    }

    /* loaded from: classes2.dex */
    private class a extends AsyncTask<Void, Void, Void> {
        private Bitmap b;
        private final Context c;

        /* synthetic */ a(CacheImageView cacheImageView, Context context, byte b) {
            this(context);
        }

        @Override // android.os.AsyncTask
        protected final /* synthetic */ Void doInBackground(Void[] voidArr) {
            return a();
        }

        private a(Context context) {
            this.c = context;
        }

        private Void a() {
            e a;
            try {
                if (CacheImageView.this.e != null) {
                    this.b = CacheImageView.this.e.getData();
                    if (this.b == null && (a = e.a(this.c)) != null) {
                        this.b = a.a(CacheImageView.this.e.getUrl());
                        if (this.b != null) {
                            CacheImageView.this.e.setData(this.b);
                        }
                    }
                }
            } catch (Throwable th) {
                Tracer.d(th.getMessage());
            }
            return null;
        }

        @Override // android.os.AsyncTask
        protected final /* synthetic */ void onPostExecute(Void r4) {
            if (CacheImageView.this.e == null) {
                return;
            }
            CacheImageView.this.setImageBitmap(this.b, true);
        }
    }

    public void setBorder(int i, int i2) {
        if (this.a == null) {
            this.a = new GradientDrawable();
        }
        this.a.setStroke(i, i2);
        invalidate();
    }

    public void setPlaceholderWidth(int i) {
        this.c = i;
    }

    public void setPlaceholderHeight(int i) {
        this.d = i;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        if (this.b != null) {
            if (this.a != null) {
                this.a.draw(canvas);
            }
            canvas.drawBitmap(this.b, this.g, this.h, this.f);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int i, int i2) {
        int i3;
        int i4;
        float f = 0.0f;
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        int i5 = mode == 0 ? Integer.MIN_VALUE : mode;
        if (mode2 == 0) {
            mode2 = Integer.MIN_VALUE;
        }
        if (this.b != null) {
            i3 = this.b.getWidth();
            i4 = this.b.getHeight();
        } else if (this.d != 0 && this.c != 0) {
            i3 = this.c;
            i4 = this.d;
        } else {
            super.onMeasure(i, i2);
            return;
        }
        float f2 = i4 != 0 ? i3 / i4 : 0.0f;
        if (size2 != 0) {
            f = size / size2;
        }
        if (i5 == 1073741824 && mode2 == 1073741824) {
            setMeasuredDimension(size, size2);
        } else if (i5 == Integer.MIN_VALUE && mode2 == Integer.MIN_VALUE) {
            if (f2 < f) {
                int min = Math.min(i4, size2);
                setMeasuredDimension(Math.round(min * f2), min);
                return;
            }
            int min2 = Math.min(i3, size2);
            setMeasuredDimension(min2, Math.round(min2 / f2));
        } else if (i5 == Integer.MIN_VALUE && mode2 == 1073741824) {
            setMeasuredDimension(Math.round(size2 * f2), size2);
        } else if (i5 == 1073741824 && mode2 == Integer.MIN_VALUE) {
            setMeasuredDimension(size, Math.round(size / f2));
        }
    }

    @Override // android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (this.a != null) {
            this.a.setBounds(getPaddingLeft(), getPaddingTop(), getWidth(), getHeight());
        }
        this.h.left = getPaddingLeft();
        this.h.top = getPaddingTop();
        this.h.right = getWidth() - getPaddingRight();
        this.h.bottom = getHeight() - getPaddingBottom();
    }
}
