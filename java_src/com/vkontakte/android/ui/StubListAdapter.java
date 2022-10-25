package com.vkontakte.android.ui;

import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
/* loaded from: classes3.dex */
public class StubListAdapter extends BaseAdapter {
    private static StubListAdapter instance = new StubListAdapter();

    public static StubListAdapter getInstance() {
        return instance;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return 0;
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return null;
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return 0L;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        return null;
    }
}
