package com.vkontakte.android.ui;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.PinnedHeaderListView;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
/* loaded from: classes3.dex */
public abstract class MultiSectionAdapter extends BaseAdapter implements PinnedHeaderListView.PinnedSectionedHeaderAdapter {
    private HashMap<Integer, android.widget.TextView> headerViews = new HashMap<>();

    public abstract int getItemCount(int i);

    public abstract long getItemId(int i, int i2);

    public abstract int getSectionCount();

    public abstract String getSectionTitle(int i);

    public abstract View getView(int i, int i2, View view);

    public abstract boolean isSectionHeaderVisible(int i);

    @Override // android.widget.BaseAdapter
    public void notifyDataSetChanged() {
        this.headerViews.clear();
        super.notifyDataSetChanged();
    }

    public int[] resolveIndex(int item) {
        int[] result = new int[2];
        int ns = getSectionCount();
        int idx = 0;
        int i = 0;
        while (true) {
            if (i < ns) {
                if (isSectionHeaderVisible(i)) {
                    if (idx == item) {
                        result[0] = i;
                        result[1] = -1;
                        break;
                    }
                    idx++;
                }
                int prevIdx = idx;
                idx += getItemCount(i);
                if (item < prevIdx || item >= idx || prevIdx == idx) {
                    i++;
                } else {
                    result[0] = i;
                    result[1] = item - prevIdx;
                    break;
                }
            } else {
                break;
            }
        }
        return result;
    }

    private android.widget.TextView getSectionHeaderView(Context context) {
        android.widget.TextView t = (android.widget.TextView) View.inflate(context, getHeaderLayoutResource(), null);
        return t;
    }

    public int getHeaderLayoutResource() {
        return R.layout.list_section_header;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        int ns = getSectionCount();
        int cnt = 0;
        for (int i = 0; i < ns; i++) {
            if (isSectionHeaderVisible(i)) {
                cnt++;
            }
            cnt += getItemCount(i);
        }
        return cnt;
    }

    @Override // android.widget.Adapter
    public Object getItem(int pos) {
        int[] idx = resolveIndex(pos);
        if (idx[1] == -1) {
            return null;
        }
        return getItem(idx[0], idx[1]);
    }

    public Object getItem(int section, int position) {
        return null;
    }

    @Override // android.widget.Adapter
    public long getItemId(int pos) {
        int[] idx = resolveIndex(pos);
        return idx[1] == -1 ? -pos : getItemId(idx[0], idx[1]);
    }

    @Override // android.widget.Adapter
    public View getView(int pos, View view, ViewGroup group) {
        int[] idx = resolveIndex(pos);
        return idx[1] == -1 ? getSectionHeaderView(idx[0], view, group) : getView(idx[0], idx[1], view);
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getItemViewType(int pos) {
        int[] s = resolveIndex(pos);
        if (s[1] == -1) {
            return 1;
        }
        return getItemViewType(s[0], s[1]);
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getViewTypeCount() {
        return getExtraViewTypeCount() + 2;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean areAllItemsEnabled() {
        return false;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean isEnabled(int pos) {
        int[] idx = resolveIndex(pos);
        if (idx[1] == -1) {
            return false;
        }
        return isEnabled(idx[0], idx[1]);
    }

    public boolean isEnabled(int section, int item) {
        return true;
    }

    public int getExtraViewTypeCount() {
        return 0;
    }

    public int getItemViewType(int section, int item) {
        return 0;
    }

    @Override // com.vkontakte.android.ui.PinnedHeaderListView.PinnedSectionedHeaderAdapter
    public boolean isSectionHeader(int pos) {
        return resolveIndex(pos)[1] == -1;
    }

    @Override // com.vkontakte.android.ui.PinnedHeaderListView.PinnedSectionedHeaderAdapter
    public int getSectionForPosition(int pos) {
        return resolveIndex(pos)[0];
    }

    @Override // com.vkontakte.android.ui.PinnedHeaderListView.PinnedSectionedHeaderAdapter
    public View getSectionHeaderView(int section, View convertView, ViewGroup parent) {
        android.widget.TextView view;
        if (this.headerViews.containsKey(Integer.valueOf(section))) {
            android.widget.TextView hv = this.headerViews.get(Integer.valueOf(section));
            String title = getSectionTitle(section);
            if (hv.getLayoutParams() == null) {
                hv.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
            }
            hv.setText(title);
            return hv;
        }
        if (convertView == null) {
            view = getSectionHeaderView(parent.getContext());
            AbsListView.LayoutParams lp = new AbsListView.LayoutParams(-1, -2);
            view.setLayoutParams(lp);
        } else {
            view = (android.widget.TextView) convertView;
        }
        if (convertView != null) {
            try {
                if (this.headerViews.containsValue(convertView) && this.headerViews.get(Integer.valueOf(section)) != convertView) {
                    Set<Integer> ks = this.headerViews.keySet();
                    Iterator<Integer> it = ks.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        int i = it.next().intValue();
                        if (this.headerViews.get(Integer.valueOf(i)) == convertView) {
                            if (i == section - 1 || i <= section + 8) {
                                view = getSectionHeaderView(parent.getContext());
                            } else {
                                this.headerViews.remove(Integer.valueOf(i));
                            }
                        }
                    }
                }
            } catch (Exception e) {
            }
        }
        this.headerViews.put(Integer.valueOf(section), view);
        String title2 = getSectionTitle(section);
        view.setText(title2);
        return view;
    }
}
