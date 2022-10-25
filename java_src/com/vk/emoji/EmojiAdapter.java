package com.vk.emoji;

import android.content.Context;
import android.graphics.Typeface;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.vk.emoji.EmojiRecyclerView;
import java.util.ArrayList;
import java.util.Arrays;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class EmojiAdapter extends RecyclerView.Adapter<EmojiHolder> implements EmojiRecyclerView.HeaderInfoProvider, ScrollPositionProvider {
    private static final int TYPE_HEADER = 0;
    private static final int TYPE_ITEM = 1;
    private final Context context;
    private final int emojiCount;
    private EmojiKeyboardListener emojiKeyboardListener;
    private final EmojiRecyclerView emojiRecyclerView;
    private Typeface headersTypeface;
    private final RecentItemStore recentStore;
    private final ArrayList<String> recentData = new ArrayList<>();
    private final ArrayList<String[]> data = EmojiGenerated.KEYBOARD_MAP;
    private final int dataSize = this.data.size();
    private final int[] headerPositions = new int[this.dataSize];

    public EmojiAdapter(Context context, EmojiRecyclerView recyclerView, RecentItemStore recentItemStore, EmojiKeyboardListener emojiKeyboardListener, Typeface headersTypeface) {
        this.context = context;
        this.emojiRecyclerView = recyclerView;
        this.recentStore = recentItemStore;
        this.emojiKeyboardListener = emojiKeyboardListener;
        this.headersTypeface = headersTypeface;
        int emojiCountTmp = 0;
        for (int i = 0; i < this.data.size(); i++) {
            this.headerPositions[i] = emojiCountTmp + i;
            emojiCountTmp += this.data.get(i).length;
        }
        this.emojiCount = emojiCountTmp;
        updateRecents();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public EmojiHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return viewType == 0 ? new EmojiHeaderHolder(this.context, this.headersTypeface) : new EmojiItemHolder(this.context, this.recentStore, this.emojiKeyboardListener);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(EmojiHolder holder, int position) {
        if (holder.getClass() == EmojiItemHolder.class) {
            ((EmojiItemHolder) holder).update(getItem(position));
        } else {
            ((EmojiHeaderHolder) holder).update(this.context.getResources().getString(getHeaderTitleResId(position)));
        }
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return getItem(position) == null ? 0 : 1;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.dataSize + this.emojiCount + recentCountWithHeader();
    }

    public void setEmojiKeyboardListener(EmojiKeyboardListener emojiKeyboardListener) {
        this.emojiKeyboardListener = emojiKeyboardListener;
    }

    public void setHeadersTypeface(Typeface headersTypeface) {
        this.headersTypeface = headersTypeface;
    }

    public void updateRecents() {
        int recentsCount = this.emojiRecyclerView.getSpanCount() * 2;
        this.recentData.clear();
        String[] recents = this.recentStore.load();
        for (int i = 0; i < Math.min(recents.length, recentsCount); i++) {
            this.recentData.add(recents[i]);
        }
        notifyDataSetChanged();
    }

    @Override // com.vk.emoji.EmojiRecyclerView.HeaderInfoProvider
    public boolean isHeader(int pos) {
        return getItemViewType(pos) == 0;
    }

    private int getHeaderTitleResId(int index) {
        int recentCountWithHeader = recentCountWithHeader();
        if (index == 0 && recentCountWithHeader > 0) {
            return R.string.emoji_frequently_used;
        }
        int pos = Arrays.binarySearch(this.headerPositions, index - recentCountWithHeader);
        if (pos < 0) {
            throw new RuntimeException("Invalid emoji set");
        }
        switch (pos) {
            case 0:
                return R.string.emoji_emojis;
            case 1:
                return R.string.emoji_gestures_and_people;
            case 2:
                return R.string.emoji_symbols;
            case 3:
                return R.string.emoji_animals_and_plants;
            case 4:
                return R.string.emoji_food_and_drink;
            case 5:
                return R.string.emoji_sport_and_activity;
            case 6:
                return R.string.emoji_travels_and_transport;
            case 7:
                return R.string.emoji_objects;
            case 8:
                return R.string.emoji_flags;
            default:
                return R.string.emoji_emojis;
        }
    }

    private String getItem(int index) {
        if (index == 0) {
            return null;
        }
        int recentsCountWithHeader = recentCountWithHeader();
        if (index < recentsCountWithHeader) {
            return this.recentData.get(index - 1);
        }
        int index2 = index - recentsCountWithHeader;
        int pos = Arrays.binarySearch(this.headerPositions, index2);
        if (pos >= 0) {
            return null;
        }
        for (int i = this.headerPositions.length - 1; i >= 0; i--) {
            if (index2 > this.headerPositions[i]) {
                int catIndex = i;
                int targetIndex = (index2 - this.headerPositions[i]) - 1;
                return this.data.get(catIndex)[targetIndex];
            }
        }
        return null;
    }

    private int recentCountWithHeader() {
        if (this.recentData.size() == 0) {
            return 0;
        }
        return this.recentData.size() + 1;
    }

    @Override // com.vk.emoji.ScrollPositionProvider
    public int getScrollPosition(float floatPosition) {
        int i = 1;
        boolean hasRecent = this.recentData.size() > 0;
        int headersCount = (hasRecent ? this.headerPositions.length + 1 : this.headerPositions.length) - 1;
        int targetPosition = (int) (headersCount * floatPosition);
        if (targetPosition != 0 || !hasRecent) {
            int recentCountWithHeader = recentCountWithHeader();
            int[] iArr = this.headerPositions;
            if (!hasRecent) {
                i = 0;
            }
            return recentCountWithHeader + iArr[targetPosition - i];
        }
        return 0;
    }
}
