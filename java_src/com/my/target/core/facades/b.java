package com.my.target.core.facades;

import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.instream.InstreamAd;
import com.my.target.core.controllers.c;
import com.my.target.core.models.i;
import com.my.target.core.net.b;
import com.my.target.core.utils.a;
import com.my.target.core.utils.l;
import com.my.target.core.utils.n;
import com.my.target.nativeads.banners.NativePromoCard;
import com.my.target.nativeads.models.ImageData;
import com.my.target.nativeads.models.VideoData;
import com.my.target.nativeads.views.MediaAdView;
import com.my.target.nativeads.views.PromoCardRecyclerView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
/* compiled from: AbstractNativeAd.java */
/* loaded from: classes2.dex */
public abstract class b<T> extends com.my.target.core.facades.a {
    private static final float minViewAlpha = 0.5f;
    private static final float minVisibleSquare = 0.6f;
    @Nullable
    protected com.my.target.core.models.banners.h banner;
    private boolean isShown;
    @Nullable
    private a listener;
    @Nullable
    private com.my.target.core.controllers.c nativeAdVideoController;
    @Nullable
    private WeakReference<PromoCardRecyclerView> promoCardRecyclerViewWeakReference;
    private final List<String> supportedTypes;
    @Nullable
    private WeakReference<View> viewWeakReference;
    @Nullable
    private ArrayList<NativePromoCard> visibleCards;
    private final c.a statisticsListener = new c.a() { // from class: com.my.target.core.facades.b.1
        @Override // com.my.target.core.controllers.c.a
        public final void a() {
            if (b.this.adData != null && b.this.banner != null && b.this.banner.a() != null) {
                com.my.target.core.models.c.c(b.this.banner.a(), b.this.context);
            }
        }

        @Override // com.my.target.core.controllers.c.a
        public final void b() {
            if (b.this.adData != null && b.this.banner != null && b.this.banner.a() != null) {
                com.my.target.core.models.c.a(b.this.banner.a(), "fullscreenOn", b.this.context);
            }
        }

        @Override // com.my.target.core.controllers.c.a
        public final void c() {
            if (b.this.adData != null && b.this.banner != null && b.this.banner.a() != null) {
                com.my.target.core.models.c.a(b.this.banner.a(), "fullscreenOff", b.this.context);
            }
        }

        @Override // com.my.target.core.controllers.c.a
        public final void d() {
            if (b.this.adData != null && b.this.banner != null && b.this.banner.a() != null) {
                com.my.target.core.models.c.a(b.this.banner.a(), "playbackPaused", b.this.context);
            }
        }

        @Override // com.my.target.core.controllers.c.a
        public final void e() {
            if (b.this.adData != null && b.this.banner != null && b.this.banner.a() != null) {
                com.my.target.core.models.c.a(b.this.banner.a(), "playbackResumed", b.this.context);
            }
        }

        @Override // com.my.target.core.controllers.c.a
        public final void f() {
            if (b.this.adData != null && b.this.banner != null && b.this.banner.a() != null) {
                com.my.target.core.models.c.a(b.this.banner.a(), "volumeOff", b.this.context);
            }
        }

        @Override // com.my.target.core.controllers.c.a
        public final void g() {
            if (b.this.adData != null && b.this.banner != null && b.this.banner.a() != null) {
                com.my.target.core.models.c.a(b.this.banner.a(), "volumeOn", b.this.context);
            }
        }

        @Override // com.my.target.core.controllers.c.a
        public final void a(float f, HashSet<i> hashSet) {
            if (b.this.adData != null && b.this.banner != null && b.this.banner.a() != null) {
                com.my.target.core.models.c.a(hashSet, f, b.this.context);
            }
        }
    };
    private final b.a imageListener = new b.a() { // from class: com.my.target.core.facades.b.2
        @Override // com.my.target.core.net.b.a
        public final void onLoad() {
            b.this.doLoadSuccess();
        }
    };
    private boolean autoLoadImages = false;
    private final PromoCardRecyclerView.PromoCardListener promoCardListener = new PromoCardRecyclerView.PromoCardListener() { // from class: com.my.target.core.facades.b.3
        @Override // com.my.target.nativeads.views.PromoCardRecyclerView.PromoCardListener
        public final void onClick(View view, NativePromoCard nativePromoCard) {
            Tracer.d("Click on native card received");
            if (b.this.banner != null && b.this.adData != null) {
                if (b.this.listener != null) {
                    b.this.listener.onClick(b.this);
                }
                b.this.adData.a((com.my.target.core.models.banners.d) nativePromoCard, b.this.context);
                com.my.target.core.models.c.a(b.this.banner, "click", b.this.context);
            }
        }

        @Override // com.my.target.nativeads.views.PromoCardRecyclerView.PromoCardListener
        public final void onCardChange(View view, NativePromoCard nativePromoCard) {
            if (b.this.visibleCards != null && !b.this.visibleCards.contains(nativePromoCard) && b.this.isShown) {
                b.this.visibleCards.add(nativePromoCard);
                com.my.target.core.models.c.c((com.my.target.core.models.banners.d) nativePromoCard, b.this.context);
            }
        }
    };
    private final a.InterfaceC0236a showHelper = new a.InterfaceC0236a() { // from class: com.my.target.core.facades.b.4
        @Override // com.my.target.core.utils.a.InterfaceC0236a
        public final boolean a() {
            View view = null;
            boolean z = b.this.nativeAdVideoController != null;
            if (b.this.viewWeakReference != null) {
                view = (View) b.this.viewWeakReference.get();
            }
            if ((b.this.isShown && !z) || view == null) {
                if (view == null && b.this.nativeAdVideoController != null) {
                    b.this.nativeAdVideoController.b();
                }
                return true;
            } else if (b.this.adData == null || b.this.banner == null || view.getVisibility() != 0 || view.getParent() == null) {
                return false;
            } else {
                if (Build.VERSION.SDK_INT >= 11 && view.getAlpha() < 0.5f) {
                    return false;
                }
                Rect rect = new Rect();
                if (!view.getGlobalVisibleRect(rect)) {
                    return false;
                }
                if (rect.height() * rect.width() >= view.getHeight() * view.getWidth() * 0.6000000238418579d) {
                    b.this.handleShow();
                    if (!z) {
                        return true;
                    }
                    b.this.nativeAdVideoController.a();
                    return false;
                } else if (!z) {
                    return false;
                } else {
                    b.this.nativeAdVideoController.d();
                    return false;
                }
            }
        }
    };
    private final View.OnClickListener viewClickListener = new View.OnClickListener() { // from class: com.my.target.core.facades.b.5
        @Override // android.view.View.OnClickListener
        public final void onClick(View view) {
            Tracer.d("Click received by native ad");
            if (b.this.banner != null && b.this.adData != null) {
                if (b.this.listener != null) {
                    b.this.listener.onClick(b.this);
                }
                b.this.adData.a(b.this.banner, b.this.context);
                if (b.this.promoCardRecyclerViewWeakReference != null && b.this.promoCardRecyclerViewWeakReference.get() != null && ((PromoCardRecyclerView) b.this.promoCardRecyclerViewWeakReference.get()).getCurrentCard() != null) {
                    com.my.target.core.models.c.a((com.my.target.core.models.banners.d) ((PromoCardRecyclerView) b.this.promoCardRecyclerViewWeakReference.get()).getCurrentCard(), "click", b.this.context);
                }
            }
        }
    };

