package com.vkontakte.android.ui.holder.messages;

import android.animation.Animator;
import android.animation.ArgbEvaluator;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vk.imageloader.view.VKImageView;
import com.vk.imageloader.view.VKStickerImageView;
import com.vkontakte.android.Photo;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.attachments.AlbumAttachment;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.AudioMessageAttachment;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.GiftAttachment;
import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.SnippetAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.stickers.StickersDetailsFragment;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.LinkedTextView;
import com.vkontakte.android.ui.MessageRelativeLayout;
import com.vkontakte.android.ui.drawables.MessageStatusDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class ChatMessageHolder extends RecyclerHolder<MessageListItem> implements View.OnClickListener, View.OnLongClickListener {
    public final ViewGroup attachments;
    private List<View> attachmentsImageViews;
    public final View attachmentsWrapper;
    private ChatFragment chatFragment;
    public final TextView extGiftText;
    public final TextView fwdName;
    public final TextView fwdTime;
    public final ViewGroup fwdWrap;
    private boolean isActionMod;
    private boolean isActionMode;
    private boolean isSelected;
    private boolean isTimeVisible;
    public MessageListItem lastItem;
    public final VKImageView msgFwdPhoto;
    private int msgId;
    private int peer;
    private final MessageStatusDrawable progressDrawable;
    public final WeakReference<ChatMessageHolder> referenceLinkToHolder;
    public final VKImageView senderPhoto;
    public final TextView showStickerPuckButton;
    public final View stateContainer;
    public final TextView text;
    public final TextView time;
    public final List<View> translatedViews;
    public final ViewGroup wrap;
    private static final int TIME_DX = VKApplication.context.getResources().getDimensionPixelSize(R.dimen.message_time_);
    public static int STANDARD_PADDING = 3;
    public static int STANDARD_PADDING_BOTTOM = 2;
    protected static final int[][] WRAP_BG_RES = {new int[]{R.drawable.bg_msg_in_full, R.drawable.bg_msg_in_top, R.drawable.bg_msg_in_mid, R.drawable.bg_msg_in_bottom, R.drawable.bg_msg_in_full_gift, R.drawable.bg_msg_notail_in_full, R.drawable.bg_msg_notail_in_full_gift, R.drawable.bg_msg_notail_in_top}, new int[]{R.drawable.bg_msg_out_full, R.drawable.bg_msg_out_top, R.drawable.bg_msg_out_mid, R.drawable.bg_msg_out_bottom, R.drawable.bg_msg_out_full_gift, R.drawable.bg_msg_notail_out_full, R.drawable.bg_msg_notail_out_full_gift, R.drawable.bg_msg_notail_out_top}, new int[]{R.drawable.bg_msg_in_full_active, R.drawable.bg_msg_in_top_active, R.drawable.bg_msg_in_mid_active, R.drawable.bg_msg_in_bottom_active, R.drawable.bg_msg_in_full_active, R.drawable.bg_msg_notail_in_full_active, R.drawable.bg_msg_notail_in_full_active, R.drawable.bg_msg_notail_in_top_active}, new int[]{R.drawable.bg_msg_out_full_active, R.drawable.bg_msg_out_top_active, R.drawable.bg_msg_out_mid_active, R.drawable.bg_msg_out_bottom_active, R.drawable.bg_msg_out_full_active, R.drawable.bg_msg_notail_out_full_active, R.drawable.bg_msg_notail_out_full_active, R.drawable.bg_msg_notail_out_top_active}};

    public MessageListItem getLastItem() {
        return this.lastItem;
    }

    public ChatMessageHolder(ViewGroup parent, int viewType, int peer, ChatFragment chatFragment, int fontSize) {
        this(parent, ViewType.getByViewTypeId(viewType));
        this.chatFragment = chatFragment;
        ViewType type = ViewType.getByViewTypeId(viewType);
        boolean isOut = type == ViewType.fwdOut || type == ViewType.giftOut || type == ViewType.messageOut || type == ViewType.messageOutText;
        if (type == ViewType.service) {
            this.text.setMovementMethod(LinkMovementMethod.getInstance());
        } else if (this.text != null && this.senderPhoto != null) {
            if (!isOut && peer < 2000000000) {
                this.senderPhoto.setVisibility(8);
            } else if (!isOut) {
                this.senderPhoto.setOnClickListener(chatFragment.chatUserClickListener);
                this.senderPhoto.setOnLongClickListener(chatFragment.chatUserLongClickListener);
            }
        }
        if (type.canTextSizeChange && this.text != null) {
            this.text.setTextSize(1, 16.0f + (fontSize * 2.0f));
        }
    }

    public ChatMessageHolder(ViewGroup parent, ViewType viewType) {
        super(viewType.res, parent);
        this.isActionMode = false;
        this.isTimeVisible = false;
        this.referenceLinkToHolder = new WeakReference<>(this);
        this.text = (TextView) $(R.id.msg_text);
        if (this.text instanceof LinkedTextView) {
            ((LinkedTextView) this.text).setCanShowMessageOptions(true);
        }
        this.time = (TextView) $(R.id.msg_time);
        View progress = $(R.id.msg_progress);
        if (progress != null) {
            MessageStatusDrawable messageStatusDrawable = new MessageStatusDrawable(getContext());
            this.progressDrawable = messageStatusDrawable;
            progress.setBackgroundDrawable(messageStatusDrawable);
        } else {
            this.progressDrawable = null;
        }
        this.stateContainer = $(R.id.msg_state_container);
        this.wrap = (ViewGroup) $(R.id.msg_wrap);
        this.attachments = (ViewGroup) $(R.id.msg_attachments);
        this.attachmentsWrapper = $(R.id.msg_attachments_wrapper);
        this.senderPhoto = (VKImageView) $(R.id.msg_sender_photo);
        this.msgFwdPhoto = (VKImageView) $(R.id.msg_fwd_photo);
        this.extGiftText = (TextView) $(R.id.ext_gift_text);
        this.showStickerPuckButton = (TextView) $(R.id.show_sticker_puck_button);
        if (this.showStickerPuckButton != null) {
            this.showStickerPuckButton.setOnClickListener(this);
        }
        this.fwdName = (TextView) $(R.id.msg_fwd_name);
        this.fwdTime = (TextView) $(R.id.msg_fwd_time);
        this.fwdWrap = (ViewGroup) $(R.id.msg_fwd_wrap);
        if (this.wrap != null) {
            this.wrap.setOnClickListener(this);
            this.wrap.setOnLongClickListener(this);
        }
        this.itemView.setOnClickListener(this);
        this.itemView.setOnLongClickListener(this);
        this.itemView.setTag(this);
        switch (viewType) {
            case fwdIn:
            case giftIn:
            case messageIn:
            case messageInText:
                this.translatedViews = Collections.singletonList(this.time);
                return;
            case fwdOut:
            case giftOut:
            case messageOut:
            case messageOutText:
                this.translatedViews = Arrays.asList(this.time, this.wrap, this.stateContainer);
                return;
            default:
                this.translatedViews = null;
                return;
        }
    }

    public void showFailed() {
        if (this.progressDrawable != null) {
            this.progressDrawable.setDrawState(MessageStatusDrawable.DrawState.error, true);
        }
    }

    public void setReadState(boolean state) {
        if (this.progressDrawable != null) {
            this.progressDrawable.setDrawState(state ? MessageStatusDrawable.DrawState.haveBeenRed : MessageStatusDrawable.DrawState.sent, true);
        }
    }

    public void setTimeIsVisible(boolean isTimeVisible) {
        this.isTimeVisible = isTimeVisible;
    }

    public Animator getSearchedMessageColorAnimator() {
        ValueAnimator colorAnim = ObjectAnimator.ofInt(this.itemView, TtmlNode.ATTR_TTS_BACKGROUND_COLOR, -2563347, 14213869);
        colorAnim.setEvaluator(new ArgbEvaluator());
        return colorAnim;
    }

    @Nullable
    public List<Animator> setTimeIsVisibleAnim(boolean isTimeVisible) {
        if (this.translatedViews == null) {
            return null;
        }
        List<Animator> animators = new ArrayList<>(this.translatedViews.size());
        for (int i = 0; i < this.translatedViews.size(); i++) {
            View view = this.translatedViews.get(i);
            float[] fArr = new float[2];
            fArr[0] = this.translatedViews.get(i).getTranslationX();
            fArr[1] = isTimeVisible ? TIME_DX : 0.0f;
            animators.add(ObjectAnimator.ofFloat(view, "translationX", fArr));
        }
        return animators;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(MessageListItem item) {
        bind(item, false);
    }

    public void bind(MessageListItem item, boolean animate) {
        bind(item, this.isSelected, this.isActionMod, this.peer, this.msgId, animate);
    }

    public void bind(MessageListItem item, boolean isSelected, boolean isActionMod, int peer, int msgId, boolean animate) {
        boolean z = false;
        this.isSelected = isSelected;
        this.isActionMod = isActionMod;
        this.msgId = msgId;
        this.peer = peer;
        if (this.translatedViews != null) {
            for (int i = 0; i < this.translatedViews.size(); i++) {
                this.translatedViews.get(i).setTranslationX(this.isTimeVisible ? TIME_DX : 0.0f);
            }
        }
        this.lastItem = item;
        this.isActionMode = isActionMod;
        if (item.type != 6) {
            if (item.type == 5) {
                if (TextUtils.isEmpty(item.text)) {
                    this.text.setText(TimeUtils.langDate(item.time));
                    this.text.setTypeface(Font.Medium.typeface);
                    this.text.setMovementMethod(null);
                } else {
                    this.text.setText(item.text);
                    this.text.setMovementMethod(LinkMovementMethod.getInstance());
                }
                processAttachments(item, msgId, isSelected);
            } else {
                processAttachments(item, msgId, isSelected);
                this.text.setText(item.text);
                processSubViewVisible(item);
                this.text.setVisibility(TextUtils.isEmpty(item.text) ? 8 : 0);
                fillBg(item, isSelected, animate);
                processFw(item);
                if (this.senderPhoto != null && !item.isOut) {
                    if (peer > 2000000000) {
                        this.senderPhoto.setVisibility((!item.isShowPhoto() || !(item.type == 2 || item.type == 1)) ? 4 : 0);
                    }
                    this.senderPhoto.setTag(Integer.valueOf(item.msgId));
                }
                ViewGroup viewGroup = this.wrap;
                if (!isActionMod) {
                    z = true;
                }
                viewGroup.setEnabled(z);
            }
            if (this.senderPhoto != null && item.hasMainPhoto()) {
                this.senderPhoto.load(item.getImageUrl());
            }
            if (this.msgFwdPhoto != null && item.getImageUrlFwd() != null) {
                this.msgFwdPhoto.load(item.getImageUrlFwd());
            }
        }
    }

    private void processSubViewVisible(MessageListItem item) {
        ViewUtils.setText(this.time, TimeUtils.time(item.time), false);
        if (item.type != 4 && item.type != 1 && item.type != 7) {
            ViewUtils.setVisibility(this.time, 4);
        } else {
            ViewUtils.setVisibility(this.time, 0);
        }
    }

    private void processAttachments(MessageListItem item, int msgId, boolean isSelected) {
        View stickerView = null;
        if (this.attachments != null) {
            for (int i = 0; i < this.attachments.getChildCount(); i++) {
                View av = this.attachments.getChildAt(i);
                if (av.getTag() != null && (av.getTag() instanceof String)) {
                    Attachment.reuseView(av, av.getTag().toString());
                }
            }
            this.attachments.removeAllViews();
            this.attachmentsImageViews = new ArrayList();
            ArrayList<Photo> photos = new ArrayList<>();
            ArrayList<MusicTrack> audios = new ArrayList<>();
            int ph = 0;
            for (Attachment a : item.getOrCreateAttachments()) {
                if (a instanceof GeoAttachment) {
                    ((GeoAttachment) a).style = 0;
                }
                if (a instanceof SnippetAttachment) {
                    ((SnippetAttachment) a).setReferData(null);
                }
                View v = a.getFullView(getContext());
                this.attachments.addView(v);
                if (a instanceof ImageAttachment) {
                    ((ImageAttachment) a).bind(v);
                }
                if ((a instanceof PhotoAttachment) && !(a instanceof AlbumAttachment)) {
                    int photoIdx = ph;
                    ph++;
                    photos.add(new Photo((PhotoAttachment) a));
                    v.setOnClickListener(ChatMessageHolder$$Lambda$1.lambdaFactory$(this, photos, photoIdx));
                }
                if (a instanceof AudioAttachment) {
                    audios.add(((AudioAttachment) a).musicTrack);
                    v.setPadding(V.dp(8.0f), v.getPaddingTop(), V.dp(8.0f), v.getPaddingBottom());
                }
                if (a instanceof VideoAttachment) {
                    ((VideoAttachment) a).setReferData("messages", null);
                }
                if (a instanceof GiftAttachment) {
                    ((GiftAttachment) a).setCallback(this.chatFragment);
                    if (((GiftAttachment) a).hasPackId()) {
                        if (this.extGiftText != null) {
                            this.extGiftText.setText(R.string.stickers_title);
                            this.extGiftText.setCompoundDrawablesWithIntrinsicBounds(getContext().getResources().getDrawable(R.drawable.ic_chat_att_stickerpack), (Drawable) null, (Drawable) null, (Drawable) null);
                        }
                        ViewUtils.setVisibility(this.showStickerPuckButton, 0);
                    } else {
                        if (this.extGiftText != null) {
                            this.extGiftText.setText(R.string.gift);
                            this.extGiftText.setCompoundDrawablesWithIntrinsicBounds(getContext().getResources().getDrawable(R.drawable.ic_chat_att_gift), (Drawable) null, (Drawable) null, (Drawable) null);
                        }
                        ViewUtils.setVisibility(this.showStickerPuckButton, 8);
                    }
                }
                if (a instanceof AudioMessageAttachment) {
                    ((AudioMessageAttachment) a).setMessageId(msgId);
                }
            }
            if (audios.size() > 0) {
                int i2 = 0;
                for (Attachment a2 : item.getOrCreateAttachments()) {
                    if (a2 instanceof AudioAttachment) {
                        ((AudioAttachment) a2).playlistPos = i2;
                        ((AudioAttachment) a2).playlist = audios;
                        ((AudioAttachment) a2).setReferData("messages", null);
                        i2++;
                    }
                }
            }
            int idx = 0;
            for (Attachment a3 : item.getOrCreateAttachments()) {
                if (a3 instanceof ImageAttachment) {
                    View av2 = this.attachments.getChildAt(idx);
                    this.attachmentsImageViews.add(av2);
                    if (a3 instanceof StickerAttachment) {
                        stickerView = av2;
                        ((StickerAttachment) a3).setCallback(this.chatFragment);
                    } else if (a3 instanceof GraffitiAttachment) {
                        stickerView = av2;
                    }
                }
                idx++;
            }
        }
        if (item.type == 5) {
            for (int i3 = 0; this.attachments != null && i3 < this.attachments.getChildCount(); i3++) {
                FlowLayout.LayoutParams lp = (FlowLayout.LayoutParams) this.attachments.getChildAt(i3).getLayoutParams();
                lp.vertical_spacing = 0;
                this.attachments.getChildAt(i3).setLayoutParams(lp);
            }
        }
        if (item.type != 5) {
            if ((item.isSticker() || item.isGraffiti()) && item.fwdLevel == 0 && stickerView != null) {
                if (isSelected) {
                    ((ImageView) stickerView).setColorFilter(VKStickerImageView.OVERLAY_COLOR);
                } else {
                    ((ImageView) stickerView).setColorFilter(0);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$processAttachments$0(ArrayList photos, int photoIdx, View v1) {
        if (this.attachments.getTag(R.id.photo_viewer) == null) {
            PhotoViewer viewer = new PhotoViewer((Activity) getContext(), photos, photoIdx, new PhotoViewer.PhotoViewerCallbackAdapter() { // from class: com.vkontakte.android.ui.holder.messages.ChatMessageHolder.1
                @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallbackAdapter, com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
                    View v = ChatMessageHolder.this.attachments.getChildAt(index);
                    if (v != null) {
                        int[] loc = {0, 0};
                        v.getLocationInWindow(loc);
                        outRect.set(loc[0], loc[1], loc[0] + v.getWidth(), loc[1] + v.getHeight());
                        View list = v.getRootView().findViewById(R.id.list);
                        if (list != null) {
                            Point offset = V.getViewOffset(v, list);
                            if (offset.y < 0) {
                                outClip.top = -offset.y;
                            }
                            if (offset.y + v.getHeight() > list.getHeight()) {
                                outClip.bottom = (offset.y + v.getHeight()) - list.getHeight();
                            }
                        }
                    }
                }

                @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallbackAdapter, com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                public void onDismissed() {
                    ChatMessageHolder.this.attachments.setTag(R.id.photo_viewer, null);
                }
            });
            this.attachments.setTag(R.id.photo_viewer, viewer);
            viewer.show();
        }
    }

    private void processFw(MessageListItem item) {
        if (item.fwdLevel > 0) {
            ((MessageRelativeLayout) this.wrap).setLevel(item.fwdLevelLast, item.fwdLevel, item.fwdLevelNext);
            this.fwdName.setText(item.fwdName);
            this.fwdTime.setText(TimeUtils.langDate(item.fwdTime));
            this.fwdWrap.setTag(Integer.valueOf(item.fwdUid));
            this.fwdWrap.setOnClickListener(this);
        }
    }

    private void fillBg(MessageListItem item, boolean isSelected, boolean animate) {
        int padBtm = V.dp(STANDARD_PADDING_BOTTOM);
        int padTop = V.dp(STANDARD_PADDING);
        int index = (item.isOut ? 1 : 0) | ((isSelected ? 1 : 0) << 1);
        boolean canShowDot = false;
        if ((item.isSticker() || item.isGraffiti()) && item.fwdLevel == 0) {
            this.wrap.setBackgroundDrawable(new ColorDrawable(0));
            canShowDot = true;
        } else if (this.wrap != null) {
            int wPL = this.wrap.getPaddingLeft();
            int wPT = this.wrap.getPaddingTop();
            int wPR = this.wrap.getPaddingRight();
            int wPB = this.wrap.getPaddingBottom();
            switch (item.type) {
                case 2:
                    this.wrap.setBackgroundResource(WRAP_BG_RES[index][item.isFirstBubbleBg() ? (char) 1 : (char) 7]);
                    padBtm = 0;
                    break;
                case 3:
                    this.wrap.setBackgroundResource(WRAP_BG_RES[index][2]);
                    padBtm = 0;
                    padTop = 0;
                    break;
                case 4:
                    this.wrap.setBackgroundResource(WRAP_BG_RES[index][3]);
                    padTop = 0;
                    canShowDot = true;
                    break;
                case 5:
                case 6:
                default:
                    if (!item.isTime()) {
                        this.wrap.setBackgroundResource(WRAP_BG_RES[index][item.isFirstBubbleBg() ? (char) 0 : (char) 5]);
                        canShowDot = true;
                        break;
                    }
                    break;
                case 7:
                    this.wrap.setBackgroundResource(WRAP_BG_RES[index][item.isFirstBubbleBg() ? (char) 4 : (char) 6]);
                    canShowDot = true;
                    break;
            }
            this.wrap.setPadding(wPL, wPT, wPR, wPB);
            if (item.fwdLevel > 0) {
                ((MessageRelativeLayout) this.wrap).setPaddingD((item.type == 1 || item.type == 2) ? V.dp(8.0f) : 0, (item.type == 1 || item.type == 4) ? V.dp(8.0f) : 0);
            }
        }
        if (item.isOut && this.progressDrawable != null) {
            if (!canShowDot) {
                this.progressDrawable.setDrawState(MessageStatusDrawable.DrawState.haveBeenRed, false);
            } else if (item.isFailed) {
                this.progressDrawable.setDrawState(MessageStatusDrawable.DrawState.error, animate);
            } else if (item.msgId < 0) {
                this.progressDrawable.setDrawState(MessageStatusDrawable.DrawState.sending, animate);
            } else if (!item.readState) {
                this.progressDrawable.setDrawState(MessageStatusDrawable.DrawState.sent, animate);
            } else {
                this.progressDrawable.setDrawState(MessageStatusDrawable.DrawState.haveBeenRed, animate);
            }
        }
        int paddingLeft = this.itemView.getPaddingLeft();
        int paddingRight = this.itemView.getPaddingRight();
        if (this.chatFragment.searchedMessageId != 0) {
            this.itemView.setBackgroundColor(item.msgId == this.chatFragment.searchedMessageId ? -2563347 : 0);
        }
        this.itemView.setPadding(paddingLeft, padTop, paddingRight, padBtm);
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) this.wrap.getLayoutParams();
        lp.weight = (item.type == 1 || item.type == 7) ? 0.0f : 1.0f;
        this.wrap.setLayoutParams(lp);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (R.id.show_sticker_puck_button == v.getId()) {
            if (this.lastItem.hasAttachments() && (this.lastItem.getOrCreateAttachments().get(0) instanceof GiftAttachment)) {
                int packId = ((GiftAttachment) this.lastItem.getOrCreateAttachments().get(0)).packID;
                StickersDetailsFragment.show(packId, "message", v.getContext());
            }
        } else if (v == this.itemView && (this.isActionMode || !this.chatFragment.isShowingTime())) {
            onClick();
        } else if (v == this.itemView) {
            this.chatFragment.toggleTime();
        } else {
            switch (v.getId()) {
                case R.id.msg_failed /* 2131755094 */:
                case R.id.msg_wrap /* 2131755101 */:
                    onClick();
                    return;
                case R.id.msg_fwd_wrap /* 2131755931 */:
                    new ProfileFragment.Builder(((Integer) v.getTag()).intValue()).go(getContext());
                    return;
                default:
                    return;
            }
        }
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        return onLongClick();
    }

    public void onClick() {
        if (this.lastItem.type != 5 && this.lastItem.type != 6 && this.chatFragment != null) {
            this.chatFragment.onItemClick(this.lastItem);
        }
    }

    public boolean onLongClick() {
        return (this.lastItem.type == 5 || this.lastItem.type == 6 || this.chatFragment == null || !this.chatFragment.onItemLongClick(this.lastItem)) ? false : true;
    }

    public static int getViewType(MessageListItem item) {
        if (item.type == 5) {
            return !item.hasAttachments() ? ViewType.serviceWithoutImage.viewTypeId : ViewType.service.viewTypeId;
        } else if (item.type == 6) {
            return ViewType.unreadSeparator.viewTypeId;
        } else {
            return item.type == 7 ? item.isOut ? ViewType.giftOut.viewTypeId : ViewType.giftIn.viewTypeId : item.fwdLevel > 0 ? item.isOut ? ViewType.fwdOut.viewTypeId : ViewType.fwdIn.viewTypeId : !item.hasAttachments() ? item.isOut ? ViewType.messageOutText.viewTypeId : ViewType.messageInText.viewTypeId : item.isOut ? ViewType.messageOut.viewTypeId : ViewType.messageIn.viewTypeId;
        }
    }

    /* loaded from: classes3.dex */
    private enum ViewType {
        service(R.layout.message_service, R.id.messages_holder_service, false),
        serviceWithoutImage(R.layout.message_service_time, R.id.messages_holder_service_time, false),
        unreadSeparator(R.layout.chat_unread_divider, R.id.messages_holder_unreadSeparator, false),
        giftIn(R.layout.message_gift_in, R.id.messages_holder_giftIn, true),
        giftOut(R.layout.message_gift_out, R.id.messages_holder_giftOut, true),
        fwdIn(R.layout.message_in_fwd, R.id.messages_holder_fwdIn, true),
        fwdOut(R.layout.message_out_fwd, R.id.messages_holder_fwdOut, true),
        messageIn(R.layout.message_in, R.id.messages_holder_messageIn, true),
        messageOut(R.layout.message_out, R.id.messages_holder_messageOut, true),
        messageInText(R.layout.message_in_empty_attach, R.id.messages_holder_messageInText, true),
        messageOutText(R.layout.message_out_empty_attach, R.id.messages_holder_messageOutText, true);
        
        public boolean canTextSizeChange;
        public final int res;
        public final int viewTypeId;

        ViewType(int res, int viewTypeId, boolean canTextSizeChange) {
            this.res = res;
            this.viewTypeId = viewTypeId;
            this.canTextSizeChange = canTextSizeChange;
        }

        public static ViewType getByViewTypeId(int viewTypeId) {
            ViewType[] values;
            for (ViewType viewType : values()) {
                if (viewType.viewTypeId == viewTypeId) {
                    return viewType;
                }
            }
            throw new RuntimeException("viewTypeId is incorrect");
        }
    }
}
