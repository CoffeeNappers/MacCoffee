package com.vkontakte.android.ui.holder.gamepage;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.view.PagerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.GameCardActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.infiniteviewpager.InfinitePagerAdapter;
import com.vkontakte.android.ui.widget.ViewPagerInfinite;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class GameBannersHolder extends RecyclerHolder<ArrayList<ApiApplication>> {
    private final AppsAdapter appsAdapter;
    private final ViewPagerInfinite infiniteViewPager;
    @NonNull
    private final String visitSource;

    public GameBannersHolder(@NonNull Context context, @NonNull String visitSource) {
        super((int) R.layout.apps_banners, context);
        this.visitSource = visitSource;
        this.infiniteViewPager = (ViewPagerInfinite) $(R.id.pager);
        this.infiniteViewPager.setOffscreenPageLimit(2);
        this.appsAdapter = new AppsAdapter(this);
        this.infiniteViewPager.setAdapter(new InfinitePagerAdapter(this.appsAdapter));
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(ArrayList<ApiApplication> item) {
        this.appsAdapter.setApiApplications(item);
    }

    public ViewPagerInfinite getInfiniteViewPager() {
        return this.infiniteViewPager;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class AppsAdapter extends PagerAdapter {
        private ArrayList<ApiApplication> apiApplications = new ArrayList<>();
        @NonNull
        private final RecyclerHolder listHolder;

        public AppsAdapter(@NonNull RecyclerHolder listHolder) {
            this.listHolder = listHolder;
        }

        public void setApiApplications(ArrayList<ApiApplication> apiApplications) {
            this.apiApplications = apiApplications;
            notifyDataSetChanged();
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return this.apiApplications.size();
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            View view = LayoutInflater.from(container.getContext()).inflate(R.layout.apps_banners_item, container, false);
            VKImageView imageView = (VKImageView) view.findViewById(R.id.image);
            ApiApplication app = this.apiApplications.get(position);
            imageView.load(app.bannerBig);
            container.addView(view);
            view.setOnClickListener(GameBannersHolder$AppsAdapter$$Lambda$1.lambdaFactory$(this, app));
            return view;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$instantiateItem$0(ApiApplication app, View v) {
            GameCardActivity.openApp(v.getContext(), GameBannersHolder.this.visitSource, UserNotification.LAYOUT_NEWSFEED_BANNER, this.apiApplications, this.apiApplications.indexOf(app));
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object view) {
            container.removeView((View) view);
        }
    }
}
