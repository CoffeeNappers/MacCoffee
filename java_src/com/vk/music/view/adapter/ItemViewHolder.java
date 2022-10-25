package com.vk.music.view.adapter;

import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class ItemViewHolder<Item> extends UsableRecyclerView.ViewHolder implements View.OnClickListener, View.OnLongClickListener {
    private final Binder<Item> binder;
    private final SparseArray<ClickListener<Item>> clickListeners;
    private Item item;
    private int itemPosition;
    private final SparseArray<LongClickListener<Item>> longClickListeners;
    private ViewRefs viewRefs;

    /* loaded from: classes2.dex */
    public interface Binder<Item> {
        void onBind(@NonNull ViewRefs viewRefs, @NonNull Item item, int i);

        @NonNull
        ViewRefs onCreate(@NonNull View view);
    }

    /* loaded from: classes2.dex */
    public interface ClickListener<Item> {
        void onClick(@NonNull View view, @NonNull Item item, int i);
    }

    /* loaded from: classes2.dex */
    public interface LongClickListener<Item> {
        boolean onLongClick(@NonNull View view, @NonNull Item item, int i);
    }

    public ItemViewHolder(View itemView, Binder<Item> binder, SparseArray<ClickListener<Item>> clickListeners, SparseArray<LongClickListener<Item>> longClickListeners) {
        super(itemView);
        View v;
        View v2;
        this.item = null;
        this.itemPosition = -1;
        this.binder = binder;
        this.clickListeners = clickListeners;
        if (clickListeners != null) {
            for (int i = 0; i < clickListeners.size(); i++) {
                int id = clickListeners.keyAt(i);
                if (id == -1) {
                    v2 = itemView;
                } else {
                    v2 = itemView.findViewById(id);
                }
                if (v2 != null) {
                    v2.setOnClickListener(this);
                }
            }
        }
        this.longClickListeners = longClickListeners;
        if (longClickListeners != null) {
            for (int i2 = 0; i2 < longClickListeners.size(); i2++) {
                int id2 = longClickListeners.keyAt(i2);
                if (id2 == -1) {
                    v = itemView;
                } else {
                    v = itemView.findViewById(id2);
                }
                if (v != null) {
                    v.setOnLongClickListener(this);
                }
            }
        }
        this.viewRefs = binder.onCreate(itemView);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (this.clickListeners != null && this.item != null) {
            this.clickListeners.get(v.getId()).onClick(v, this.item, this.itemPosition);
        }
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        if (this.longClickListeners == null || this.item == null) {
            return false;
        }
        return this.longClickListeners.get(v.getId()).onLongClick(v, this.item, this.itemPosition);
    }

    public final void rebind() {
        if (this.item != null && this.itemPosition != -1) {
            bind(this.item, this.itemPosition);
        }
    }

    public final void rebind(@NonNull Item item) {
        if (this.itemPosition != -1) {
            bind(item, this.itemPosition);
        }
    }

    @CallSuper
    public void bind(@NonNull Item item, int position) {
        this.item = item;
        this.itemPosition = position;
        this.binder.onBind(this.viewRefs.reset(), item, position);
    }

    @Nullable
    public final Item getItem() {
        return this.item;
    }

    public final int getItemPosition() {
        return this.itemPosition;
    }

    /* loaded from: classes2.dex */
    public static final class Builder<Item> {
        private Binder<Item> binder;
        private SparseArray<ClickListener<Item>> clickListeners;
        private Init init;
        private int layout;
        private SparseArray<LongClickListener<Item>> longClickListeners;

        /* loaded from: classes2.dex */
        public interface Init {
            void apply(View view);
        }

        public Builder<Item> layout(int val) {
            this.layout = val;
            return this;
        }

        public Builder<Item> init(Init init) {
            this.init = init;
            return this;
        }

        public Builder<Item> binder(Binder<Item> val) {
            this.binder = val;
            return this;
        }

        public Builder<Item> registerClickListener(ClickListener<Item> val) {
            return registerClickListener(-1, val);
        }

        public Builder<Item> registerClickListener(int id, ClickListener<Item> val) {
            if (this.clickListeners == null) {
                this.clickListeners = new SparseArray<>();
            }
            this.clickListeners.put(id, val);
            return this;
        }

        public Builder<Item> registerLongClickListener(int id, LongClickListener<Item> val) {
            if (this.longClickListeners == null) {
                this.longClickListeners = new SparseArray<>();
            }
            this.longClickListeners.put(id, val);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public ItemViewHolder<Item> build(@NonNull LayoutInflater inflater, @NonNull ViewGroup parent) {
            if (this.layout == 0) {
                throw new NullPointerException("layout must not be 0");
            }
            if (this.binder == null) {
                throw new NullPointerException("binder must not be null");
            }
            View itemView = inflater.inflate(this.layout, parent, false);
            if (this.init != null) {
                this.init.apply(itemView);
            }
            return new ItemViewHolder<>(itemView, this.binder, this.clickListeners, this.longClickListeners);
        }
    }
}
