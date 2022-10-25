package com.my.target.nativeads.views;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.util.StateSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.my.target.nativeads.NativeAppwallAd;
import com.my.target.nativeads.banners.NativeAppwallBanner;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
/* loaded from: classes2.dex */
public class AppwallAdView extends FrameLayout implements ViewTreeObserver.OnGlobalLayoutListener, AbsListView.OnScrollListener, AdapterView.OnItemClickListener {
    private BannerClickListener bannerClickListener;
    private BannerVisibilityListener bannerVisibilityListener;
    private ListView listView;
    private HashMap<String, Boolean> viewMap;
    private ViewTreeObserver viewTreeObserver;

    /* loaded from: classes2.dex */
    public interface BannerClickListener {
        void onBannerClick(AppwallAdTeaserView appwallAdTeaserView);
    }

    /* loaded from: classes2.dex */
    public interface BannerVisibilityListener {
        void onBannersShown(List<NativeAppwallBanner> list);
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView absListView, int i) {
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        countVisibleBanners();
    }

    public AppwallAdView(Context context) {
        super(context);
        this.viewMap = new HashMap<>();
        initLayout(context);
        setVerticalFadingEdgeEnabled(false);
        setBackgroundColor(-1);
    }

    private void initLayout(Context context) {
        this.listView = new ListView(context);
        this.listView.setDividerHeight(0);
        this.listView.setVerticalFadingEdgeEnabled(false);
        this.listView.setOnItemClickListener(this);
        this.listView.setOnScrollListener(this);
        this.listView.setPadding(0, (int) TypedValue.applyDimension(1, 4.0f, context.getResources().getDisplayMetrics()), 0, (int) TypedValue.applyDimension(1, 4.0f, context.getResources().getDisplayMetrics()));
        this.listView.setClipToPadding(false);
        addView(this.listView, -1, -1);
        this.listView.setBackgroundColor(-1118482);
    }

    public void setupView(NativeAppwallAd nativeAppwallAd) {
        this.listView.setAdapter((ListAdapter) new AppwallAdapter(getContext(), nativeAppwallAd.getBanners()));
    }

    public void notifyDataSetChanged() {
        if (this.listView != null) {
            ((AppwallAdapter) this.listView.getAdapter()).notifyDataSetChanged();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        countVisibleBanners();
        this.viewTreeObserver = getViewTreeObserver();
        if (this.viewTreeObserver.isAlive()) {
            this.viewTreeObserver.addOnGlobalLayoutListener(this);
        }
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        countVisibleBanners();
    }

    private void countVisibleBanners() {
        if (this.listView != null && this.listView.getAdapter() != null) {
            int firstVisiblePosition = this.listView.getFirstVisiblePosition();
            int lastVisiblePosition = this.listView.getLastVisiblePosition();
            ArrayList arrayList = new ArrayList();
            for (int i = firstVisiblePosition; i <= lastVisiblePosition; i++) {
                NativeAppwallBanner nativeAppwallBanner = (NativeAppwallBanner) this.listView.getAdapter().getItem(i);
                if (this.viewMap.get(nativeAppwallBanner.getId()) == null) {
                    arrayList.add(nativeAppwallBanner);
                    this.viewMap.put(nativeAppwallBanner.getId(), true);
                }
            }
            if (arrayList.size() > 0 && this.bannerVisibilityListener != null) {
                this.bannerVisibilityListener.onBannersShown(arrayList);
            }
        }
    }

    public void removeBanners() {
        this.listView.setAdapter((ListAdapter) null);
        if (this.viewTreeObserver != null && this.viewTreeObserver.isAlive()) {
            this.viewTreeObserver.removeGlobalOnLayoutListener(this);
        }
    }

    public void setBannerVisibilityListener(BannerVisibilityListener bannerVisibilityListener) {
        this.bannerVisibilityListener = bannerVisibilityListener;
    }

    public void setBannerClickListener(BannerClickListener bannerClickListener) {
        this.bannerClickListener = bannerClickListener;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        AppwallCardPlaceholder appwallCardPlaceholder = (AppwallCardPlaceholder) view;
        if (this.bannerClickListener != null) {
            this.bannerClickListener.onBannerClick(appwallCardPlaceholder.getView());
        }
    }

    /* loaded from: classes2.dex */
    public class AppwallAdapter extends ArrayAdapter<NativeAppwallBanner> {
        public AppwallAdapter(Context context, List<NativeAppwallBanner> list) {
            super(context, 0, list);
        }

        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        public View getView(int i, View view, ViewGroup viewGroup) {
            NativeAppwallBanner item = getItem(i);
            View appwallCardPlaceholder = view == null ? new AppwallCardPlaceholder(new AppwallAdTeaserView(getContext()), getContext()) : view;
            ((AppwallCardPlaceholder) appwallCardPlaceholder).getView().setNativeAppwallBanner(item);
            return appwallCardPlaceholder;
        }
    }

    /* loaded from: classes2.dex */
    public static class AppwallCardPlaceholder extends FrameLayout {
        private LinearLayout rootLayout;
        private AppwallAdTeaserView view;

        public AppwallCardPlaceholder(AppwallAdTeaserView appwallAdTeaserView, Context context) {
            super(context);
            this.view = appwallAdTeaserView;
            int applyDimension = (int) TypedValue.applyDimension(1, 9.0f, context.getResources().getDisplayMetrics());
            int applyDimension2 = (int) TypedValue.applyDimension(1, 4.0f, context.getResources().getDisplayMetrics());
            int applyDimension3 = (int) TypedValue.applyDimension(1, 2.0f, context.getResources().getDisplayMetrics());
            this.rootLayout = new LinearLayout(context);
            this.rootLayout.setOrientation(1);
            this.rootLayout.setBackgroundColor(-1118482);
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
            layoutParams.setMargins(applyDimension, applyDimension2, applyDimension, applyDimension2);
            appwallAdTeaserView.setLayoutParams(layoutParams);
            this.rootLayout.addView(appwallAdTeaserView);
            if (Build.VERSION.SDK_INT >= 21) {
                appwallAdTeaserView.setElevation(applyDimension3);
                GradientDrawable gradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-1, -1});
                GradientDrawable gradientDrawable2 = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-1118482, -1118482});
                StateListDrawable stateListDrawable = new StateListDrawable();
                stateListDrawable.addState(new int[]{16842919}, gradientDrawable2);
                stateListDrawable.addState(StateSet.WILD_CARD, gradientDrawable);
                appwallAdTeaserView.setBackground(stateListDrawable);
            } else {
                View view = new View(context);
                LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, applyDimension2);
                view.setBackgroundDrawable(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-3355444, -1118482}));
                view.setLayoutParams(layoutParams2);
                this.rootLayout.addView(view);
                GradientDrawable gradientDrawable3 = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-1, -1});
                gradientDrawable3.setStroke(1, -3355444);
                GradientDrawable gradientDrawable4 = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-1118482, -1118482});
                gradientDrawable4.setStroke(1, -3355444);
                StateListDrawable stateListDrawable2 = new StateListDrawable();
                stateListDrawable2.addState(new int[]{16842919}, gradientDrawable4);
                stateListDrawable2.addState(StateSet.WILD_CARD, gradientDrawable3);
                appwallAdTeaserView.setBackgroundDrawable(stateListDrawable2);
                layoutParams.setMargins(0, applyDimension2, 0, 0);
                this.rootLayout.setPadding(applyDimension, 0, applyDimension, 0);
            }
            addView(this.rootLayout, -2, -2);
        }

        public AppwallAdTeaserView getView() {
            return this.view;
        }
    }
}
