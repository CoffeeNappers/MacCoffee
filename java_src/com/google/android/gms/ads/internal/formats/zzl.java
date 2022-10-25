package com.google.android.gms.ads.internal.formats;

import android.graphics.Point;
import android.support.annotation.Nullable;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzmd;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzl extends zzei.zza implements View.OnClickListener, View.OnTouchListener, ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener {
    @Nullable
    private FrameLayout zzald;
    @Nullable
    private zzi zzbnj;
    private final FrameLayout zzboo;
    @Nullable
    private zzb zzboq;
    int zzbos;
    int zzbot;
    private final Object zzako = new Object();
    private Map<String, WeakReference<View>> zzbop = new HashMap();
    boolean zzbor = false;

    public zzl(FrameLayout frameLayout, FrameLayout frameLayout2) {
        this.zzboo = frameLayout;
        this.zzald = frameLayout2;
        zzu.zzhk().zza((View) this.zzboo, (ViewTreeObserver.OnGlobalLayoutListener) this);
        zzu.zzhk().zza((View) this.zzboo, (ViewTreeObserver.OnScrollChangedListener) this);
        this.zzboo.setOnTouchListener(this);
        this.zzboo.setOnClickListener(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzd(zzj zzjVar) {
        if (!this.zzbop.containsKey("2011")) {
            zzjVar.zzmz();
            return;
        }
        final View view = this.zzbop.get("2011").get();
        if (!(view instanceof FrameLayout)) {
            zzjVar.zzmz();
        } else {
            zzjVar.zza(view, new zzg() { // from class: com.google.android.gms.ads.internal.formats.zzl.2
                @Override // com.google.android.gms.ads.internal.formats.zzg
                public void zzc(MotionEvent motionEvent) {
                    zzl.this.onTouch(null, motionEvent);
                }

                @Override // com.google.android.gms.ads.internal.formats.zzg
                public void zzmu() {
                    zzl.this.onClick(view);
                }
            });
        }
    }

    @Override // com.google.android.gms.internal.zzei
    public void destroy() {
        synchronized (this.zzako) {
            if (this.zzald != null) {
                this.zzald.removeAllViews();
            }
            this.zzald = null;
            this.zzbop = null;
            this.zzboq = null;
            this.zzbnj = null;
        }
    }

    int getMeasuredHeight() {
        return this.zzboo.getMeasuredHeight();
    }

    int getMeasuredWidth() {
        return this.zzboo.getMeasuredWidth();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        synchronized (this.zzako) {
            if (this.zzbnj == null) {
                return;
            }
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("x", zzab(this.zzbos));
                jSONObject.put("y", zzab(this.zzbot));
            } catch (JSONException e) {
                zzkx.zzdi("Unable to get click location");
            }
            if (this.zzboq == null || !this.zzboq.zzmm().equals(view)) {
                this.zzbnj.zza(view, this.zzbop, jSONObject, this.zzboo);
            } else if (!(this.zzbnj instanceof zzh) || ((zzh) this.zzbnj).zzmw() == null) {
                this.zzbnj.zza(view, "1007", jSONObject, this.zzbop, this.zzboo);
            } else {
                ((zzh) this.zzbnj).zzmw().zza(view, "1007", jSONObject, this.zzbop, this.zzboo);
            }
        }
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        synchronized (this.zzako) {
            if (this.zzbor) {
                int measuredWidth = getMeasuredWidth();
                int measuredHeight = getMeasuredHeight();
                if (measuredWidth != 0 && measuredHeight != 0 && this.zzald != null) {
                    this.zzald.setLayoutParams(new FrameLayout.LayoutParams(measuredWidth, measuredHeight));
                    this.zzbor = false;
                }
            }
            if (this.zzbnj != null) {
                this.zzbnj.zzd(this.zzboo, this.zzbop);
            }
        }
    }

    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    public void onScrollChanged() {
        synchronized (this.zzako) {
            if (this.zzbnj != null) {
                this.zzbnj.zzd(this.zzboo, this.zzbop);
            }
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        synchronized (this.zzako) {
            if (this.zzbnj != null) {
                Point zze = zze(motionEvent);
                this.zzbos = zze.x;
                this.zzbot = zze.y;
                MotionEvent obtain = MotionEvent.obtain(motionEvent);
                obtain.setLocation(zze.x, zze.y);
                this.zzbnj.zzd(obtain);
                obtain.recycle();
            }
        }
        return false;
    }

    int zzab(int i) {
        return zzm.zzkr().zzc(this.zzbnj.getContext(), i);
    }

    @Override // com.google.android.gms.internal.zzei
    public com.google.android.gms.dynamic.zzd zzaw(String str) {
        com.google.android.gms.dynamic.zzd zzac;
        synchronized (this.zzako) {
            WeakReference<View> weakReference = this.zzbop.get(str);
            zzac = com.google.android.gms.dynamic.zze.zzac(weakReference == null ? null : weakReference.get());
        }
        return zzac;
    }

    @Nullable
    zzb zzc(zzj zzjVar) {
        return zzjVar.zza(this);
    }

    @Override // com.google.android.gms.internal.zzei
    public void zzc(String str, com.google.android.gms.dynamic.zzd zzdVar) {
        View view = (View) com.google.android.gms.dynamic.zze.zzae(zzdVar);
        synchronized (this.zzako) {
            if (view == null) {
                this.zzbop.remove(str);
            } else {
                this.zzbop.put(str, new WeakReference<>(view));
                view.setOnTouchListener(this);
                view.setClickable(true);
                view.setOnClickListener(this);
            }
        }
    }

    Point zze(MotionEvent motionEvent) {
        int[] iArr = new int[2];
        this.zzboo.getLocationOnScreen(iArr);
        return new Point((int) (motionEvent.getRawX() - iArr[0]), (int) (motionEvent.getRawY() - iArr[1]));
    }

    @Override // com.google.android.gms.internal.zzei
    public void zze(com.google.android.gms.dynamic.zzd zzdVar) {
        synchronized (this.zzako) {
            zzj(null);
            Object zzae = com.google.android.gms.dynamic.zze.zzae(zzdVar);
            if (!(zzae instanceof zzj)) {
                zzkx.zzdi("Not an instance of native engine. This is most likely a transient error");
                return;
            }
            if (this.zzald != null) {
                this.zzald.setLayoutParams(new FrameLayout.LayoutParams(0, 0));
                this.zzboo.requestLayout();
            }
            this.zzbor = true;
            final zzj zzjVar = (zzj) zzae;
            if (this.zzbnj != null && zzdr.zzbjb.get().booleanValue()) {
                this.zzbnj.zzc(this.zzboo, this.zzbop);
            }
            if (!(this.zzbnj instanceof zzh) || !((zzh) this.zzbnj).zzmv()) {
                this.zzbnj = zzjVar;
                if (zzjVar instanceof zzh) {
                    ((zzh) zzjVar).zzc(null);
                }
            } else {
                ((zzh) this.zzbnj).zzc(zzjVar);
            }
            if (zzdr.zzbjb.get().booleanValue()) {
                this.zzald.setClickable(false);
            }
            this.zzald.removeAllViews();
            this.zzboq = zzc(zzjVar);
            if (this.zzboq != null) {
                this.zzbop.put("1007", new WeakReference<>(this.zzboq.zzmm()));
                this.zzald.addView(this.zzboq);
            }
            zzjVar.zza(this.zzboo, this.zzbop, this, this);
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.formats.zzl.1
                @Override // java.lang.Runnable
                public void run() {
                    zzmd zzmx = zzjVar.zzmx();
                    if (zzmx != null && zzl.this.zzald != null) {
                        zzl.this.zzald.addView(zzmx.getView());
                    }
                    if (!(zzjVar instanceof zzh)) {
                        zzl.this.zzd(zzjVar);
                    }
                }
            });
            zzj(this.zzboo);
        }
    }

    void zzj(@Nullable View view) {
        if (this.zzbnj != null) {
            zzi zzmw = this.zzbnj instanceof zzh ? ((zzh) this.zzbnj).zzmw() : this.zzbnj;
            if (zzmw == null) {
                return;
            }
            zzmw.zzj(view);
        }
    }
}
