package me.grishka.appkit.utils;

import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import me.grishka.appkit.preloading.PrefetchInfoProvider;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class MergeRecyclerAdapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> implements PrefetchInfoProvider {
    private ArrayList<UsableRecyclerView.Adapter> adapters = new ArrayList<>();
    private SparseArray<UsableRecyclerView.Adapter> viewTypeMapping = new SparseArray<>();
    private HashMap<UsableRecyclerView.Adapter, InternalDataObserver> observers = new HashMap<>();

    public void addAdapter(UsableRecyclerView.Adapter adapter) {
        addAdapter(this.adapters.size(), adapter);
    }

    public void addAdapter(int index, UsableRecyclerView.Adapter adapter) {
        if (this.adapters.contains(adapter)) {
            throw new IllegalArgumentException("Adapter " + adapter + " is already added!");
        }
        this.adapters.add(index, adapter);
        InternalDataObserver observer = new InternalDataObserver(adapter);
        adapter.registerAdapterDataObserver(observer);
        this.observers.put(adapter, observer);
        notifyDataSetChanged();
    }

    public void removeAdapter(UsableRecyclerView.Adapter adapter) {
        this.adapters.remove(adapter);
        adapter.unregisterAdapterDataObserver(this.observers.get(adapter));
        this.observers.remove(adapter);
        notifyDataSetChanged();
    }

    public void removeAdapterAt(int index) {
        removeAdapter(this.adapters.get(index));
    }

    public void removeAllAdapters() {
        Iterator<UsableRecyclerView.Adapter> it = this.adapters.iterator();
        while (it.hasNext()) {
            UsableRecyclerView.Adapter adapter = it.next();
            adapter.unregisterAdapterDataObserver(this.observers.get(adapter));
            this.observers.remove(adapter);
        }
        this.adapters.clear();
        notifyDataSetChanged();
    }

    public RecyclerView.Adapter getAdapterAt(int index) {
        return this.adapters.get(index);
    }

    public int getIndexOfAdapter(UsableRecyclerView.Adapter adapter) {
        return this.adapters.indexOf(adapter);
    }

    public int getAdapterCount() {
        return this.adapters.size();
    }

    public int getAdapterPosition(int pos) {
        int count = 0;
        Iterator<UsableRecyclerView.Adapter> it = this.adapters.iterator();
        while (it.hasNext()) {
            RecyclerView.Adapter adapter = it.next();
            int c = adapter.getItemCount();
            if (pos >= count && pos < count + c) {
                return pos - count;
            }
            count += c;
        }
        return pos;
    }

    public int getPositionForAdapter(RecyclerView.Adapter adapter) {
        RecyclerView.Adapter a;
        int pos = 0;
        Iterator<UsableRecyclerView.Adapter> it = this.adapters.iterator();
        while (it.hasNext() && (a = it.next()) != adapter) {
            pos += a.getItemCount();
        }
        return pos;
    }

    public UsableRecyclerView.Adapter getAdapterForPosition(int pos) {
        int count = 0;
        Iterator<UsableRecyclerView.Adapter> it = this.adapters.iterator();
        while (it.hasNext()) {
            UsableRecyclerView.Adapter adapter = it.next();
            int c = adapter.getItemCount();
            if (pos < count || pos >= count + c) {
                count += c;
            } else {
                return adapter;
            }
        }
        return null;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return (UsableRecyclerView.ViewHolder) this.viewTypeMapping.get(viewType).mo1206onCreateViewHolder(parent, viewType);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
        getAdapterForPosition(position).onBindViewHolder(holder, getAdapterPosition(position));
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        UsableRecyclerView.Adapter adapter = getAdapterForPosition(position);
        int viewType = adapter.getItemViewType(getAdapterPosition(position));
        this.viewTypeMapping.put(viewType, adapter);
        return viewType;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        int count = 0;
        Iterator<UsableRecyclerView.Adapter> it = this.adapters.iterator();
        while (it.hasNext()) {
            RecyclerView.Adapter adapter = it.next();
            count += adapter.getItemCount();
        }
        return count;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
    public int getImageCountForItem(int position) {
        UsableRecyclerView.Adapter adapter = getAdapterForPosition(position);
        if (adapter != null) {
            return adapter.getImageCountForItem(getAdapterPosition(position));
        }
        return 0;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
    public String getImageURL(int position, int image) {
        UsableRecyclerView.Adapter adapter = getAdapterForPosition(position);
        if (adapter != null) {
            return adapter.getImageURL(getAdapterPosition(position), image);
        }
        return null;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        return getAdapterForPosition(position).getItemId(getAdapterPosition(position));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class InternalDataObserver extends RecyclerView.AdapterDataObserver {
        private RecyclerView.Adapter adapter;

        public InternalDataObserver(RecyclerView.Adapter adapter) {
            this.adapter = adapter;
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onChanged() {
            MergeRecyclerAdapter.this.notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeChanged(int positionStart, int itemCount) {
            MergeRecyclerAdapter.this.notifyItemRangeChanged(MergeRecyclerAdapter.this.getPositionForAdapter(this.adapter) + positionStart, itemCount);
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeChanged(int positionStart, int itemCount, Object payload) {
            MergeRecyclerAdapter.this.notifyItemRangeChanged(MergeRecyclerAdapter.this.getPositionForAdapter(this.adapter) + positionStart, itemCount, payload);
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeInserted(int positionStart, int itemCount) {
            MergeRecyclerAdapter.this.notifyItemRangeInserted(MergeRecyclerAdapter.this.getPositionForAdapter(this.adapter) + positionStart, itemCount);
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeRemoved(int positionStart, int itemCount) {
            MergeRecyclerAdapter.this.notifyItemRangeRemoved(MergeRecyclerAdapter.this.getPositionForAdapter(this.adapter) + positionStart, itemCount);
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeMoved(int fromPosition, int toPosition, int itemCount) {
            if (itemCount != 1) {
                throw new UnsupportedOperationException("Can't move more than one item");
            }
            int offset = MergeRecyclerAdapter.this.getPositionForAdapter(this.adapter);
            MergeRecyclerAdapter.this.notifyItemMoved(offset + fromPosition, offset + toPosition);
        }
    }
}
