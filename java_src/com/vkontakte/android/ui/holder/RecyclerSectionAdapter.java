package com.vkontakte.android.ui.holder;

import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public abstract class RecyclerSectionAdapter extends UsableRecyclerView.Adapter<RecyclerHolder> implements CardItemDecorator.Provider, CardItemDecoration.Provider {
    public List<Data> data;
    public final DataDelegate dataDelegate;

    /* loaded from: classes3.dex */
    public interface DataDelegate {
        List<Data> getData();
    }

    /* loaded from: classes3.dex */
    public static class Data {
        public int decoratorType;
        public final Object object;
        public final int type;

        private Data(int type, Object object, int decoratorType) {
            this.type = type;
            this.object = object;
            this.decoratorType = decoratorType;
        }

        public Data(int type, Object object) {
            this(type, object, 0);
        }

        public static Data middle(int type, Object object) {
            return new Data(type, object, 1);
        }

        public static Data none(int type, Object object) {
            return new Data(type, object);
        }

        public static Data top(int type, Object object) {
            return new Data(type, object, 2);
        }

        public static Data bottom(int type, Object object) {
            return new Data(type, object, 4);
        }

        public static Data topBottom(int type, Object object) {
            return new Data(type, object, 6);
        }
    }

    public RecyclerSectionAdapter() {
        this.data = new ArrayList();
        this.dataDelegate = null;
    }

    public RecyclerSectionAdapter(DataDelegate dataDelegate) {
        this.data = new ArrayList();
        this.dataDelegate = dataDelegate;
    }

    public void setData(List<Data> data, int startRange, int rangeSize) {
        if (data == null) {
            data = new ArrayList<>();
        }
        this.data = data;
        notifyItemRangeInserted(startRange, rangeSize);
    }

    public void setData(List<Data> data) {
        if (data == null) {
            data = new ArrayList<>();
        }
        this.data = data;
        notifyDataSetChanged();
    }

    public void replace(Data oldData, Data newData) {
        int index = this.data.indexOf(oldData);
        if (index >= 0 && index < this.data.size()) {
            this.data.set(index, newData);
            notifyItemChanged(index);
        }
    }

    public void add(Data data) {
        this.data.add(data);
        notifyItemInserted(this.data.size() - 2);
    }

    public void add(int location, Data data) {
        this.data.add(location, data);
        notifyDataSetChanged();
    }

    public void addAll(Collection<Data> data) {
        addAll(data, true);
    }

    public void addAll(Collection<Data> data, boolean notifyChange) {
        int lastSize = this.data.size();
        this.data.addAll(data);
        if (notifyChange) {
            notifyItemRangeInserted(lastSize, data.size());
        }
    }

    public void clear() {
        clear(true);
    }

    public void clear(boolean notifyChange) {
        this.data.clear();
        if (notifyChange) {
            notifyDataSetChanged();
        }
    }

    protected List<Data> getData() {
        return this.dataDelegate == null ? this.data : this.dataDelegate.getData();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(RecyclerHolder holder, int position) {
        holder.bind(getData().get(position).object);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return getData().get(position).type;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return getData().size();
    }

    @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
    public int getBlockType(int position) {
        return getData().get(position).decoratorType;
    }
}
