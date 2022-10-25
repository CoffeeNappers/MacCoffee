package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.vk.music.view.adapter.ItemViewHolder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class ItemAdapter<Item> extends UsableRecyclerView.Adapter<ItemViewHolder<Item>> {
    private final LayoutInflater inflater;
    private final List<Item> items = new ArrayList();
    private final IdResolver<Item> resolver;
    private final ItemViewHolder.Builder<Item> viewHolderBuilder;
    private final int viewType;

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public /* bridge */ /* synthetic */ void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
        onBindViewHolder((ItemViewHolder) ((ItemViewHolder) viewHolder), i);
    }

    public ItemAdapter(LayoutInflater inflater, ItemViewHolder.Builder<Item> viewHolderBuilder, IdResolver<Item> resolver, int viewType) {
        this.inflater = inflater;
        this.viewHolderBuilder = viewHolderBuilder;
        this.resolver = resolver;
        this.viewType = viewType;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public ItemViewHolder<Item> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return this.viewHolderBuilder.build(this.inflater, parent);
    }

    public void onBindViewHolder(ItemViewHolder<Item> holder, int position) {
        holder.bind(this.items.get(position), position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.items.size();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return this.viewType;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        if (this.resolver != null) {
            return this.resolver.resolve(this.items.get(position));
        }
        return 0L;
    }

    @NonNull
    public List<Item> getItems() {
        return new ArrayList(this.items);
    }

    @NonNull
    public final Item getItem(int position) {
        return this.items.get(position);
    }

    public final void setItems(@Nullable Collection<Item> items) {
        this.items.clear();
        if (items != null) {
            this.items.addAll(items);
        }
        notifyDataSetChanged();
    }

    public final void addItems(@NonNull Collection<Item> items) {
        int addedCount = items.size();
        if (addedCount != 0) {
            int prevCount = this.items.size();
            this.items.addAll(items);
            notifyItemRangeInserted(prevCount, addedCount);
        }
    }

    public final void addItems(int index, @NonNull Collection<Item> items) {
        int addedCount = items.size();
        if (addedCount != 0) {
            int prevCount = this.items.size();
            this.items.addAll(index, items);
            notifyItemRangeInserted(prevCount, addedCount);
        }
    }

    public final void removeItem(@NonNull Item item) {
        int index = this.items.indexOf(item);
        if (index != -1) {
            this.items.remove(index);
            notifyItemRemoved(index);
        }
    }

    public final void changeItem(@NonNull Item item) {
        int index = this.items.indexOf(item);
        if (index != -1) {
            this.items.set(index, item);
            notifyItemChanged(index);
        }
    }

    /* loaded from: classes2.dex */
    public static final class Builder<Item> {
        private ItemViewHolder.Builder<Item> builder;
        private final LayoutInflater layoutInflater;
        private IdResolver<Item> resolver;
        private int viewType;

        public Builder(@NonNull LayoutInflater layoutInflater) {
            this.layoutInflater = layoutInflater;
        }

        private ItemViewHolder.Builder<Item> getOrCreateBuilder() {
            if (this.builder == null) {
                ItemViewHolder.Builder<Item> builder = new ItemViewHolder.Builder<>();
                this.builder = builder;
                return builder;
            }
            return this.builder;
        }

        public Builder<Item> layout(int val) {
            getOrCreateBuilder().layout(val);
            return this;
        }

        public Builder<Item> init(ItemViewHolder.Builder.Init init) {
            getOrCreateBuilder().init(init);
            return this;
        }

        public Builder<Item> binder(ItemViewHolder.Binder<Item> val) {
            getOrCreateBuilder().binder(val);
            return this;
        }

        public Builder<Item> registerClickListener(int id, ItemViewHolder.ClickListener<Item> val) {
            getOrCreateBuilder().registerClickListener(id, val);
            return this;
        }

        public Builder<Item> registerClickListener(ItemViewHolder.ClickListener<Item> val) {
            getOrCreateBuilder().registerClickListener(val);
            return this;
        }

        public Builder<Item> registerLongClickListener(int id, ItemViewHolder.LongClickListener<Item> val) {
            getOrCreateBuilder().registerLongClickListener(id, val);
            return this;
        }

        public Builder<Item> viewHolderBuilder(ItemViewHolder.Builder<Item> val) {
            this.builder = val;
            return this;
        }

        public Builder<Item> resolver(IdResolver<Item> val) {
            this.resolver = val;
            return this;
        }

        public Builder<Item> viewType(int val) {
            this.viewType = val;
            return this;
        }

        public ItemAdapter<Item> build() {
            if (this.builder == null) {
                throw new NullPointerException("viewHolderBuilder must not be null");
            }
            return new ItemAdapter<>(this.layoutInflater, this.builder, this.resolver, this.viewType);
        }
    }
}
