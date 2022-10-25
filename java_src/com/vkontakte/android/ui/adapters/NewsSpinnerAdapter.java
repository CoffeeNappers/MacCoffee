package com.vkontakte.android.ui.adapters;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.SwitchCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CheckedTextView;
import android.widget.CompoundButton;
import android.widget.TextView;
import com.vkontakte.android.NewsfeedList;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class NewsSpinnerAdapter extends ArrayAdapter<Item> {
    private int selectedItem;

    /* loaded from: classes3.dex */
    public static class Item {
        final String checkTitle;
        final int checked;
        @DrawableRes
        final int iconRes;
        public final NewsfeedList listItem;
        @Nullable
        CompoundButton.OnCheckedChangeListener onCheckedChangeListener;

        public Item(NewsfeedList listItem, int iconRes) {
            this.listItem = listItem;
            this.iconRes = iconRes;
            this.checkTitle = null;
            this.checked = 0;
            this.onCheckedChangeListener = null;
        }

        public Item(NewsfeedList listItem, int iconRes, String checkTitle, boolean checked, @Nullable CompoundButton.OnCheckedChangeListener onCheckedChangeListener) {
            this.listItem = listItem;
            this.iconRes = iconRes;
            this.checkTitle = checkTitle;
            this.checked = checked ? 1 : -1;
            this.onCheckedChangeListener = onCheckedChangeListener;
        }

        public String toString() {
            return this.listItem.getTitle();
        }
    }

    /* loaded from: classes3.dex */
    public static class DropDownViewHolder {
        final SwitchCompat aSwitch;
        final View itemView;
        final CheckedTextView title;

        public DropDownViewHolder(ViewGroup parent) {
            this.itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.news_dropdown_view, parent, false);
            this.itemView.setTag(this);
            this.title = (CheckedTextView) this.itemView.findViewById(16908308);
            this.aSwitch = (SwitchCompat) this.itemView.findViewById(16908289);
        }

        public static DropDownViewHolder get(@Nullable View view, ViewGroup parent) {
            return view == null ? new DropDownViewHolder(parent) : (DropDownViewHolder) view.getTag();
        }
    }

    public void setSelectedItem(int selectedItem) {
        this.selectedItem = selectedItem;
        notifyDataSetChanged();
    }

    public NewsSpinnerAdapter(Context context) {
        super(context, (int) R.layout.appkit_spinner_view, 16908308);
        this.selectedItem = 0;
        setDropDownViewResource(R.layout.news_dropdown_view);
    }

    @Override // android.widget.ArrayAdapter, android.widget.BaseAdapter, android.widget.SpinnerAdapter
    public View getDropDownView(int position, View convertView, @NonNull ViewGroup parent) {
        boolean z = true;
        DropDownViewHolder holder = DropDownViewHolder.get(convertView, parent);
        Item item = getItem(position);
        holder.title.setText(item.toString());
        ColorStateList colorStateList = parent.getContext().getResources().getColorStateList(R.color.news_spinner_icon);
        Drawable drawable = new RecoloredDrawable(ViewUtils.getDrawable(parent.getContext(), item.iconRes), colorStateList);
        holder.title.setCompoundDrawablesWithIntrinsicBounds(drawable, (Drawable) null, (Drawable) null, (Drawable) null);
        holder.aSwitch.setText(item.checkTitle);
        holder.aSwitch.setVisibility(item.checked == 0 ? 8 : 0);
        AdapterView.OnItemClickListener listener = parent instanceof AbsListView ? ((AbsListView) parent).getOnItemClickListener() : null;
        if (listener != null) {
            holder.title.setOnClickListener(NewsSpinnerAdapter$$Lambda$1.lambdaFactory$(listener, parent, holder, position));
        }
        holder.aSwitch.setOnCheckedChangeListener(null);
        holder.aSwitch.setChecked(item.checked > 0);
        if (listener != null && item.onCheckedChangeListener != null) {
            holder.aSwitch.setOnCheckedChangeListener(NewsSpinnerAdapter$$Lambda$2.lambdaFactory$(item, listener, parent, holder, position));
        } else {
            holder.aSwitch.setOnCheckedChangeListener(item.onCheckedChangeListener);
        }
        CheckedTextView checkedTextView = holder.title;
        if (this.selectedItem != position) {
            z = false;
        }
        checkedTextView.setChecked(z);
        if (item.checked == 0) {
            holder.itemView.setBackgroundColor(0);
        } else {
            holder.itemView.setBackgroundResource(R.drawable.bottom_divider_bg);
        }
        int pad = V.dp(8.0f);
        if (item.checked != 0) {
            holder.itemView.setPadding(holder.itemView.getPaddingLeft(), pad, holder.itemView.getPaddingRight(), pad);
        } else if (position == 0 || getItem(position - 1).checked != 0) {
            holder.itemView.setPadding(holder.itemView.getPaddingLeft(), pad, holder.itemView.getPaddingRight(), 0);
        } else if (position == getCount() - 1) {
            holder.itemView.setPadding(holder.itemView.getPaddingLeft(), 0, holder.itemView.getPaddingRight(), pad);
        } else {
            holder.itemView.setPadding(holder.itemView.getPaddingLeft(), 0, holder.itemView.getPaddingRight(), 0);
        }
        return holder.itemView;
    }

    public static /* synthetic */ void lambda$getDropDownView$1(Item item, AdapterView.OnItemClickListener listener, @NonNull ViewGroup parent, DropDownViewHolder holder, int position, CompoundButton c, boolean b) {
        item.onCheckedChangeListener.onCheckedChanged(c, b);
        listener.onItemClick((AbsListView) parent, holder.itemView, position, 0L);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    @NonNull
    public View getView(int position, View convertView, @NonNull ViewGroup parent) {
        View view = super.getView(position, convertView, parent);
        if (Build.VERSION.SDK_INT < 21) {
            ((TextView) view.findViewById(16908308)).setTypeface(Font.Medium.typeface);
        }
        return view;
    }

    public void add(NewsfeedList listItem, @DrawableRes int icon) {
        super.add(new Item(listItem, icon));
    }

    public void add(NewsfeedList listItem, @DrawableRes int icon, String switchTitle, boolean checked, @Nullable CompoundButton.OnCheckedChangeListener onCheckedChangeListener) {
        super.add(new Item(listItem, icon, switchTitle, checked, onCheckedChangeListener));
    }

    public String getPromoId(int listId) {
        if (listId <= -10) {
            for (int i = 0; i < getCount(); i++) {
                Item item = getItem(i);
                if (item != null && item.listItem.getId() == listId) {
                    return item.listItem.getPromoId();
                }
            }
        }
        return null;
    }
}
