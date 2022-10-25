package com.vkontakte.android.ui;

import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.annotation.ColorRes;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.animation.RevealLinearLayout;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class ListDialog {
    public static final int TYPE_COUNT = 2;
    public static final int TYPE_ICON = 1;
    public static final int TYPE_USER = 0;

    /* loaded from: classes3.dex */
    public interface OnAttachedListener {
        void onAttached(ListDialogAdapter listDialogAdapter);

        void onDetached(ListDialogAdapter listDialogAdapter);
    }

    /* loaded from: classes3.dex */
    public static class ListDialogItem {
        final int defaultIcon;
        final Object icon;
        final int id;
        final int textColor;
        final Object title;
        final int type;

        public ListDialogItem(int type, int id, Object title, @ColorRes int textColor, Object icon, int defaultIcon) {
            this.type = type;
            this.id = id;
            this.title = title;
            this.icon = icon;
            this.textColor = textColor;
            this.defaultIcon = defaultIcon;
        }

        public ListDialogItem(int id, Object title, Object icon) {
            this(1, id, title, R.color.list_dialog_blue, icon, 0);
        }
    }

    /* loaded from: classes3.dex */
    public static class ListDialogItemHolder extends RecyclerHolder<ListDialogItem> {
        private VKImageView imageView;
        private android.widget.TextView textView;

        public ListDialogItemHolder(Context context, int viewRes) {
            super(View.inflate(context, viewRes, null));
            this.itemView.setTag(this);
            this.textView = (android.widget.TextView) $(16908308);
            this.imageView = (VKImageView) $(16908294);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ListDialogItem item) {
            if (item.title instanceof Integer) {
                this.textView.setText(((Integer) item.title).intValue());
            } else if (item.title instanceof String) {
                this.textView.setText((String) item.title);
            }
            this.textView.setTextColor(this.textView.getResources().getColor(item.textColor));
            if (item.icon instanceof Integer) {
                this.imageView.loadResource(((Integer) item.icon).intValue());
            } else if (item.icon instanceof String) {
                this.imageView.load((String) item.icon);
            }
        }
    }

    /* loaded from: classes3.dex */
    public static class ListDialogAdapter extends BaseAdapter {
        private List<ListDialogItem> items = Collections.emptyList();

        public ListDialogAdapter(List<ListDialogItem> items) {
            setData(items);
        }

        public void setData(List<ListDialogItem> items) {
            if (items == null) {
                items = Collections.emptyList();
            }
            this.items = items;
            notifyDataSetChanged();
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return this.items.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return this.items.get(position);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return this.items.get(position).id;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            ListDialogItemHolder holder;
            if (convertView == null) {
                int res = this.items.get(position).type == 1 ? R.layout.dialog_list_item_icon : R.layout.dialog_list_item;
                holder = new ListDialogItemHolder(parent.getContext(), res);
                convertView = holder.itemView;
            } else {
                holder = (ListDialogItemHolder) convertView.getTag();
            }
            holder.bind(this.items.get(position));
            return convertView;
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public int getItemViewType(int position) {
            return this.items.get(position).type;
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public int getViewTypeCount() {
            return 2;
        }
    }

    public static void show(Context ctx, List<ListDialogItem> items, View view, AdapterView.OnItemClickListener onItemClickListener) {
        show(ctx, items, 8388693, V.dp(16.0f), V.dp(282.0f), view, onItemClickListener, null);
    }

    public static void show(Context ctx, List<ListDialogItem> items, int gravity, int padding, int width, View view, AdapterView.OnItemClickListener onItemClickListener, @Nullable final OnAttachedListener listener) {
        final RevealLinearLayout rl = new RevealLinearLayout(ctx);
        final ListDialogAdapter adapter = new ListDialogAdapter(items);
        Dialog dlg = new Dialog(ctx, R.style.ListDialog) { // from class: com.vkontakte.android.ui.ListDialog.1
            @Override // android.app.Dialog
            public void onBackPressed() {
                ListDialog.hideDialog(rl, this);
            }

            @Override // android.app.Dialog, android.view.Window.Callback
            public void onAttachedToWindow() {
                super.onAttachedToWindow();
                if (listener != null) {
                    listener.onAttached(adapter);
                }
            }

            @Override // android.app.Dialog, android.view.Window.Callback
            public void onDetachedFromWindow() {
                super.onDetachedFromWindow();
                if (listener != null) {
                    listener.onDetached(adapter);
                }
            }
        };
        Window window = dlg.getWindow();
        WindowManager.LayoutParams wlp = window.getAttributes();
        wlp.gravity = gravity;
        wlp.x = padding - V.dp(5.0f);
        wlp.y = padding - V.dp(9.0f);
        wlp.width = width;
        wlp.height = -2;
        wlp.dimAmount = 0.2f;
        wlp.flags |= 2;
        window.setAttributes(wlp);
        window.requestFeature(1);
        ViewCompat.setElevation(window.getDecorView(), 0.0f);
        window.getDecorView().setBackgroundResource(17170445);
        window.getDecorView().setOnTouchListener(ListDialog$$Lambda$1.lambdaFactory$(rl, dlg));
        ListView lv = new ListView(ctx);
        lv.setPadding(0, V.dp(8.0f), 0, V.dp(8.0f));
        lv.setClipToPadding(false);
        lv.setSelector(R.drawable.highlight);
        lv.setDividerHeight(0);
        lv.setAdapter((ListAdapter) adapter);
        lv.setOnItemClickListener(ListDialog$$Lambda$2.lambdaFactory$(onItemClickListener, rl, dlg));
        rl.setBackgroundResource(R.drawable.list_dialog_bg);
        rl.addView(lv, new ViewGroup.LayoutParams(width, -2));
        showDialog(rl, view);
        dlg.setCanceledOnTouchOutside(false);
        dlg.setContentView(rl, new ViewGroup.LayoutParams(width, -2));
        dlg.setOnDismissListener(ListDialog$$Lambda$3.lambdaFactory$(view));
        dlg.show();
    }

    public static /* synthetic */ boolean lambda$show$0(RevealLinearLayout rl, Dialog dlg, View v, MotionEvent event) {
        if (event.getAction() == 1) {
            hideDialog(rl, dlg);
        }
        return true;
    }

    public static /* synthetic */ void lambda$show$1(AdapterView.OnItemClickListener onItemClickListener, RevealLinearLayout rl, Dialog dlg, AdapterView parent, View view1, int position, long id) {
        if (onItemClickListener != null) {
            onItemClickListener.onItemClick(parent, view1, position, id);
        }
        hideDialog(rl, dlg);
    }

    public static void hideDialog(View v, Dialog d) {
        ViewUtils.dismissDialogSafety(d);
    }

    private static void showDialog(View v, View b) {
        b.setVisibility(8);
    }

    /* loaded from: classes3.dex */
    public static class CreateNewMessageDialog extends ListDialog {
        private ListDialogAdapter adapter = null;
        private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.ui.ListDialog.CreateNewMessageDialog.1
            {
                CreateNewMessageDialog.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (Friends.ACTION_FRIEND_LIST_CHANGED.equals(intent.getAction()) && CreateNewMessageDialog.this.adapter != null) {
                    CreateNewMessageDialog.this.adapter.setData(CreateNewMessageDialog.this.createItems());
                }
                if (LongPollService.ACTION_USER_PRESENCE.equals(intent.getAction())) {
                }
            }
        };
        private OnAttachedListener attachedListener = new OnAttachedListener() { // from class: com.vkontakte.android.ui.ListDialog.CreateNewMessageDialog.2
            {
                CreateNewMessageDialog.this = this;
            }

            @Override // com.vkontakte.android.ui.ListDialog.OnAttachedListener
            public void onAttached(ListDialogAdapter adapter) {
                CreateNewMessageDialog.this.adapter = adapter;
                IntentFilter filter = new IntentFilter();
                filter.addAction(LongPollService.ACTION_USER_PRESENCE);
                filter.addAction(Friends.ACTION_FRIEND_LIST_CHANGED);
                VKApplication.context.registerReceiver(CreateNewMessageDialog.this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
            }

            @Override // com.vkontakte.android.ui.ListDialog.OnAttachedListener
            public void onDetached(ListDialogAdapter adapter) {
                CreateNewMessageDialog.this.adapter = adapter;
                VKApplication.context.unregisterReceiver(CreateNewMessageDialog.this.receiver);
            }
        };

        public ArrayList<ListDialogItem> createItems() {
            ArrayList<ListDialogItem> items = new ArrayList<>();
            ArrayList<UserProfile> friends = new ArrayList<>();
            Friends.getFriends(friends);
            if (friends.size() > 5) {
                friends.subList(5, friends.size()).clear();
            }
            for (int i = 0; i < friends.size(); i++) {
                UserProfile p = friends.get(i);
                items.add(new ListDialogItem(0, p.uid, p.fullName, R.color.almost_black, p.photo, R.drawable.user_placeholder));
            }
            items.add(new ListDialogItem(Integer.MAX_VALUE, Integer.valueOf((int) R.string.create_conversation), Integer.valueOf((int) R.drawable.ic_new_chat)));
            items.add(new ListDialogItem(Integer.MIN_VALUE, Integer.valueOf((int) R.string.write_a_message_2), Integer.valueOf((int) R.drawable.ic_create_new_message)));
            return items;
        }

        public void showNewDialogs(Context ctx, View view, VoidF1<Long> f) {
            show(ctx, createItems(), 8388693, V.dp(16.0f), V.dp(262.0f), view, ListDialog$CreateNewMessageDialog$$Lambda$1.lambdaFactory$(f, ctx), this.attachedListener);
        }

        public static /* synthetic */ void lambda$showNewDialogs$0(VoidF1 f, Context ctx, AdapterView parent, View view1, int position, long id) {
            if (id == 2147483647L || id == -2147483648L) {
                f.f(Long.valueOf(id));
                return;
            }
            ArrayList<UserProfile> friends = new ArrayList<>();
            Friends.getFriends(friends);
            Iterator<UserProfile> it = friends.iterator();
            while (it.hasNext()) {
                UserProfile p = it.next();
                if (p.uid == id) {
                    new ChatFragment.Builder(p.uid, p.fullName).setPhoto(p.photo).go(ctx);
                }
            }
        }
    }
}
