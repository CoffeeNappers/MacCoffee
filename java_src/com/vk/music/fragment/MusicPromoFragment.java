package com.vk.music.fragment;

import android.app.Fragment;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.music.view.MusicPromoImage;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.account.AccountSetInfo;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.widget.PageIndicator;
/* loaded from: classes2.dex */
public class MusicPromoFragment extends Fragment implements ViewPager.OnPageChangeListener, View.OnClickListener, BackListener {
    private Adapter adapter = new Adapter(createItems());
    private TextView button;
    private PageIndicator pageIndicator;
    private ViewPager viewPager;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(MusicPromoFragment.class);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Item {
        @StringRes
        final int button;
        @DrawableRes
        final int image;
        @StringRes
        final int text;
        @StringRes
        final int title;

        public Item(@StringRes int title, @StringRes int text, @StringRes int button, @DrawableRes int image) {
            this.title = title;
            this.text = text;
            this.button = button;
            this.image = image;
        }
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.music_promo_fragment, container, false);
        this.viewPager = (ViewPager) view.findViewById(R.id.pager);
        this.viewPager.setAdapter(this.adapter);
        this.viewPager.addOnPageChangeListener(this);
        this.pageIndicator = (PageIndicator) view.findViewById(R.id.page_indicator);
        this.pageIndicator.setCountOfPages(this.adapter.getCount());
        this.button = (TextView) view.findViewById(R.id.button);
        this.button.setOnClickListener(this);
        return view;
    }

    @Override // android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.viewPager != null) {
            this.viewPager.setAdapter(this.adapter);
        } else {
            this.adapter.notifyDataSetChanged();
        }
    }

    @Override // android.app.Fragment
    public void onDestroyView() {
        this.viewPager.removeOnPageChangeListener(this);
        this.viewPager = null;
        this.pageIndicator = null;
        this.button = null;
        super.onDestroyView();
    }

    private static Item[] createItems() {
        Item[] items = {new Item(R.string.music_promo_title_1, R.string.music_promo_text_1, R.string.music_promo_button_1, R.drawable.music_promo_music), new Item(R.string.music_promo_title_2, R.string.music_promo_text_2, R.string.music_promo_button_2, R.drawable.music_promo_playlist), new Item(R.string.music_promo_title_3, R.string.music_promo_text_3, R.string.music_promo_button_3, R.drawable.music_promo_recommended), new Item(R.string.music_promo_title_4, R.string.music_promo_text_4, R.string.music_promo_button_4, R.drawable.music_promo_offline)};
        return items;
    }

    private void musicIntroWasShowed() {
        VKAccountManager.editCurrent().setMusicIntro(true).commit();
        new AccountSetInfo().setMusicIntro(true).exec();
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        musicIntroWasShowed();
        return false;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.button /* 2131755279 */:
                if (this.viewPager.getCurrentItem() == 3) {
                    getActivity().finish();
                    musicIntroWasShowed();
                    return;
                }
                this.viewPager.setCurrentItem(this.viewPager.getCurrentItem() + 1, true);
                return;
            default:
                return;
        }
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int position) {
        this.pageIndicator.setIndexOfCurrentPage(position, true);
        ViewUtils.setText(this.button, Integer.valueOf(this.adapter.items[position].button));
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
    }

    /* loaded from: classes2.dex */
    static class Adapter extends PagerAdapter {
        final Item[] items;

        public Adapter(Item[] items) {
            this.items = items;
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return this.items.length;
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            View view = LayoutInflater.from(container.getContext()).inflate(R.layout.music_promo_item, container, false);
            ViewUtils.setText((TextView) view.findViewById(R.id.title), Integer.valueOf(this.items[position].title));
            ViewUtils.setText((TextView) view.findViewById(R.id.text), Integer.valueOf(this.items[position].text));
            MusicPromoImage musicPromoImage = (MusicPromoImage) view.findViewById(R.id.image);
            musicPromoImage.initialize(R.drawable.music_promo_phone, this.items[position].image, R.drawable.music_promo_scrim_bottom);
            container.addView(view);
            return view;
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object object) {
            container.removeView((View) object);
        }
    }
}
