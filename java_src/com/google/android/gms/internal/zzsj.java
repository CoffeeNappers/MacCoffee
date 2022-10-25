package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
/* loaded from: classes2.dex */
public final class zzsj extends Drawable implements Drawable.Callback {
    private boolean CH;
    private int CM;
    private int CN;
    private int CO;
    private int CP;
    private int CQ;
    private boolean CR;
    private zzb CS;
    private Drawable CT;
    private Drawable CU;
    private boolean CV;
    private boolean CW;
    private boolean CX;
    private int CY;
    private long eg;
    private int mFrom;

    /* loaded from: classes2.dex */
    private static final class zza extends Drawable {
        private static final zza CZ = new zza();
        private static final C0130zza Da = new C0130zza();

        /* renamed from: com.google.android.gms.internal.zzsj$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        private static final class C0130zza extends Drawable.ConstantState {
            private C0130zza() {
            }

            @Override // android.graphics.drawable.Drawable.ConstantState
            public int getChangingConfigurations() {
                return 0;
            }

            @Override // android.graphics.drawable.Drawable.ConstantState
            public Drawable newDrawable() {
                return zza.CZ;
            }
        }

        private zza() {
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
        }

        @Override // android.graphics.drawable.Drawable
        public Drawable.ConstantState getConstantState() {
            return Da;
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return -2;
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int i) {
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter colorFilter) {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static final class zzb extends Drawable.ConstantState {
        int Db;
        int mChangingConfigurations;

        zzb(zzb zzbVar) {
            if (zzbVar != null) {
                this.mChangingConfigurations = zzbVar.mChangingConfigurations;
                this.Db = zzbVar.Db;
            }
        }

        @Override // android.graphics.drawable.Drawable.ConstantState
        public int getChangingConfigurations() {
            return this.mChangingConfigurations;
        }

        @Override // android.graphics.drawable.Drawable.ConstantState
        public Drawable newDrawable() {
            return new zzsj(this);
        }
    }

    public zzsj(Drawable drawable, Drawable drawable2) {
        this(null);
        drawable = drawable == null ? zza.CZ : drawable;
        this.CT = drawable;
        drawable.setCallback(this);
        this.CS.Db |= drawable.getChangingConfigurations();
        drawable2 = drawable2 == null ? zza.CZ : drawable2;
        this.CU = drawable2;
        drawable2.setCallback(this);
        this.CS.Db |= drawable2.getChangingConfigurations();
    }

    zzsj(zzb zzbVar) {
        this.CM = 0;
        this.CO = 255;
        this.CQ = 0;
        this.CH = true;
        this.CS = new zzb(zzbVar);
    }

    public boolean canConstantState() {
        if (!this.CV) {
            this.CW = (this.CT.getConstantState() == null || this.CU.getConstantState() == null) ? false : true;
            this.CV = true;
        }
        return this.CW;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        boolean z = true;
        boolean z2 = false;
        switch (this.CM) {
            case 1:
                this.eg = SystemClock.uptimeMillis();
                this.CM = 2;
                break;
            case 2:
                if (this.eg >= 0) {
                    float uptimeMillis = ((float) (SystemClock.uptimeMillis() - this.eg)) / this.CP;
                    if (uptimeMillis < 1.0f) {
                        z = false;
                    }
                    if (z) {
                        this.CM = 0;
                    }
                    this.CQ = (int) ((Math.min(uptimeMillis, 1.0f) * (this.CN + 0)) + 0.0f);
                }
            default:
                z2 = z;
                break;
        }
        int i = this.CQ;
        boolean z3 = this.CH;
        Drawable drawable = this.CT;
        Drawable drawable2 = this.CU;
        if (z2) {
            if (!z3 || i == 0) {
                drawable.draw(canvas);
            }
            if (i != this.CO) {
                return;
            }
            drawable2.setAlpha(this.CO);
            drawable2.draw(canvas);
            return;
        }
        if (z3) {
            drawable.setAlpha(this.CO - i);
        }
        drawable.draw(canvas);
        if (z3) {
            drawable.setAlpha(this.CO);
        }
        if (i > 0) {
            drawable2.setAlpha(i);
            drawable2.draw(canvas);
            drawable2.setAlpha(this.CO);
        }
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public int getChangingConfigurations() {
        return super.getChangingConfigurations() | this.CS.mChangingConfigurations | this.CS.Db;
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable.ConstantState getConstantState() {
        if (canConstantState()) {
            this.CS.mChangingConfigurations = getChangingConfigurations();
            return this.CS;
        }
        return null;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return Math.max(this.CT.getIntrinsicHeight(), this.CU.getIntrinsicHeight());
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return Math.max(this.CT.getIntrinsicWidth(), this.CU.getIntrinsicWidth());
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        if (!this.CX) {
            this.CY = Drawable.resolveOpacity(this.CT.getOpacity(), this.CU.getOpacity());
            this.CX = true;
        }
        return this.CY;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    @TargetApi(11)
    public void invalidateDrawable(Drawable drawable) {
        Drawable.Callback callback;
        if (!com.google.android.gms.common.util.zzs.zzayn() || (callback = getCallback()) == null) {
            return;
        }
        callback.invalidateDrawable(this);
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable mutate() {
        if (!this.CR && super.mutate() == this) {
            if (!canConstantState()) {
                throw new IllegalStateException("One or more children of this LayerDrawable does not have constant state; this drawable cannot be mutated.");
            }
            this.CT.mutate();
            this.CU.mutate();
            this.CR = true;
        }
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect rect) {
        this.CT.setBounds(rect);
        this.CU.setBounds(rect);
    }

    @Override // android.graphics.drawable.Drawable.Callback
    @TargetApi(11)
    public void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
        Drawable.Callback callback;
        if (!com.google.android.gms.common.util.zzs.zzayn() || (callback = getCallback()) == null) {
            return;
        }
        callback.scheduleDrawable(this, runnable, j);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i) {
        if (this.CQ == this.CO) {
            this.CQ = i;
        }
        this.CO = i;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.CT.setColorFilter(colorFilter);
        this.CU.setColorFilter(colorFilter);
    }

    public void startTransition(int i) {
        this.mFrom = 0;
        this.CN = this.CO;
        this.CQ = 0;
        this.CP = i;
        this.CM = 1;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    @TargetApi(11)
    public void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        Drawable.Callback callback;
        if (!com.google.android.gms.common.util.zzs.zzayn() || (callback = getCallback()) == null) {
            return;
        }
        callback.unscheduleDrawable(this, runnable);
    }

    public Drawable zzauw() {
        return this.CU;
    }
}
