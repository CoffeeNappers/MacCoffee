package com.my.target.ads.instream;

import android.content.Context;
import android.util.Pair;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.instream.models.InstreamAdCompanionBanner;
import com.my.target.core.async.commands.b;
import com.my.target.core.controllers.a;
import com.my.target.core.facades.a;
import com.my.target.core.models.c;
import com.my.target.core.models.d;
import com.my.target.core.models.sections.g;
import com.my.target.core.models.sections.i;
import com.my.target.core.utils.n;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class InstreamAudioAd extends a {
    private float audioDuration;
    private InstreamAudioAdPlayer audioPlayer;
    private com.my.target.core.controllers.a controller;
    private String currentSection;
    private int doAfterPosition;
    private InstreamAudioAdListener instreamAudioAdListener;
    private Pair<Float, Integer> loadingMidPoint;
    private float[] midPoints;
    private g section;
    private float[] userMidPoints;
    private final b.a<c> doAfterServiceListener = new b.a<c>() { // from class: com.my.target.ads.instream.InstreamAudioAd.1
        @Override // com.my.target.core.async.commands.b.a
        public void onExecute(b<c> bVar, c cVar) {
            if (cVar == null) {
                if (InstreamAudioAd.this.instreamAudioAdListener != null) {
                    InstreamAudioAd.this.instreamAudioAdListener.onComplete(InstreamAudioAd.this.currentSection, InstreamAudioAd.this);
                }
            } else if (InstreamAudioAd.this.section != null && InstreamAudioAd.this.controller != null) {
                if (InstreamAudioAd.this.controller.a() == null) {
                    Tracer.d("Unable to start advertisement: player has not set");
                    return;
                }
                Tracer.d("starting doAfter");
                com.my.target.core.models.sections.c c = InstreamAudioAd.this.section.c(InstreamAudioAd.this.currentSection);
                int size = c.g().size();
                if (size <= InstreamAudioAd.this.doAfterPosition) {
                    InstreamAudioAd.this.loadDoAfterService(c.l(), InstreamAudioAd.this.currentSection);
                } else {
                    InstreamAudioAd.this.controller.b(c, c.g().subList(InstreamAudioAd.this.doAfterPosition, size));
                }
            } else {
                Tracer.d("Unable to start advertisement: not loaded yet");
            }
        }
    };
    private final b.a<c> midPointServiceListener = new b.a<c>() { // from class: com.my.target.ads.instream.InstreamAudioAd.2
        @Override // com.my.target.core.async.commands.b.a
        public void onExecute(b<c> bVar, c cVar) {
            if (cVar == null) {
                if (InstreamAudioAd.this.instreamAudioAdListener != null) {
                    InstreamAudioAd.this.instreamAudioAdListener.onComplete(InstreamAudioAd.this.currentSection, InstreamAudioAd.this);
                    return;
                }
                return;
            }
            InstreamAudioAd.this.startAtPoint(InstreamAudioAd.this.currentSection, ((Float) InstreamAudioAd.this.loadingMidPoint.first).floatValue());
        }
    };
    private a.InterfaceC0233a completeSectionListener = new a.InterfaceC0233a() { // from class: com.my.target.ads.instream.InstreamAudioAd.3
        @Override // com.my.target.core.controllers.a.InterfaceC0233a
        public void sectionCompleted(String str) {
            if (InstreamAudioAd.this.section != null) {
                com.my.target.core.models.sections.c c = InstreamAudioAd.this.section.c(str);
                if (!c.j().isEmpty()) {
                    InstreamAudioAd.this.loadMidPoint(c, ((Float) InstreamAudioAd.this.loadingMidPoint.first).floatValue());
                } else {
                    InstreamAudioAd.this.loadDoAfterService(c.l(), str);
                }
            } else if (InstreamAudioAd.this.instreamAudioAdListener != null) {
                InstreamAudioAd.this.instreamAudioAdListener.onComplete(str, InstreamAudioAd.this);
            }
        }
    };
    private float volume = 1.0f;

    /* loaded from: classes2.dex */
    public interface InstreamAudioAdBanner {
        String getAdText();

        float getDuration();

        List<InstreamAdCompanionBanner> getInstreamAdCompanionBanners();

        boolean isAllowSeek();

        boolean isAllowSkip();

        boolean isAllowTrackChange();
    }

    /* loaded from: classes2.dex */
    public interface InstreamAudioAdListener {
        void onBannerComplete(InstreamAudioAd instreamAudioAd, InstreamAudioAdBanner instreamAudioAdBanner);

        void onBannerStart(InstreamAudioAd instreamAudioAd, InstreamAudioAdBanner instreamAudioAdBanner);

        void onBannerTimeLeftChange(float f, float f2, InstreamAudioAd instreamAudioAd);

        void onComplete(String str, InstreamAudioAd instreamAudioAd);

        void onError(String str, InstreamAudioAd instreamAudioAd);

        void onLoad(InstreamAudioAd instreamAudioAd);

        void onNoAd(String str, InstreamAudioAd instreamAudioAd);
    }

    public float[] getMidPoints() {
        return this.midPoints;
    }

    public InstreamAudioAdPlayer getPlayer() {
        return this.audioPlayer;
    }

    public boolean isTrackingEnvironmentEnabled() {
        return this.params.f();
    }

    public void setListener(InstreamAudioAdListener instreamAudioAdListener) {
        if (this.controller != null) {
            this.controller.a(instreamAudioAdListener);
        }
        this.instreamAudioAdListener = instreamAudioAdListener;
    }

    public void setPlayer(InstreamAudioAdPlayer instreamAudioAdPlayer) {
        if (this.controller != null) {
            this.controller.a(instreamAudioAdPlayer);
        }
        this.audioPlayer = instreamAudioAdPlayer;
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

    public InstreamAudioAd(int i, CustomParams customParams, Context context) {
        this.context = context;
        this.params = new com.my.target.core.a(i, "instreamaudioads");
        this.params.a(customParams);
        this.params.i();
        this.loadingMidPoint = new Pair<>(Float.valueOf(0.0f), 0);
    }

    public void configureMidpoints(float f) {
        configureMidpoints(f, null);
    }

    public void configureMidpoints(float f, float[] fArr) {
        this.userMidPoints = fArr;
        this.audioDuration = f;
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

    public void handleCompanionClick(InstreamAdCompanionBanner instreamAdCompanionBanner) {
        if (this.controller != null) {
            this.controller.a(instreamAdCompanionBanner);
        }
    }

    public void handleCompanionShow(InstreamAdCompanionBanner instreamAdCompanionBanner) {
        if (this.controller != null) {
            this.controller.b(instreamAdCompanionBanner);
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
        if (this.instreamAudioAdListener != null) {
            i c = cVar.c("instreamaudioads");
            if (c != null && (c instanceof g)) {
                this.section = (g) c;
            }
            if (this.section != null) {
                this.midPoints = n.a(this.section.c("midroll"), this.userMidPoints, this.audioDuration);
                this.controller = new com.my.target.core.controllers.a(this);
                this.controller.a(cVar);
                this.controller.a(this.instreamAudioAdListener);
                this.controller.a(this.volume);
                this.controller.a(this.completeSectionListener);
                if (this.audioPlayer != null) {
                    this.controller.a(this.audioPlayer);
                }
                this.instreamAudioAdListener.onLoad(this);
                return;
            }
            this.instreamAudioAdListener.onNoAd("No ad", this);
        }
    }

    @Override // com.my.target.core.facades.a
    protected void onLoadError(String str) {
        if (this.instreamAudioAdListener != null) {
            this.instreamAudioAdListener.onNoAd(str, this);
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
            com.my.target.core.models.sections.c c = this.section.c(str);
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
            com.my.target.core.models.sections.c c = this.section.c(str);
            ArrayList arrayList = new ArrayList();
            Iterator<com.my.target.core.models.banners.c> it = c.g().iterator();
            while (it.hasNext()) {
                com.my.target.core.models.banners.c next = it.next();
                if (next.b() == f) {
                    arrayList.add(next);
                }
            }
            int size = arrayList.size();
            ArrayList arrayList2 = ((Float) this.loadingMidPoint.first).floatValue() == f ? new ArrayList(arrayList.subList(((Integer) this.loadingMidPoint.second).intValue(), size)) : arrayList;
            this.loadingMidPoint = new Pair<>(Float.valueOf(f), Integer.valueOf(size));
            if (this.controller.a(str)) {
                if (this.instreamAudioAdListener != null) {
                    this.instreamAudioAdListener.onComplete(str, this);
                }
            } else if (!arrayList2.isEmpty()) {
                this.controller.a(c, arrayList2);
            } else if ("midroll".equals(str) && !c.j().isEmpty()) {
                loadMidPoint(c, f);
            } else if (!c.i().isEmpty()) {
                loadDoAfterService(c.l(), str);
            } else if (this.instreamAudioAdListener != null) {
                this.instreamAudioAdListener.onComplete(str, this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadMidPoint(com.my.target.core.models.sections.c cVar, float f) {
        ArrayList arrayList = new ArrayList();
        ArrayList<d> j = cVar.j();
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
                    cVar.j().remove(dVar);
                }
            }
            b<c> a = com.my.target.core.factories.b.a(this.adData, arrayList, this.params, this.context);
            a.a(this.midPointServiceListener);
            a.b();
            return;
        }
        Tracer.d("There is no one midpoint service for point " + f);
        loadDoAfterService(cVar.l(), cVar.e());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadDoAfterService(d dVar, String str) {
        if (dVar == null) {
            if (this.instreamAudioAdListener != null) {
                this.instreamAudioAdListener.onComplete(str, this);
                return;
            }
            return;
        }
        this.doAfterPosition = this.section.c(this.currentSection).b();
        Tracer.d("loading doAfter, pos = " + this.doAfterPosition);
        ArrayList arrayList = new ArrayList();
        arrayList.add(dVar);
        b<c> a = com.my.target.core.factories.b.a(this.adData, arrayList, this.params, this.context);
        a.a(this.doAfterServiceListener);
        a.b();
    }
}
