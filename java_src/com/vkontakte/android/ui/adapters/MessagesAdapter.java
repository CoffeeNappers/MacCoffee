package com.vkontakte.android.ui.adapters;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.preference.PreferenceManager;
import android.view.ViewGroup;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.ui.holder.messages.ChatMessageHolder;
import com.vkontakte.android.ui.holder.messages.LoadMoreHolder;
import com.vkontakte.android.ui.holder.messages.MessageListItem;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class MessagesAdapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
    private ChatFragment chatFragment;
    private int fontSize;
    private boolean isTimeVisible = false;
    private LoadMoreHolder.LoaderMoreHolderData topLoadingView = null;
    private LoadMoreHolder.LoaderMoreHolderData bottomLoadingView = null;
    private ArrayList<MessageListItem> items = new ArrayList<>();
    private ArrayList<WeakReference<ChatMessageHolder>> weakReferences = new ArrayList<>();

    public void toggle() {
        setTimeIsVisible(!this.isTimeVisible);
    }

    public boolean isTimeVisible() {
        return this.isTimeVisible;
    }

    public void setSearchedViewBackgroundColor(int id) {
        Animator animator;
        ArrayList<Animator> animators = new ArrayList<>();
        Iterator<WeakReference<ChatMessageHolder>> iterator = this.weakReferences.iterator();
        while (iterator.hasNext()) {
            WeakReference<ChatMessageHolder> reference = iterator.next();
            ChatMessageHolder holder = reference.get();
            if (holder == null) {
                iterator.remove();
            } else if (holder.lastItem.msgId == id && (animator = holder.getSearchedMessageColorAnimator()) != null) {
                animators.add(animator);
            }
        }
        if (!animators.isEmpty()) {
            AnimatorSet animatorSet = new AnimatorSet().setDuration(400L);
            animatorSet.playTogether(animators);
            animatorSet.start();
        }
    }

    public void setTimeIsVisible(boolean isTimeVisible) {
        this.isTimeVisible = isTimeVisible;
        ArrayList<Animator> animators = new ArrayList<>();
        Iterator<WeakReference<ChatMessageHolder>> iterator = this.weakReferences.iterator();
        while (iterator.hasNext()) {
            WeakReference<ChatMessageHolder> reference = iterator.next();
            ChatMessageHolder holder = reference.get();
            if (holder == null) {
                iterator.remove();
            } else {
                List<Animator> animator = holder.setTimeIsVisibleAnim(isTimeVisible);
                if (animator != null) {
                    animators.addAll(animator);
                }
            }
        }
        if (!animators.isEmpty()) {
            AnimatorSet animatorSet = new AnimatorSet().setDuration(200L);
            animatorSet.playTogether(animators);
            animatorSet.start();
        }
    }

    public MessageListItem getMessageItemByPosition(int position) {
        if (position != 0 || this.topLoadingView == null) {
            int position2 = position - (this.topLoadingView == null ? 0 : 1);
            if (position2 > 0 && position2 < this.items.size()) {
                return this.items.get(position2);
            }
            return null;
        }
        return null;
    }

    public ArrayList<MessageListItem> prepareItems(ArrayList<MessageListItem> items) {
        ArrayList<MessageListItem> items2 = items == null ? new ArrayList<>() : new ArrayList<>(items);
        MessageListItem lastMessage = null;
        for (int i = 0; i < items2.size(); i++) {
            MessageListItem item = items2.get(i);
            item.isFirst = lastMessage == null || lastMessage.type == 5 || lastMessage.type == 6 || lastMessage.uid != item.uid;
            lastMessage = item;
            lastMessage.isLast = false;
        }
        if (lastMessage != null) {
            lastMessage.isLast = true;
        }
        return items2;
    }

    public void setItems(ArrayList<MessageListItem> items) {
        this.items = items;
        notifyDataSetChanged();
    }

    public void setTopLoadingView(LoadMoreHolder.LoaderMoreHolderData topLoadingView) {
        this.topLoadingView = topLoadingView;
    }

    public void setBottomLoadingView(LoadMoreHolder.LoaderMoreHolderData bottomLoadinView) {
        this.bottomLoadingView = bottomLoadinView;
    }

    public MessagesAdapter(ChatFragment chatFragment) {
        this.chatFragment = chatFragment;
        setHasStableIds(true);
        this.fontSize = Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(chatFragment.getActivity()).getString(TtmlNode.ATTR_TTS_FONT_SIZE, AppEventsConstants.EVENT_PARAM_VALUE_NO));
    }

    public int getHeaderViewsCount() {
        return this.topLoadingView == null ? 0 : 1;
    }

    public int getFooterViewsCount() {
        return this.bottomLoadingView == null ? 0 : 1;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        if (viewType == R.id.messages_holder_top_loader || viewType == R.id.messages_holder_bottom_loader) {
            return new LoadMoreHolder(parent);
        }
        ChatMessageHolder holder = new ChatMessageHolder(parent, viewType, this.chatFragment.getPeerID(), this.chatFragment, this.fontSize);
        this.weakReferences.add(new WeakReference<>(holder));
        return holder;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        if (position == 0 && this.topLoadingView != null) {
            return R.id.messages_holder_top_loader;
        }
        int position2 = position - (this.topLoadingView == null ? 0 : 1);
        if (position2 < this.items.size()) {
            return ChatMessageHolder.getViewType(this.items.get(position2));
        }
        return R.id.messages_holder_bottom_loader;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
        boolean z = true;
        if (position == 0 && this.topLoadingView != null) {
            ((LoadMoreHolder) holder).bind(this.topLoadingView);
            return;
        }
        int position2 = position - (this.topLoadingView == null ? 0 : 1);
        if (position2 < this.items.size()) {
            MessageListItem item = this.items.get(position2);
            ((ChatMessageHolder) holder).setTimeIsVisible(this.isTimeVisible);
            ChatMessageHolder chatMessageHolder = (ChatMessageHolder) holder;
            boolean isSelected = this.chatFragment.isSelected(item.msgId);
            if (this.chatFragment.actionMode == null) {
                z = false;
            }
            chatMessageHolder.bind(item, isSelected, z, this.chatFragment.getPeerID(), item.msgId, false);
            item.setHolder(((ChatMessageHolder) holder).referenceLinkToHolder);
        } else if (position2 - this.items.size() == 0 && this.bottomLoadingView != null) {
            ((LoadMoreHolder) holder).bind(this.bottomLoadingView);
        }
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        if (position == 0 && this.topLoadingView != null) {
            return 0L;
        }
        int position2 = position - (this.topLoadingView == null ? 0 : 1);
        if (position2 < this.items.size()) {
            return this.items.get(position2).itemId;
        }
        return -1L;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        int i = 0;
        int size = (this.topLoadingView == null ? 0 : 1) + this.items.size();
        if (this.bottomLoadingView != null) {
            i = 1;
        }
        return size + i;
    }
}