    /* compiled from: AbstractNativeAd.java */
    /* loaded from: classes2.dex */
    public interface a<T extends b> {
        void onClick(T t);

        void onLoad(T t);

        void onNoAd(String str, T t);
    }

    public final T getBanner() {
        return (T) this.banner;
    }

    public boolean isAutoLoadImages() {
        return this.autoLoadImages;
    }

    public void setAutoLoadImages(boolean z) {
        this.autoLoadImages = z;
    }

    public void setListener(@Nullable a aVar) {
        this.listener = aVar;
    }

    public b(int i, List<String> list, Context context, CustomParams customParams) {
        this.supportedTypes = list;
        com.my.target.core.a aVar = new com.my.target.core.a(i, "nativeads");
        aVar.a(customParams);
        aVar.h();
        init(aVar, context);
    }

    @Override // com.my.target.core.facades.a
    protected void onLoad(com.my.target.core.models.c cVar) {
        if (cVar.g()) {
            com.my.target.core.models.sections.i c = cVar.c("nativeads");
            if (c instanceof com.my.target.core.models.sections.h) {
                com.my.target.core.models.sections.h hVar = (com.my.target.core.models.sections.h) c;
                if (hVar.b() > 0) {
                    Iterator<com.my.target.core.models.banners.h> it = hVar.g().iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        com.my.target.core.models.banners.h next = it.next();
                        if (this.supportedTypes.contains(next.getType())) {
                            this.banner = next;
                            break;
                        }
                        String str = "Banner " + next.getId() + " with type '" + next.getType() + "' does not matches for Ad types '" + this.supportedTypes + "'";
                        Tracer.d(str);
                        com.my.target.core.async.a.a(str, b.class.getName(), 40, getClass().getSimpleName(), cVar.b(), this.context);
                    }
                    if (this.banner == null) {
                        String str2 = "No supported banners found for Ad types '" + this.supportedTypes + "'";
                        Tracer.d(str2);
                        com.my.target.core.async.a.a(str2, b.class.getName(), 40, getClass().getSimpleName(), cVar.b(), this.context);
                        doLoadFailure(null);
                        return;
                    }
                    List<NativePromoCard> cards = this.banner.getCards();
                    if (cards != null && !cards.isEmpty()) {
                        this.visibleCards = new ArrayList<>();
                    }
                    if (this.autoLoadImages) {
                        doAutoLoadImages();
                        return;
                    } else {
                        doLoadSuccess();
                        return;
                    }
                }
            }
        }
        doLoadFailure(null);
    }

    private void doLoadFailure(String str) {
        if (str == null) {
            str = "No ad";
        }
        if (this.listener != null) {
            this.listener.onNoAd(str, this);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doLoadSuccess() {
        if (this.listener != null) {
            this.listener.onLoad(this);
        }
    }

    private void doAutoLoadImages() {
        ArrayList arrayList = new ArrayList();
        if (this.banner != null) {
            if (this.banner.getImage() != null) {
                arrayList.add(this.banner.getImage());
            }
            if (this.banner.getIcon() != null) {
                arrayList.add(this.banner.getIcon());
            }
            for (com.my.target.core.models.banners.i iVar : this.banner.m()) {
                if (iVar.getImage() != null) {
                    arrayList.add(iVar.getImage());
                }
            }
            Tracer.d("Starting load: " + arrayList.size() + " urls");
            if (arrayList.size() > 0) {
                com.my.target.core.net.b.a().a(arrayList, this.context, this.imageListener);
            } else {
                doLoadSuccess();
            }
        }
    }

    @Override // com.my.target.core.facades.a
    protected void onLoadError(String str) {
        doLoadFailure(str);
    }

    public final void handleClick() {
        if (this.banner != null) {
            this.adData.a(this.banner, this.context);
            if (this.listener != null) {
                this.listener.onClick(this);
            }
        }
    }

    public final void handleShow() {
        NativePromoCard currentCard;
        if (!this.isShown && this.banner != null) {
            com.my.target.core.models.c.c(this.banner, this.context);
            this.isShown = true;
            if (this.promoCardRecyclerViewWeakReference != null && this.promoCardRecyclerViewWeakReference.get() != null && this.visibleCards != null && (currentCard = this.promoCardRecyclerViewWeakReference.get().getCurrentCard()) != null) {
                this.visibleCards.add(currentCard);
                com.my.target.core.models.c.c((com.my.target.core.models.banners.d) currentCard, this.context);
            }
        }
    }

    public final void registerView(View view) {
        View view2 = null;
        if (this.viewWeakReference != null) {
            view2 = this.viewWeakReference.get();
        }
        if (view != view2) {
            unregisterView();
            this.viewWeakReference = new WeakReference<>(view);
            doRegisterView(view);
            if (!this.showHelper.a()) {
                com.my.target.core.utils.a.a().a(this.showHelper);
            }
        }
    }

    public final void unregisterView() {
        if (this.promoCardRecyclerViewWeakReference != null) {
            if (this.promoCardRecyclerViewWeakReference.get() != null) {
                this.promoCardRecyclerViewWeakReference.get().setOnPromoCardListener(null);
            }
            this.promoCardRecyclerViewWeakReference = null;
        }
        if (this.nativeAdVideoController != null) {
            this.nativeAdVideoController.b();
        }
        if (this.viewWeakReference != null) {
            View view = this.viewWeakReference.get();
            if (view != null) {
                doUnregisterView(view);
            }
            com.my.target.core.utils.a.a().b(this.showHelper);
            this.viewWeakReference.clear();
            this.viewWeakReference = null;
        }
    }

    private void doRegisterView(View view) {
        VideoData a2;
        if (view instanceof PromoCardRecyclerView) {
            this.promoCardRecyclerViewWeakReference = new WeakReference<>((PromoCardRecyclerView) view);
            this.promoCardRecyclerViewWeakReference.get().setOnPromoCardListener(this.promoCardListener);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (viewGroup instanceof MediaAdView) {
                if (this.banner != null) {
                    MediaAdView mediaAdView = (MediaAdView) viewGroup;
                    mediaAdView.getProgressBarView().setVisibility(8);
                    mediaAdView.getPlayButtonView().setVisibility(8);
                    ImageData image = this.banner.getImage();
                    if (image != null) {
                        mediaAdView.setPlaceHolderDimension(image.getWidth(), image.getHeight());
                    }
                    if (l.c(14) && this.banner.a() != null && (a2 = n.a(this.banner.a().m(), InstreamAd.DEFAULT_VIDEO_QUALITY)) != null) {
                        if (this.nativeAdVideoController == null) {
                            this.nativeAdVideoController = new com.my.target.core.controllers.c(this.banner, a2);
                            this.nativeAdVideoController.a(this.viewClickListener);
                            this.nativeAdVideoController.a(this.statisticsListener);
                        }
                        this.nativeAdVideoController.a(mediaAdView);
                        return;
                    }
                } else {
                    return;
                }
            }
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                doRegisterView(viewGroup.getChildAt(i));
            }
        }
        view.setOnClickListener(this.viewClickListener);
    }

    private void doUnregisterView(View view) {
        if (!(view instanceof PromoCardRecyclerView)) {
            if ((view instanceof ViewGroup) && !(view instanceof MediaAdView)) {
                ViewGroup viewGroup = (ViewGroup) view;
                for (int i = 0; i < viewGroup.getChildCount(); i++) {
                    doUnregisterView(viewGroup.getChildAt(i));
                }
            }
            view.setOnClickListener(null);
        }
    }
}
