package com.vkontakte.android.ui;

import android.database.DataSetObserver;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.SectionIndexer;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.preloading.PrefetchInfoProvider;
/* loaded from: classes3.dex */
public class MergeAdapter extends BaseAdapter implements SectionIndexer, PrefetchInfoProvider {
    protected String noItemsText;
    protected ArrayList<ListAdapter> pieces = new ArrayList<>();
    protected CascadeDataSetObserver dataSetObserver = null;

    public void addAdapter(ListAdapter adapter) {
        this.pieces.add(adapter);
        if (this.dataSetObserver == null) {
            this.dataSetObserver = new CascadeDataSetObserver();
        }
        adapter.registerDataSetObserver(this.dataSetObserver);
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (position < size) {
                return piece.getItem(position);
            }
            position -= size;
        }
        return null;
    }

    public void setNoItemsText(String text) {
        this.noItemsText = text;
    }

    public ListAdapter getAdapter(int position) {
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (position >= size) {
                position -= size;
            } else {
                return piece;
            }
        }
        return null;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        int total = 0;
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            total += piece.getCount();
        }
        if (total == 0 && this.noItemsText != null) {
            return 1;
        }
        return total;
    }

    @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
    public int getImageCountForItem(int position) {
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (position < size) {
                if (!(piece instanceof PrefetchInfoProvider)) {
                    return 0;
                }
                return ((PrefetchInfoProvider) piece).getImageCountForItem(position);
            }
            position -= size;
        }
        return 0;
    }

    @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
    public String getImageURL(int item, int image) {
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (item < size) {
                if (!(piece instanceof PrefetchInfoProvider)) {
                    return null;
                }
                return ((PrefetchInfoProvider) piece).getImageURL(item, image);
            }
            item -= size;
        }
        return null;
    }

    @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
    public int getItemCount() {
        return getCount();
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getViewTypeCount() {
        int total = 0;
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            total += piece.getViewTypeCount();
        }
        return Math.max(total, 1);
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getItemViewType(int position) {
        int typeOffset = 0;
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (position < size) {
                int result = typeOffset + piece.getItemViewType(position);
                return result;
            }
            position -= size;
            typeOffset += piece.getViewTypeCount();
        }
        return -1;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean areAllItemsEnabled() {
        return false;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean isEnabled(int position) {
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (position < size) {
                return piece.isEnabled(position);
            }
            position -= size;
        }
        return false;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (position < size) {
                return piece.getView(position, convertView, parent);
            }
            position -= size;
        }
        if (this.noItemsText != null) {
            android.widget.TextView text = new android.widget.TextView(parent.getContext());
            text.setText(this.noItemsText);
            return text;
        }
        return null;
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (position < size) {
                return piece.getItemId(position);
            }
            position -= size;
        }
        return -1L;
    }

    @Override // android.widget.SectionIndexer
    public int getPositionForSection(int section) {
        int position = 0;
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            if (piece instanceof SectionIndexer) {
                Object[] sections = ((SectionIndexer) piece).getSections();
                int numSections = 0;
                if (sections != null) {
                    numSections = sections.length;
                }
                if (section < numSections) {
                    return ((SectionIndexer) piece).getPositionForSection(section) + position;
                }
                if (sections != null) {
                    section -= numSections;
                }
            }
            position += piece.getCount();
        }
        return 0;
    }

    @Override // android.widget.SectionIndexer
    public int getSectionForPosition(int position) {
        Object[] sections;
        int section = 0;
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            int size = piece.getCount();
            if (position < size) {
                if (!(piece instanceof SectionIndexer)) {
                    return 0;
                }
                return ((SectionIndexer) piece).getSectionForPosition(position) + section;
            }
            if ((piece instanceof SectionIndexer) && (sections = ((SectionIndexer) piece).getSections()) != null) {
                section += sections.length;
            }
            position -= size;
        }
        return 0;
    }

    @Override // android.widget.SectionIndexer
    public Object[] getSections() {
        Object[] curSections;
        ArrayList<Object> sections = new ArrayList<>();
        Iterator<ListAdapter> it = this.pieces.iterator();
        while (it.hasNext()) {
            ListAdapter piece = it.next();
            if ((piece instanceof SectionIndexer) && (curSections = ((SectionIndexer) piece).getSections()) != null) {
                for (Object section : curSections) {
                    sections.add(section);
                }
            }
        }
        if (sections.size() == 0) {
            return null;
        }
        return sections.toArray(new Object[0]);
    }

    public ListAdapter getAdapterAt(int index) {
        return this.pieces.get(index);
    }

    /* loaded from: classes3.dex */
    private class CascadeDataSetObserver extends DataSetObserver {
        private CascadeDataSetObserver() {
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            MergeAdapter.this.notifyDataSetChanged();
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() {
            MergeAdapter.this.notifyDataSetInvalidated();
        }
    }
}
