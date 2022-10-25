package com.vkontakte.android.fragments.stickers;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.core.util.ToastUtils;
import com.vk.imageloader.view.VKHorizontalParallaxImageView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.FragmentDialogActivity;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.store.GetStickerStockItemById;
import com.vkontakte.android.api.store.GetStickerStockItemByStickerId;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.CircularProgressDrawable;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.ui.infiniteviewpager.InfinitePagerAdapter;
import com.vkontakte.android.ui.widget.ViewPagerInfinite;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class StickersDetailsFragment extends AppKitFragment implements ActivityResulter, View.OnClickListener, ViewPager.OnPageChangeListener {
    private static final String EXTRA_DATA = "data";
    StickerStockItem mData;
    PagerDotsView mDots;
    View mError;
    TextView mInfo;
    PurchasesManager<StickerStockItem> mManager;
    View mOkButton;
    ViewPagerInfinite mPager;
    VKHorizontalParallaxImageView mParallaxBackground;
    ProgressBar mProgress;
    TextView mStickerButton;
    TextView mSubtitle;
    TextView mTitle;
    BroadcastReceiver mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.stickers.StickersDetailsFragment.3
        {
            StickersDetailsFragment.this = this;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context arg0, Intent intent) {
            boolean z;
            String action = intent.getAction();
            switch (action.hashCode()) {
                case 1592808474:
                    if (action.equals(Stickers.ACTION_STICKERS_DOWNLOAD_PROGRESS)) {
                        z = true;
                        break;
                    }
                    z = true;
                    break;
                case 1791721521:
                    if (action.equals(Stickers.ACTION_STICKERS_UPDATED)) {
                        z = false;
                        break;
                    }
                    z = true;
                    break;
                default:
                    z = true;
                    break;
            }
            switch (z) {
                case false:
                    StickerStockItem item = (StickerStockItem) intent.getParcelableExtra(Stickers.EXTRA_ITEM);
                    if (StickersDetailsFragment.this.mData.equals(item)) {
                        StickersDetailsFragment.this.mData = item;
                        StickersDetailsFragment.this.bindData(StickersDetailsFragment.this.mData);
                        return;
                    }
                    return;
                case true:
                    if (StickersDetailsFragment.this.mData.id == intent.getIntExtra("id", -1)) {
                        StickersDetailsFragment.this.bindData(StickersDetailsFragment.this.mData);
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    };
    boolean mCloseAfterDownload = false;

    public static void show(StickerStockItem item, Context activity) {
        Bundle args = new Bundle();
        args.putParcelable("data", item);
        new Navigator(StickersDetailsFragment.class, new TabletDialogActivity.Builder(FragmentDialogActivity.class).setMaxWidth(V.dp(360.0f)).setMinSpacing(V.dp(32.0f)).setGravity(17).windowBackgroundResource(17170443).windowAnimationResource(R.style.StickerDialogAnim), args).go(activity);
    }

    public static void show(int stickerPackId, final String referrer, final Context activity) {
        new GetStickerStockItemById(stickerPackId).setCallback(new SimpleCallback<StickerStockItem>(activity) { // from class: com.vkontakte.android.fragments.stickers.StickersDetailsFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(StickerStockItem result) {
                result.referrer = referrer;
                StickersDetailsFragment.show(result, activity);
            }
        }).wrapProgress(activity).exec(activity);
    }

    public static void showByStickerId(int stickerId, final String referrer, final Activity activity, final boolean reloadIfPurchased) {
        new GetStickerStockItemByStickerId(stickerId).setCallback(new SimpleCallback<StickerStockItem>(activity) { // from class: com.vkontakte.android.fragments.stickers.StickersDetailsFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(StickerStockItem result) {
                result.referrer = referrer;
                if (result != null && reloadIfPurchased && result.purchased && result.active) {
                    Stickers.get().reload();
                }
                StickersDetailsFragment.show(result, activity);
            }
        }).wrapProgress(activity).exec((Context) activity);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        ((ResulterProvider) activity).registerActivityResult(this);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mData = (StickerStockItem) getArguments().getParcelable("data");
        this.mManager = new PurchasesManager<>(this);
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.sticker_details, container, false);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.mStickerButton = (TextView) view.findViewById(R.id.sticker_button);
        this.mOkButton = view.findViewById(R.id.sticker_ok);
        this.mProgress = (ProgressBar) view.findViewById(R.id.sticker_progress);
        this.mError = view.findViewById(R.id.sticker_error);
        this.mPager = (ViewPagerInfinite) view.findViewById(R.id.pager);
        this.mParallaxBackground = (VKHorizontalParallaxImageView) view.findViewById(R.id.iv_parallax_bg);
        this.mTitle = (TextView) view.findViewById(R.id.title);
        this.mSubtitle = (TextView) view.findViewById(R.id.subtitle);
        this.mInfo = (TextView) view.findViewById(R.id.info);
        this.mDots = (PagerDotsView) view.findViewById(R.id.pager_dots_wrap);
        this.mStickerButton.setOnClickListener(this);
        this.mError.setOnClickListener(this);
        this.mPager.setAdapter(new InfinitePagerAdapter(new SlidePagerAdapter()));
        this.mPager.addOnPageChangeListener(this);
        this.mDots.setViewPager(this.mPager);
        CircularProgressDrawable pd = new CircularProgressDrawable(false);
        pd.setColors(-986896, -4210753);
        pd.setThickness(2.0f);
        pd.setPad(false);
        pd.setDimBackground(false);
        this.mProgress.setProgressDrawable(pd);
        this.mParallaxBackground.load(this.mData.getServerBackgroundURL());
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStart() {
        super.onStart();
        IntentFilter filter = new IntentFilter();
        filter.addAction(Stickers.ACTION_STICKERS_UPDATED);
        filter.addAction(Stickers.ACTION_STICKERS_DOWNLOAD_PROGRESS);
        getActivity().registerReceiver(this.mReceiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        bindData(this.mData);
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.mPager.onResume();
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        this.mPager.onPause();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStop() {
        super.onStop();
        getActivity().unregisterReceiver(this.mReceiver);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.mStickerButton = null;
        this.mOkButton = null;
        this.mProgress = null;
        this.mError = null;
        this.mPager = null;
        this.mTitle = null;
        this.mSubtitle = null;
        this.mInfo = null;
        this.mDots = null;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        ((ResulterProvider) getActivity()).unregisterActivityResult(this);
        super.onDetach();
    }

    @Override // android.app.Fragment, com.vkontakte.android.ui.ActivityResulter
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (this.mManager != null) {
            this.mManager.onActivityResult(reqCode, resCode, data);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        v.setEnabled(false);
        v.postDelayed(StickersDetailsFragment$$Lambda$1.lambdaFactory$(v), 300L);
        if (StickerStoreListHolder.getIsPurchaseNotAllowedWithReason(this.mData)) {
            ToastUtils.showToast(this.mData.no_purchase_reason);
        } else if (!this.mData.purchased) {
            this.mManager.purchase(this.mData, StickersDetailsFragment$$Lambda$2.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$onClick$1(StickerStockItem item) {
        this.mCloseAfterDownload = true;
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int pos) {
        this.mDots.setSelection(pos);
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int pos, float offset, int offsetPixels) {
        float realCount = ((InfinitePagerAdapter) this.mPager.mo1110getAdapter()).getRealCount();
        float position = pos + offset;
        this.mParallaxBackground.setOffset((-position) / (realCount - 1.0f));
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
        this.mPager.onPause();
        if (state == 0) {
            this.mPager.onResume();
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            super.onSaveInstanceState(savedInstanceState);
        }
    }

    void bindData(StickerStockItem data) {
        this.mTitle.setText(data.title);
        this.mSubtitle.setText(data.author);
        this.mInfo.setText(data.description);
        StickerStoreListHolder.bindButtons(data, this.mStickerButton, this.mOkButton, this.mProgress, this.mError);
        if (this.mCloseAfterDownload && data.downloaded) {
            new Handler(getActivity().getMainLooper()).postDelayed(StickersDetailsFragment$$Lambda$3.lambdaFactory$(this), 1000L);
        }
    }

    public /* synthetic */ void lambda$bindData$2() {
        if (getActivity() != null && isVisible()) {
            getActivity().finish();
        }
    }

    /* loaded from: classes3.dex */
    private class SlidePagerAdapter extends PagerAdapter {
        private SlidePagerAdapter() {
            StickersDetailsFragment.this = r1;
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return StickersDetailsFragment.this.mData.demo_photos_560.length;
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View v, Object o) {
            return v == o;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            VKImageView view = new VKImageView(StickersDetailsFragment.this.getActivity());
            view.getHierarchy().setActualImageScaleType(ScalingUtils.ScaleType.FIT_CENTER);
            view.load(StickersDetailsFragment.this.mData.demo_photos_560[position]);
            container.addView(view);
            return view;
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object object) {
            container.removeView((View) object);
        }
    }

    /* loaded from: classes3.dex */
    public static class PagerDotsView extends LinearLayout {
        public static final LinearLayout.LayoutParams LP = new LinearLayout.LayoutParams(Global.scale(12.0f), Global.scale(12.0f));

        static {
            LinearLayout.LayoutParams layoutParams = LP;
            LinearLayout.LayoutParams layoutParams2 = LP;
            int scale = Global.scale(1.0f);
            layoutParams2.rightMargin = scale;
            layoutParams.leftMargin = scale;
        }

        public PagerDotsView(Context context) {
            super(context);
        }

        public PagerDotsView(Context context, AttributeSet attrs) {
            super(context, attrs);
        }

        public void setSelection(int position) {
            int position2 = position % getChildCount();
            int i = 0;
            while (i < getChildCount()) {
                getChildAt(i).setSelected(i == position2);
                i++;
            }
        }

        public void setViewPager(ViewPager pager) {
            int total = ((InfinitePagerAdapter) pager.mo1110getAdapter()).getRealCount();
            int item = pager.getCurrentItem();
            int i = 0;
            while (i < total) {
                ImageView dot = new ImageView(getContext());
                Drawable drawable = getResources().getDrawable(R.drawable.sticker_pager_dot);
                dot.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                dot.setImageDrawable(drawable);
                dot.setSelected(i == item);
                addView(dot, LP);
                i++;
            }
        }
    }
}
