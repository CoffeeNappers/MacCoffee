package com.my.target.ads.instream;

import android.content.Context;
import android.util.Pair;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.core.async.commands.b;
import com.my.target.core.controllers.b;
import com.my.target.core.facades.a;
import com.my.target.core.models.banners.m;
import com.my.target.core.models.c;
import com.my.target.core.models.d;
import com.my.target.core.models.sections.f;
import com.my.target.core.models.sections.i;
import com.my.target.core.models.sections.k;
import com.my.target.core.ui.InstreamAdVideoPlayer;
import com.my.target.core.utils.n;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class InstreamAd extends a {
    public static final int DEFAULT_VIDEO_QUALITY = 360;
    private b controller;
    private String currentSection;
    private int doAfterPosition;
    private InstreamAdListener instreamAdListener;
    private Pair<Float, Integer> loadingMidPoint;
    private float[] midPoints;
    private f section;
    private float[] userMidPoints;
    private float videoDuration;
    private InstreamAdPlayer videoPlayer;
    private final b.a<c> doAfterServiceListener = new b.a<c>() { // from class: com.my.target.ads.instream.InstreamAd.1
        @Override // com.my.target.core.async.commands.b.a
        public void onExecute(com.my.target.core.async.commands.b<c> bVar, c cVar) {
            if (cVar == null) {
                if (InstreamAd.this.instreamAdListener != null) {
                    InstreamAd.this.instreamAdListener.onComplete(InstreamAd.this.currentSection, InstreamAd.this);
                }
            } else if (InstreamAd.this.section != null && InstreamAd.this.controller != null) {
                if (InstreamAd.this.controller.a() == null) {
                    Tracer.d("Unable to start advertisement: player has not set");
                    return;
                }
                Tracer.d("starting doAfter");
                k c = InstreamAd.this.section.c(InstreamAd.this.currentSection);
                int size = c.g().size();
                if (size <= InstreamAd.this.doAfterPosition) {
                    InstreamAd.this.loadDoAfterService(c.l(), InstreamAd.this.currentSection);
                } else {
                    InstreamAd.this.controller.b(c, c.g().subList(InstreamAd.this.doAfterPosition, size));
                }
            } else {
                Tracer.d("Unable to start advertisement: not loaded yet");
            }
        }
    };
    private final b.a<c> midPointServiceListener = new b.a<c>() { // from class: com.my.target.ads.instream.InstreamAd.2
        @Override // com.my.target.core.async.commands.b.a
        public void onExecute(com.my.target.core.async.commands.b<c> bVar, c cVar) {
            if (cVar == null) {
                if (InstreamAd.this.instreamAdListener != null) {
                    InstreamAd.this.instreamAdListener.onComplete(InstreamAd.this.currentSection, InstreamAd.this);
                    return;
                }
                return;
            }
            InstreamAd.this.startAtPoint(InstreamAd.this.currentSection, ((Float) InstreamAd.this.loadingMidPoint.first).floatValue());
        }
    };
    private int videoQuality = DEFAULT_VIDEO_QUALITY;
    private b.a completeSectionListener = new b.a() { // from class: com.my.target.ads.instream.InstreamAd.3
        @Override // com.my.target.core.controllers.b.a
        public void sectionCompleted(String str) {
            if (InstreamAd.this.section != null) {
                k c = InstreamAd.this.section.c(str);
                if (!c.j().isEmpty()) {
                    InstreamAd.this.loadMidPoint(c, ((Float) InstreamAd.this.loadingMidPoint.first).floatValue());
                } else {
                    InstreamAd.this.loadDoAfterService(c.l(), str);
                }
            } else if (InstreamAd.this.instreamAdListener != null) {
                InstreamAd.this.instreamAdListener.onComplete(str, InstreamAd.this);
            }
        }
    };
    private float volume = 1.0f;

    /* loaded from: classes2.dex */
    public interface InstreamAdListener {
        void onBannerComplete(InstreamAd instreamAd, InstreamAdBanner instreamAdBanner);

        void onBannerStart(InstreamAd instreamAd, InstreamAdBanner instreamAdBanner);

        void onBannerTimeLeftChange(float f, float f2, InstreamAd instreamAd);

        void onComplete(String str, InstreamAd instreamAd);

        void onError(String str, InstreamAd instreamAd);

        void onLoad(InstreamAd instreamAd);

        void onNoAd(String str, InstreamAd instreamAd);
    }

    public float[] getMidPoints() {
        return this.midPoints;
    }

    public InstreamAdPlayer getPlayer() {
        return this.videoPlayer;
    }

    public int getVideoQuality() {
        return this.videoQuality;
    }

    public boolean isTrackingEnvironmentEnabled() {
        return this.params.f();
    }

    public void setFullscreen(boolean z) {
        if (this.controller != null) {
            this.controller.a(z);
        }
    }

    public void setListener(InstreamAdListener instreamAdListener) {
        if (this.controller != null) {
            this.controller.a(instreamAdListener);
        }
        this.instreamAdListener = instreamAdListener;
    }

    public void setPlayer(InstreamAdPlayer instreamAdPlayer) {
        if (this.controller != null) {
            this.controller.a(instreamAdPlayer);
        }
        this.videoPlayer = instreamAdPlayer;
    }

    public void setVideoQuality(int i) {
        if (this.controller != null) {
            this.controller.a(i);
        }
        this.videoQuality = i;
    }

    public void setVolume(float f) {
        if (Float.compare(f, 0.0f) < 0 || Float.compare(f, 1.0f) > 0) {
            Tracer.d("unable to set volume" + f + ", volume must be in range [0..1]");
            return;
        }
        if (this.controller != null) {
            this.controller.a(f);
        }
        this.volume = f;
    }

    public InstreamAd(int i, CustomParams customParams, Context context) {
        this.context = context;
        this.params = new com.my.target.core.a(i, "instreamads");
        this.params.a(customParams);
        this.params.i();
        this.loadingMidPoint = new Pair<>(Float.valueOf(0.0f), 0);
    }

    public void configureMidpoints(float f) {
        configureMidpoints(f, null);
    }

    public void configureMidpoints(float f, float[] fArr) {
        this.userMidPoints = fArr;
        this.videoDuration = f;
        if (this.section != null) {
            this.midPoints = n.a(this.section.c("midroll"), this.userMidPoints, f);
        }
    }

    public void configureMidpointsPercents(float f, float[] fArr) {
        float[] fArr2;
        float[] fArr3 = new float[fArr.length];
        int i = 0;
        for (int i2 = 0; i2 < fArr.length; i2++) {
            float f2 = fArr[i2];
            if (Float.compare(f2, 0.0f) < 0 || Float.compare(f2, 100.0f) > 0) {
                i++;
                Tracer.d("failed to add midrollpoint at " + f2 + "%, must be in range [0..100]");
                fArr3[i2] = -1.0f;
            } else {
                fArr3[i2] = f2 * (f / 100.0f);
            }
        }
        if (i > 0) {
            Arrays.sort(fArr3);
            fArr2 = Arrays.copyOfRange(fArr3, i, fArr3.length);
        } else {
            fArr2 = fArr3;
        }
        configureMidpoints(f, fArr2);
    }

    public void useDefaultPlayer() {
        this.videoPlayer = new InstreamAdVideoPlayer(this.context);
        if (this.controller != null) {
            this.controller.a(this.videoPlayer);
        }
    }

    public void pause() {
        if (this.controller != null) {
            this.controller.d();
        }
    }

    public void resume() {
        if (this.controller != null) {
            this.controller.e();
        }
    }

    public void stop() {
        if (this.controller != null) {
            this.controller.f();
        }
    }

    public void destroy() {
        if (this.controller != null) {
            this.controller.g();
        }
    }

    public void skip() {
        if (this.controller != null) {
            this.controller.b();
        }
    }

    public void skipBanner() {
        if (this.controller != null) {
            this.controller.c();
        }
    }

    public void handleClick() {
        if (this.controller != null) {
            this.controller.h();
        }
    }

    public void startPreroll() {
        start("preroll");
    }

    public void startPostroll() {
        start("postroll");
    }

    public void startPauseroll() {
        start("pauseroll");
    }

    public void startMidroll(float f) {
        boolean z = false;
        if (this.midPoints != null) {
            float[] fArr = this.midPoints;
            int length = fArr.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                } else if (Float.compare(fArr[i], f) != 0) {
                    i++;
                } else {
                    z = true;
                    break;
                }
            }
        }
        if (z) {
            startAtPoint("midroll", f);
        } else {
            Tracer.d("attempt to start wrong midpoint, use one of InstreamAd.getMidPoints() value");
        }
    }

    @Override // com.my.target.core.facades.a
    protected void onLoad(c cVar) {
        if (this.instreamAdListener != null) {
            i c = cVar.c("instreamads");
            if (c != null && (c instanceof f)) {
                this.section = (f) c;
            }
            if (this.section != null) {
                this.midPoints = n.a(this.section.c("midroll"), this.userMidPoints, this.videoDuration);
                this.controller = new com.my.target.core.controllers.b(this);
                this.controller.a(cVar);
                this.controller.a(this.instreamAdListener);
                this.controller.a(this.videoQuality);
                this.controller.a(this.volume);
                this.controller.a(this.completeSectionListener);
                if (this.videoPlayer != null) {
                    this.controller.a(this.videoPlayer);
                }
                this.instreamAdListener.onLoad(this);
                return;
            }
            this.instreamAdListener.onNoAd("No ad", this);
        }
    }

    @Override // com.my.target.core.facades.a
    protected void onLoadError(String str) {
        if (this.instreamAdListener != null) {
            this.instreamAdListener.onNoAd(str, this);
        }
    }

    @Override // com.my.target.core.facades.a
    public void setTrackingEnvironmentEnabled(boolean z) {
        this.params.a(z);
    }

    private void start(String str) {
        if (this.section == null || this.controller == null) {
            Tracer.d("Unable to start advertisement: not loaded yet");
        } else if (this.controller.a() == null) {
            Tracer.d("Unable to start advertisement: player has not set");
        } else {
            this.currentSection = str;
            k c = this.section.c(str);
            this.controller.a(c, c.g());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startAtPoint(String str, float f) {
        if (this.section == null || this.controller == null) {
            Tracer.d("Unable to start advertisement: not loaded yet");
        } else if (this.controller.a() == null) {
            Tracer.d("Unable to start advertisement: player has not set");
        } else {
            this.currentSection = str;
            k c = this.section.c(str);
            ArrayList arrayList = new ArrayList();
            Iterator<m> it = c.g().iterator();
            while (it.hasNext()) {
                m next = it.next();
                if (next.a() == f) {
                    arrayList.add(next);
                }
            }
            int size = arrayList.size();
            ArrayList arrayList2 = ((Float) this.loadingMidPoint.first).floatValue() == f ? new ArrayList(arrayList.subList(((Integer) this.loadingMidPoint.second).intValue(), size)) : arrayList;
            this.loadingMidPoint = new Pair<>(Float.valueOf(f), Integer.valueOf(size));
            if (this.controller.a(str)) {
                if (this.instreamAdListener != null) {
                    this.instreamAdListener.onComplete(str, this);
                }
            } else if (!arrayList2.isEmpty()) {
                this.controller.a(c, arrayList2);
            } else if ("midroll".equals(str) && !c.j().isEmpty()) {
                loadMidPoint(c, f);
            } else if (!c.i().isEmpty()) {
                loadDoAfterService(c.l(), str);
            } else if (this.instreamAdListener != null) {
                this.instreamAdListener.onComplete(str, this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadMidPoint(k kVar, float f) {
        ArrayList arrayList = new ArrayList();
        ArrayList<d> j = kVar.j();
        Iterator<d> it = j.iterator();
        while (it.hasNext()) {
            d next = it.next();
            if (next.f() == f) {
                arrayList.add(next);
            }
        }
        if (!arrayList.isEmpty()) {
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                d dVar = (d) it2.next();
                if (j.contains(dVar)) {
                    kVar.j().remove(dVar);
                }
            }
            com.my.target.core.async.commands.b<c> a = com.my.target.core.factories.b.a(this.adData, arrayList, this.params, this.context);
            a.a(this.midPointServiceListener);
            a.b();
            return;
        }
        Tracer.d("There is no one midpoint service for point " + f);
        loadDoAfterService(kVar.l(), kVar.e());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadDoAfterService(d dVar, String str) {
        if (dVar == null) {
            if (this.instreamAdListener != null) {
                this.instreamAdListener.onComplete(str, this);
                return;
            }
            return;
        }
        this.doAfterPosition = this.section.c(this.currentSection).b();
        Tracer.d("loading doAfter, pos = " + this.doAfterPosition);
        ArrayList arrayList = new ArrayList();
        arrayList.add(dVar);
        com.my.target.core.async.commands.b<c> a = com.my.target.core.factories.b.a(this.adData, arrayList, this.params, this.context);
        a.a(this.doAfterServiceListener);
        a.b();
    }

    /* loaded from: classes2.dex */
    public static class InstreamAdBanner {
        public final boolean allowClose;
        public final float allowCloseDelay;
        public String ctaText;
        public final float duration;
        public final int videoHeight;
        public final int videoWidth;

        public InstreamAdBanner(boolean z, float f, float f2, int i, int i2) {
            this.allowClose = z;
            this.allowCloseDelay = f;
            this.duration = f2;
            this.videoHeight = i2;
            this.videoWidth = i;
        }
    }
}
