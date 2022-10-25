package com.my.target.core.ui.views.fsslider;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import com.my.target.core.models.banners.f;
import com.my.target.core.utils.l;
import com.my.target.nativeads.models.ImageData;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class FSSliderRecyclerView extends RecyclerView {
    public static final int DEFAULT_ELEMENT_VIEWTYPE = 0;
    public static final int FIRST_ELEMENT_VIEWTYPE = 1;
    public static final int LAST_ELEMENT_VIEWTYPE = 2;
    private final View.OnClickListener cardClickListener;
    private int displayedCardNum;
    @Nullable
    private ArrayList<f> fsImageBanners;
    @Nullable
    private FSSliderCardListener fsSliderCardListener;
    private final FSCardRecyclerLayoutManager layoutManager;
    private boolean moving;

    /* loaded from: classes2.dex */
    public interface FSSliderCardListener {
        void onCardChange(int i, f fVar);

        void onClick(View view, f fVar);
    }

    public void setBanners(ArrayList<f> arrayList, int i) {
        int width;
        int height;
        Bitmap bitmap;
        Bitmap bitmap2;
        this.fsImageBanners = arrayList;
        Display defaultDisplay = ((WindowManager) getContext().getSystemService("window")).getDefaultDisplay();
        Point point = new Point();
        if (l.c(13)) {
            defaultDisplay.getSize(point);
            int i2 = point.x;
            int i3 = point.y;
            width = i2;
            height = i3;
        } else {
            width = defaultDisplay.getWidth();
            height = defaultDisplay.getHeight();
        }
        if (!arrayList.isEmpty()) {
            f fVar = arrayList.get(0);
            if (width > height) {
                if (fVar.c() != null && !fVar.c().isEmpty() && (bitmap2 = fVar.c().get(0).getBitmap()) != null) {
                    this.layoutManager.setFirstCardDimensions(bitmap2.getWidth(), bitmap2.getHeight());
                }
            } else if (fVar.b() != null && !fVar.b().isEmpty() && (bitmap = fVar.b().get(0).getBitmap()) != null) {
                this.layoutManager.setFirstCardDimensions(bitmap.getWidth(), bitmap.getHeight());
            }
        }
        FSSliderCardAdapter fSSliderCardAdapter = new FSSliderCardAdapter(arrayList, i, getResources());
        fSSliderCardAdapter.setClickListener(this.cardClickListener);
        setLayoutManager(this.layoutManager);
        super.setAdapter(fSSliderCardAdapter);
        if (this.fsSliderCardListener != null) {
            this.fsSliderCardListener.onCardChange(0, arrayList.get(0));
        }
    }

    public void setFsSliderCardListener(@Nullable FSSliderCardListener fSSliderCardListener) {
        this.fsSliderCardListener = fSSliderCardListener;
    }

    public FSSliderRecyclerView(Context context) {
        super(context);
        this.cardClickListener = new View.OnClickListener() { // from class: com.my.target.core.ui.views.fsslider.FSSliderRecyclerView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                View findContainingItemView;
                if (!FSSliderRecyclerView.this.moving && (findContainingItemView = FSSliderRecyclerView.this.layoutManager.findContainingItemView(view)) != null) {
                    if (FSSliderRecyclerView.this.layoutManager.isViewActive(findContainingItemView)) {
                        if (FSSliderRecyclerView.this.fsSliderCardListener != null && FSSliderRecyclerView.this.fsImageBanners != null) {
                            FSSliderRecyclerView.this.fsSliderCardListener.onClick(findContainingItemView, (f) FSSliderRecyclerView.this.fsImageBanners.get(FSSliderRecyclerView.this.layoutManager.getPosition(findContainingItemView)));
                            return;
                        }
                        return;
                    }
                    FSSliderRecyclerView.this.smoothScrollBy(FSSliderRecyclerView.this.layoutManager.calculateScrollDistanceOnClick(findContainingItemView), 0);
                }
            }
        };
        this.displayedCardNum = -1;
        this.layoutManager = new FSCardRecyclerLayoutManager(getContext());
        setHasFixedSize(true);
    }

    public FSSliderRecyclerView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.cardClickListener = new View.OnClickListener() { // from class: com.my.target.core.ui.views.fsslider.FSSliderRecyclerView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                View findContainingItemView;
                if (!FSSliderRecyclerView.this.moving && (findContainingItemView = FSSliderRecyclerView.this.layoutManager.findContainingItemView(view)) != null) {
                    if (FSSliderRecyclerView.this.layoutManager.isViewActive(findContainingItemView)) {
                        if (FSSliderRecyclerView.this.fsSliderCardListener != null && FSSliderRecyclerView.this.fsImageBanners != null) {
                            FSSliderRecyclerView.this.fsSliderCardListener.onClick(findContainingItemView, (f) FSSliderRecyclerView.this.fsImageBanners.get(FSSliderRecyclerView.this.layoutManager.getPosition(findContainingItemView)));
                            return;
                        }
                        return;
                    }
                    FSSliderRecyclerView.this.smoothScrollBy(FSSliderRecyclerView.this.layoutManager.calculateScrollDistanceOnClick(findContainingItemView), 0);
                }
            }
        };
        this.displayedCardNum = -1;
        this.layoutManager = new FSCardRecyclerLayoutManager(getContext());
        setHasFixedSize(true);
    }

    public FSSliderRecyclerView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.cardClickListener = new View.OnClickListener() { // from class: com.my.target.core.ui.views.fsslider.FSSliderRecyclerView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                View findContainingItemView;
                if (!FSSliderRecyclerView.this.moving && (findContainingItemView = FSSliderRecyclerView.this.layoutManager.findContainingItemView(view)) != null) {
                    if (FSSliderRecyclerView.this.layoutManager.isViewActive(findContainingItemView)) {
                        if (FSSliderRecyclerView.this.fsSliderCardListener != null && FSSliderRecyclerView.this.fsImageBanners != null) {
                            FSSliderRecyclerView.this.fsSliderCardListener.onClick(findContainingItemView, (f) FSSliderRecyclerView.this.fsImageBanners.get(FSSliderRecyclerView.this.layoutManager.getPosition(findContainingItemView)));
                            return;
                        }
                        return;
                    }
                    FSSliderRecyclerView.this.smoothScrollBy(FSSliderRecyclerView.this.layoutManager.calculateScrollDistanceOnClick(findContainingItemView), 0);
                }
            }
        };
        this.displayedCardNum = -1;
        this.layoutManager = new FSCardRecyclerLayoutManager(getContext());
        setHasFixedSize(true);
    }

    @Override // android.support.v7.widget.RecyclerView
    public boolean fling(int i, int i2) {
        smoothScrollBy(this.layoutManager.calculateScrollDistanceOnFling(i), 0);
        return true;
    }

    @Override // android.support.v7.widget.RecyclerView
    public void onScrollStateChanged(int i) {
        super.onScrollStateChanged(i);
        this.moving = i != 0;
        if (!this.moving) {
            checkCardChanged();
        }
    }

    private void checkCardChanged() {
        int findFirstCompletelyVisibleItemPosition = this.layoutManager.findFirstCompletelyVisibleItemPosition();
        if (findFirstCompletelyVisibleItemPosition >= 0 && this.displayedCardNum != findFirstCompletelyVisibleItemPosition) {
            this.displayedCardNum = findFirstCompletelyVisibleItemPosition;
            if (this.fsSliderCardListener != null && this.fsImageBanners != null) {
                this.fsSliderCardListener.onCardChange(this.displayedCardNum, this.fsImageBanners.get(this.displayedCardNum));
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class FSSliderCardAdapter extends RecyclerView.Adapter<FSSliderRecyclerViewHolder> {
        private final int backgroundColor;
        private View.OnClickListener cardClickListener;
        private final ArrayList<f> fsCards;
        private final Resources resources;

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int i) {
            if (i == 0) {
                return 1;
            }
            if (i == this.fsCards.size() - 1) {
                return 2;
            }
            return 0;
        }

        private void setBannerToView(f fVar, FSSliderAppwallImageView fSSliderAppwallImageView) {
            Bitmap bitmap = null;
            ImageData imageData = (fVar.c() == null || fVar.c().isEmpty()) ? null : fVar.c().get(0);
            ImageData imageData2 = (fVar.b() == null || fVar.b().isEmpty()) ? null : fVar.b().get(0);
            Bitmap bitmap2 = imageData != null ? imageData.getBitmap() : null;
            if (imageData2 != null) {
                bitmap = imageData2.getBitmap();
            }
            Bitmap bitmap3 = this.resources.getConfiguration().orientation == 2 ? bitmap2 : bitmap;
            if (bitmap3 != null) {
                bitmap = bitmap3;
            } else if (bitmap2 != null) {
                bitmap = bitmap2;
            }
            fSSliderAppwallImageView.setImage(bitmap);
            if (!TextUtils.isEmpty(fVar.getAgeRestrictions())) {
                fSSliderAppwallImageView.setAgeRestrictions(fVar.getAgeRestrictions());
            }
        }

        void setClickListener(View.OnClickListener onClickListener) {
            this.cardClickListener = onClickListener;
        }

        FSSliderCardAdapter(@NonNull ArrayList<f> arrayList, int i, Resources resources) {
            this.fsCards = arrayList;
            this.backgroundColor = i;
            this.resources = resources;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public FSSliderRecyclerViewHolder mo1206onCreateViewHolder(ViewGroup viewGroup, int i) {
            FSSliderAppwallImageView fSSliderAppwallImageView = new FSSliderAppwallImageView(viewGroup.getContext(), this.backgroundColor);
            fSSliderAppwallImageView.setLayoutParams(new RecyclerView.LayoutParams(-1, -1));
            return new FSSliderRecyclerViewHolder(fSSliderAppwallImageView);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(FSSliderRecyclerViewHolder fSSliderRecyclerViewHolder, int i) {
            setBannerToView(this.fsCards.get(i), fSSliderRecyclerViewHolder.getSliderAppwallImageView());
            fSSliderRecyclerViewHolder.getSliderAppwallImageView().setOnClickListener(this.cardClickListener);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.fsCards.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onViewRecycled(FSSliderRecyclerViewHolder fSSliderRecyclerViewHolder) {
            fSSliderRecyclerViewHolder.getSliderAppwallImageView().setOnClickListener(null);
            super.onViewRecycled((FSSliderCardAdapter) fSSliderRecyclerViewHolder);
        }
    }

    @Override // android.view.View
    protected void onConfigurationChanged(Configuration configuration) {
        Bitmap bitmap;
        Bitmap bitmap2;
        if (this.fsImageBanners != null && !this.fsImageBanners.isEmpty()) {
            f fVar = this.fsImageBanners.get(0);
            if (configuration.orientation == 2) {
                if (fVar.c() != null && !fVar.c().isEmpty() && (bitmap2 = fVar.c().get(0).getBitmap()) != null) {
                    this.layoutManager.setFirstCardDimensions(bitmap2.getWidth(), bitmap2.getHeight());
                }
            } else if (fVar.b() != null && !fVar.b().isEmpty() && (bitmap = fVar.b().get(0).getBitmap()) != null) {
                this.layoutManager.setFirstCardDimensions(bitmap.getWidth(), bitmap.getHeight());
            }
        }
        super.onConfigurationChanged(configuration);
        mo1204getAdapter().notifyDataSetChanged();
        postDelayed(new Runnable() { // from class: com.my.target.core.ui.views.fsslider.FSSliderRecyclerView.2
            @Override // java.lang.Runnable
            public void run() {
                FSSliderRecyclerView.this.layoutManager.scrollToPositionWithOffset(FSSliderRecyclerView.this.displayedCardNum, FSSliderRecyclerView.this.layoutManager.getOffsetToCenterView());
            }
        }, 100L);
    }

    /* loaded from: classes2.dex */
    public static class FSSliderRecyclerViewHolder extends RecyclerView.ViewHolder {
        private final FSSliderAppwallImageView bannerImageView;

        FSSliderAppwallImageView getSliderAppwallImageView() {
            return this.bannerImageView;
        }

        FSSliderRecyclerViewHolder(FSSliderAppwallImageView fSSliderAppwallImageView) {
            super(fSSliderAppwallImageView);
            this.bannerImageView = fSSliderAppwallImageView;
        }
    }
}
