package com.vkontakte.android.ui.infiniteviewpager;

import android.database.DataSetObserver;
import android.os.Parcelable;
import android.support.v4.view.PagerAdapter;
import android.view.View;
import android.view.ViewGroup;
/* loaded from: classes3.dex */
public class InfinitePagerAdapter extends PagerAdapter {
    private PagerAdapter adapter;

    public InfinitePagerAdapter(PagerAdapter adapter) {
        this.adapter = adapter;
        this.adapter.registerDataSetObserver(new DataSetObserver() { // from class: com.vkontakte.android.ui.infiniteviewpager.InfinitePagerAdapter.1
            @Override // android.database.DataSetObserver
            public void onChanged() {
                InfinitePagerAdapter.this.notifyDataSetChanged();
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                InfinitePagerAdapter.this.notifyDataSetChanged();
            }
        });
    }

    @Override // android.support.v4.view.PagerAdapter
    public int getCount() {
        return getRealCount() == 0 ? 0 : Integer.MAX_VALUE;
    }

    public int getRealCount() {
        return this.adapter.getCount();
    }

    @Override // android.support.v4.view.PagerAdapter
    public Object instantiateItem(ViewGroup container, int position) {
        int virtualPosition = position % getRealCount();
        return this.adapter.instantiateItem(container, virtualPosition);
    }

    @Override // android.support.v4.view.PagerAdapter
    public void destroyItem(ViewGroup container, int position, Object object) {
        int virtualPosition = position % getRealCount();
        this.adapter.destroyItem(container, virtualPosition, object);
    }

    @Override // android.support.v4.view.PagerAdapter
    public void finishUpdate(ViewGroup container) {
        this.adapter.finishUpdate(container);
    }

    @Override // android.support.v4.view.PagerAdapter
    public boolean isViewFromObject(View view, Object object) {
        return this.adapter.isViewFromObject(view, object);
    }

    @Override // android.support.v4.view.PagerAdapter
    public void restoreState(Parcelable bundle, ClassLoader classLoader) {
        this.adapter.restoreState(bundle, classLoader);
    }

    @Override // android.support.v4.view.PagerAdapter
    public Parcelable saveState() {
        return this.adapter.saveState();
    }

    @Override // android.support.v4.view.PagerAdapter
    public void startUpdate(ViewGroup container) {
        this.adapter.startUpdate(container);
    }

    @Override // android.support.v4.view.PagerAdapter
    public CharSequence getPageTitle(int position) {
        int virtualPosition = position % getRealCount();
        return this.adapter.getPageTitle(virtualPosition);
    }

    @Override // android.support.v4.view.PagerAdapter
    public float getPageWidth(int position) {
        return this.adapter.getPageWidth(position);
    }

    @Override // android.support.v4.view.PagerAdapter
    public void setPrimaryItem(ViewGroup container, int position, Object object) {
        this.adapter.setPrimaryItem(container, position, object);
    }

    @Override // android.support.v4.view.PagerAdapter
    public int getItemPosition(Object object) {
        return this.adapter.getItemPosition(object);
    }
}
