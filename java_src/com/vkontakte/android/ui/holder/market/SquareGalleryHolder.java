package com.vkontakte.android.ui.holder.market;

import android.graphics.Rect;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.media.camera.CameraUtils;
import com.vkontakte.android.Photo;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.widget.GoodGalleryContainer;
import com.vkontakte.android.ui.widget.PageIndicator;
import com.vkontakte.android.ui.widget.StateListenersImageView;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes3.dex */
public class SquareGalleryHolder extends RecyclerHolder<Photo[]> implements ViewPager.OnPageChangeListener {
    final Adapter adapter;
    final GoodGalleryContainer goodGalleryContainer;
    final PageIndicator pageIndicator;
    final ViewPager viewPager;

    public SquareGalleryHolder(ViewGroup parent) {
        super((int) R.layout.good_gallery, parent);
        this.pageIndicator = (PageIndicator) $(R.id.page_indicator);
        this.viewPager = (ViewPager) $(R.id.pager);
        this.adapter = new Adapter(this.viewPager, this);
        this.viewPager.setAdapter(this.adapter);
        this.viewPager.addOnPageChangeListener(this);
        this.goodGalleryContainer = (GoodGalleryContainer) $(R.id.goodGalleryContainer);
        this.goodGalleryContainer.setIsTablet(false);
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int position) {
        this.pageIndicator.setIndexOfCurrentPage(position, true);
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Photo[] item) {
        int i = 0;
        if (item == null) {
            this.pageIndicator.setVisibility(8);
            this.adapter.setPhotos(new Photo[0]);
            return;
        }
        this.pageIndicator.setCountOfPages(item.length);
        PageIndicator pageIndicator = this.pageIndicator;
        if (item.length <= 1) {
            i = 8;
        }
        pageIndicator.setVisibility(i);
        this.adapter.setPhotos(item);
    }

    /* loaded from: classes3.dex */
    public static class Adapter extends PagerAdapter {
        private Photo[] photos = null;
        RecyclerHolder recyclerHolder;
        ViewPager viewPager;

        public Adapter(ViewPager viewPager, RecyclerHolder recyclerHolder) {
            this.viewPager = viewPager;
            this.recyclerHolder = recyclerHolder;
        }

        public void setPhotos(Photo[] photos) {
            if (!Arrays.equals(photos, this.photos)) {
                this.photos = photos;
                notifyDataSetChanged();
            }
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            if (this.photos == null) {
                return 0;
            }
            return this.photos.length;
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            View view = LayoutInflater.from(container.getContext()).inflate(R.layout.good_photo_item, container, false);
            StateListenersImageView imageView = (StateListenersImageView) view.findViewById(R.id.image);
            Photo photo = this.photos[position];
            int width = Math.max((int) CameraUtils.Settings.LOW_HEIGHT, container.getMeasuredWidth());
            Photo.Image image = photo.getImageByWidth(width);
            container.addView(view);
            container.requestLayout();
            imageView.load(image.url);
            List<View.OnAttachStateChangeListener> changeListeners = imageView.getOnAttachStateChangeListeners();
            if (!changeListeners.isEmpty()) {
                imageView.removeOnAttachStateChangeListener(changeListeners.get(changeListeners.size() - 1));
            }
            List<Photo> photoList = new ArrayList<>();
            Collections.addAll(photoList, this.photos);
            view.setOnClickListener(SquareGalleryHolder$Adapter$$Lambda$1.lambdaFactory$(this, container, photoList, position, image));
            return view;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$instantiateItem$0(ViewGroup container, List photoList, int position, final Photo.Image image, final View v) {
            PhotoViewer photoViewer = new PhotoViewer(Utils.castToActivity(container.getContext()), photoList, position, new PhotoViewer.PhotoViewerCallbackAdapter() { // from class: com.vkontakte.android.ui.holder.market.SquareGalleryHolder.Adapter.1
                @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallbackAdapter, com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
                    if (v != null && Adapter.this.viewPager != null && index == Adapter.this.viewPager.getCurrentItem()) {
                        int[] loc = {0, 0};
                        v.getLocationInWindow(loc);
                        if (image.height == 0 || image.width == 0 || image.height == image.width) {
                            outRect.set(loc[0], loc[1], loc[0] + v.getWidth(), loc[1] + v.getHeight());
                        } else if (image.width > image.height) {
                            int h = (v.getHeight() * image.height) / image.width;
                            int dh = (v.getHeight() - h) / 2;
                            outRect.set(loc[0], loc[1] + dh, loc[0] + v.getWidth(), loc[1] + dh + h);
                        } else if (image.width < image.height) {
                            int w = (v.getHeight() * image.width) / image.height;
                            int dw = (v.getWidth() - w) / 2;
                            outRect.set(loc[0] + dw, loc[1], loc[0] + dw + w, loc[1] + v.getHeight());
                        }
                    }
                }
            });
            photoViewer.setDisplayTotal(this.photos.length);
            photoViewer.show();
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object view) {
            container.removeView((View) view);
        }
    }
}
