package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.text.BoringLayout;
import android.text.Layout;
import android.text.Spannable;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.RoundingParams;
import com.vk.emoji.Emoji;
import com.vk.emoji.EmojiView;
import com.vk.imageloader.AvatarDataSource;
import com.vk.imageloader.view.VKMultiImageView;
import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkSpan;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GiftAttachment;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.functions.VoidF0;
import java.util.Arrays;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class DialogEntryView extends VKMultiImageView implements EmojiView {
    private static Drawable sErrorImage;
    private static Drawable sOnline;
    private static Drawable sOnlineMobile;
    private Drawable mAttachIcon;
    private float mAttachLabelX;
    private float mAttachLabelY;
    private String mAttachText;
    private TextPaint mAttachTextPaint;
    private String mChatContentDescription;
    private Paint mCounterBgPaint;
    private RectF mCounterBounds;
    private float mCounterLabelX;
    private float mCounterLabelY;
    private Paint mCounterMutedBgPaint;
    private String mCounterText;
    private TextPaint mCounterTextPaint;
    private DialogEntry mData;
    private float mDotX;
    private float mDotY;
    private boolean mDrawAttachIcon;
    private boolean mDrawAttachLabel;
    private boolean mDrawCounter;
    private boolean mDrawError;
    private boolean mDrawMessageText;
    private boolean mDrawMuted;
    private boolean mDrawOnline;
    private boolean mDrawSecondaryImage;
    private boolean mDrawTyping;
    private boolean mDrawUnreadDot;
    private final Paint mEraserPaint;
    private boolean mGroupChat;
    private int mMaxMessageHeight;
    private float mMessageLabelX;
    private float mMessageLabelY;
    private Layout mMessageLayout;
    private BoringLayout.Metrics mMessageSingleLineMetrics;
    private TextPaint mMessageTextPaint;
    private Drawable mMutedIcon;
    private Drawable mOnlineIcon;
    private Bitmap mPlaceholderUser;
    private Bitmap mPrimaryBitmap;
    private Canvas mPrimaryCanvas;
    private final Paint mPrimaryPaint;
    private Rect mSubtitleBounds;
    private float mTimeLabelX;
    private float mTimeLabelY;
    private String mTimeText;
    private TextPaint mTimeTextPaint;
    private float mTitleLabelX;
    private float mTitleLabelY;
    private String mTitleText;
    private TextPaint mTitleTextPaint;
    private float mTypingLabelX;
    private float mTypingLabelY;
    private Layout mTypingLayout;
    private TextPaint mTypingTextPaint;
    private List<UserProfile> mTypingUsers;
    private boolean mUseShortFormat;
    private int primaryImagesCount;
    private String[] primaryUrls;
    private VoidF0 uiInvalidate;
    private static final RectF PRIMARY_IMAGE_BOUNDS = new RectF(Global.scale(12.0f), Global.scale(10.0f), Global.scale(76.0f), Global.scale(74.0f));
    private static final RectF SECONDARY_IMAGE_BOUNDS = new RectF(Global.scale(88.0f), Global.scale(38.0f), Global.scale(120.0f), Global.scale(70.0f));
    private static final int TOTAL_HEIGHT = Global.scale(84.0f);
    private static final int DIVIDER_X = Global.scale(88.0f);
    private static final int DIVIDER_Y = TOTAL_HEIGHT - Math.max(1, V.dp(0.5f));
    private static final Paint sDividerPaint = new Paint(5);
    private static final Paint sDotPaint = new Paint(5);
    private static final int TITLE_BASELINE = Global.scale(27.0f);
    private static final int TITLE_HALF_HEIGHT = Global.scale(12.0f) >> 1;
    private static final int TIME_BASELINE = Global.scale(27.0f);
    private static final int PRIMARY_IMAGE_MARGIN = Global.scale(12.0f);
    private static final int TIME_MARGIN_LEFT = Global.scale(5.0f);
    private static final int TIME_MARGIN_RIGHT = Global.scale(16.0f);
    private static final int MUTED_MARGIN = Global.scale(6.0f);
    private static final int CONTENT_MARGIN_RIGHT = Global.scale(13.5f);
    private static final int COUNTER_BORDER_RADIUS = Global.scale(12.0f);
    private static final int COUNTER_HORIZONTAL_PADDING = Global.scale(8.0f);
    private static final int COUNTER_VERTICAL_PADDING = Global.scale(4.0f);
    private static final int COUNTER_MARGIN_LEFT = Global.scale(7.0f);
    private static final int COUNTER_MARGIN_RIGHT = Global.scale(2.5f);
    private static final int COUNTER_TOP = Global.scale(42.0f);
    private static final int TYPING_MARGIN = Global.scale(15.0f);
    private static final int SECONDARY_IMAGE_MARGIN = Global.scale(10.0f);
    private static final int SHORT_SUBTITLE_BASELINE = Global.scale(58.66f);
    private static final int ATTACH_ICON_MARGIN = Global.scale(9.0f);
    private static final int SUBTITLE_TOP = Global.scale(34.0f);
    private static final int ATTACH_ICON_TOP_EXTRA = Global.scale(-2.0f);
    public static final int SUBTITLE_LINE_HEIGHT = V.dp(2.33f);
    public static final int ATTACH_ICON_SHORT_OFFSETS = V.dp(1.0f);
    private static final int ATTACH_ICON_LEFT_MARGIN = ATTACH_ICON_SHORT_OFFSETS;
    public static final int ATTACH_LABEL_EXTRA = V.dp(2.5f);
    private static final int DOT_RADIUS = V.dp(4.0f);
    private static final float DOT_MARGIN_LEFT = V.dp(12.5f);
    private static final float DOT_MARGIN_RIGHT = V.dp(12.5f);

    static {
        sDividerPaint.setColor(-2500135);
        sDotPaint.setColor(-8740660);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0() {
        if (this.mDrawTyping) {
            invalidate();
        }
    }

    public DialogEntryView(Context context) {
        super(context);
        this.primaryImagesCount = 1;
        this.primaryUrls = new String[4];
        this.mEraserPaint = new Paint(1);
        this.mPrimaryPaint = new Paint(7);
        this.mCounterBounds = new RectF(0.0f, 0.0f, 0.0f, 0.0f);
        this.mSubtitleBounds = new Rect(0, Math.round(SECONDARY_IMAGE_BOUNDS.top), 0, Math.round(SECONDARY_IMAGE_BOUNDS.bottom));
        this.uiInvalidate = DialogEntryView$$Lambda$1.lambdaFactory$(this);
        init(context);
    }

    private void init(Context context) {
        for (int i = 0; i < 5; i++) {
            addImage();
            this.draweeHolder.get(i).getHierarchy().setPlaceholderImage(R.drawable.user_placeholder);
        }
        setScaleType(ScalingUtils.ScaleType.CENTER_CROP);
        this.draweeHolder.get(4).getHierarchy().setRoundingParams(RoundingParams.asCircle());
        this.mEraserPaint.setColor(-1);
        this.mEraserPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        this.mTitleTextPaint = new TextPaint(1);
        this.mTitleTextPaint.setTextSize(Global.scale(17.0f));
        this.mTitleTextPaint.setColor(-13750221);
        this.mTypingTextPaint = new TextPaint(1);
        this.mTypingTextPaint.setTypeface(Typeface.DEFAULT);
        this.mTypingTextPaint.setTextSize(Global.scale(15.0f));
        this.mTypingTextPaint.setColor(-7829368);
        this.mMessageTextPaint = new TextPaint(1);
        this.mMessageTextPaint.setTypeface(Typeface.DEFAULT);
        this.mMessageTextPaint.setTextSize(Global.scale(15.0f));
        this.mMessageTextPaint.setColor(-8881798);
        this.mAttachTextPaint = new TextPaint(1);
        this.mAttachTextPaint.setTypeface(Typeface.DEFAULT);
        this.mAttachTextPaint.setTextSize(Global.scale(15.0f));
        this.mAttachTextPaint.setColor(-10717031);
        this.mTimeTextPaint = new TextPaint(1);
        this.mTimeTextPaint.setColor(-8881798);
        this.mTimeTextPaint.setTextSize(Global.scale(12.0f));
        this.mCounterTextPaint = new TextPaint(1);
        this.mCounterTextPaint.setColor(-1);
        this.mCounterTextPaint.setTextSize(Global.scale(14.0f));
        this.mCounterTextPaint.setTypeface(Font.Medium.typeface);
        this.mCounterBgPaint = new Paint(1);
        this.mCounterBgPaint.setColor(-10316852);
        this.mCounterMutedBgPaint = new Paint(1);
        this.mCounterMutedBgPaint.setColor(-4406324);
        this.mPlaceholderUser = Global.getResBitmap(getResources(), R.drawable.user_placeholder);
        this.mMutedIcon = context.getResources().getDrawable(R.drawable.ic_messages_muted_gray_16dp);
        this.mMessageSingleLineMetrics = createFontMetrics(this.mMessageTextPaint);
        this.mChatContentDescription = getResources().getString(R.string.notification_in_chat_summary);
        if (sErrorImage == null) {
            sErrorImage = context.getResources().getDrawable(R.drawable.ic_msg_error);
            sErrorImage.setBounds(0, 0, sErrorImage.getIntrinsicWidth(), sErrorImage.getIntrinsicHeight());
        }
        if (sOnline == null) {
            sOnline = context.getResources().getDrawable(R.drawable.ic_online_overlay_for_64dp);
            int right = (int) PRIMARY_IMAGE_BOUNDS.right;
            int bottom = (int) PRIMARY_IMAGE_BOUNDS.bottom;
            sOnline.setBounds(right - sOnline.getIntrinsicWidth(), bottom - sOnline.getIntrinsicHeight(), right, bottom);
        }
        if (sOnlineMobile == null) {
            sOnlineMobile = context.getResources().getDrawable(R.drawable.ic_online_overlay_mobile_for_64dp);
            int right2 = (int) PRIMARY_IMAGE_BOUNDS.right;
            int bottom2 = (int) PRIMARY_IMAGE_BOUNDS.bottom;
            sOnlineMobile.setBounds(right2 - sOnlineMobile.getIntrinsicWidth(), bottom2 - sOnlineMobile.getIntrinsicHeight(), right2, bottom2);
        }
        staticLayout();
    }

    public void setData(DialogEntry data, String userPhoto) {
        boolean z = false;
        this.mData = data;
        this.mGroupChat = this.mData.profile.uid > 2000000000;
        this.mTypingUsers = this.mData.getWritesMessage();
        this.mDrawTyping = this.mTypingUsers != null && this.mTypingUsers.size() > 0;
        this.mUseShortFormat = (!this.mData.lastMessage.isServiceMessage && (this.mGroupChat || this.mData.lastMessage.out)) || (this.mData.lastMessage.isServiceMessage && !this.mData.lastMessage.readState && this.mData.lastMessage.out);
        this.mDrawOnline = this.mData.profile.online > 0 && !this.mGroupChat;
        this.mDrawMuted = this.mData.muted;
        this.mDrawError = false;
        this.mDrawCounter = !this.mDrawError && this.mData.unreadCount > 0 && !this.mData.lastMessage.out && !this.mData.lastMessage.readState;
        this.mDrawSecondaryImage = (this.mGroupChat || this.mData.lastMessage.out) && !this.mData.lastMessage.isServiceMessage;
        this.mDrawUnreadDot = !this.mDrawError && this.mUseShortFormat && this.mData.lastMessage.out && !this.mData.lastMessage.readState;
        if (!this.mData.lastMessage.attachments.isEmpty()) {
            Drawable attachIcon = getAttachIcon(this.mData.lastMessage.attachments.get(0));
            this.mAttachIcon = attachIcon;
            if (attachIcon != null) {
                z = true;
            }
        }
        this.mDrawAttachIcon = z;
        if (this.mDrawOnline) {
            this.mOnlineIcon = data.profile.online == 1 ? sOnline : sOnlineMobile;
        }
        this.mTimeText = TimeUtils.langDateShort(this.mData.lastMessage.time);
        if (getWidth() != 0) {
            layout();
        }
        setAvatarUrl(this.mData.profile.photo);
        if (data.lastMessage.out) {
            load(4, userPhoto);
        } else if (data.profile.uid > 2000000000) {
            load(4, this.mData.lastMessagePhoto);
        }
        invalidate();
    }

    private void setAvatarUrl(String url) {
        String p;
        Arrays.fill(this.primaryUrls, (Object) null);
        if (!TextUtils.isEmpty(url)) {
            if (url.startsWith(AvatarDataSource.CHAT_AVATAR_SCHEME)) {
                Uri u = Uri.parse(url);
                this.primaryImagesCount = 0;
                for (int i = 0; i < 4 && (p = u.getQueryParameter("photo" + i)) != null; i++) {
                    this.primaryUrls[i] = p;
                    this.primaryImagesCount++;
                }
            } else {
                this.primaryUrls[0] = url;
                this.primaryImagesCount = 1;
            }
        } else {
            clear();
            this.primaryImagesCount = 1;
        }
        for (int i2 = 0; i2 < this.primaryImagesCount; i2++) {
            load(i2, this.primaryUrls[i2]);
        }
    }

    private void updateBounds() {
        try {
            int l = (int) PRIMARY_IMAGE_BOUNDS.left;
            int t = (int) PRIMARY_IMAGE_BOUNDS.top;
            int w = (int) PRIMARY_IMAGE_BOUNDS.width();
            int h = (int) PRIMARY_IMAGE_BOUNDS.height();
            int w2 = (int) (PRIMARY_IMAGE_BOUNDS.width() / 2.0f);
            int h2 = (int) (PRIMARY_IMAGE_BOUNDS.height() / 2.0f);
            if (this.primaryImagesCount == 1) {
                this.draweeHolder.get(0).getTopLevelDrawable().setBounds(l, t, l + w, t + h);
            } else if (this.primaryImagesCount == 2) {
                this.draweeHolder.get(0).getTopLevelDrawable().setBounds(l, t, l + w2 + 0, t + h);
                this.draweeHolder.get(1).getTopLevelDrawable().setBounds(l + w2 + 0, t, l + w, t + h);
            } else if (this.primaryImagesCount == 3) {
                this.draweeHolder.get(0).getTopLevelDrawable().setBounds(l, t, l + w2 + 0, t + h);
                this.draweeHolder.get(1).getTopLevelDrawable().setBounds(l + w2 + 0, t, l + w, t + h2 + 0);
                this.draweeHolder.get(2).getTopLevelDrawable().setBounds(l + w2 + 0, t + h2 + 0, l + w, t + h);
            } else if (this.primaryImagesCount == 4) {
                this.draweeHolder.get(0).getTopLevelDrawable().setBounds(l, t, l + w2 + 0, t + h2 + 0);
                this.draweeHolder.get(2).getTopLevelDrawable().setBounds(l + w2 + 0, t, l + w, t + h2 + 0);
                this.draweeHolder.get(3).getTopLevelDrawable().setBounds(l + w2 + 0, t + h2 + 0, l + w, t + h);
                this.draweeHolder.get(1).getTopLevelDrawable().setBounds(l, t + h2 + 0, l + w2 + 0, t + h);
            }
        } catch (Exception e) {
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(View.MeasureSpec.getSize(widthMeasureSpec), TOTAL_HEIGHT);
    }

    @Override // android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        if (changed && this.mData != null) {
            layout();
        }
        super.onLayout(changed, left, top, right, bottom);
    }

    private void staticLayout() {
        this.mTimeLabelY = TIME_BASELINE;
        this.mTitleLabelX = PRIMARY_IMAGE_BOUNDS.right + PRIMARY_IMAGE_MARGIN;
        this.mTitleLabelY = TITLE_BASELINE;
        this.mCounterBounds.top = COUNTER_TOP;
        this.mCounterBounds.bottom = this.mCounterBounds.top + getRealTextHeight(this.mCounterTextPaint) + (COUNTER_VERTICAL_PADDING << 1);
        this.mCounterLabelY = (this.mCounterBounds.bottom - COUNTER_VERTICAL_PADDING) - this.mCounterTextPaint.descent();
        this.mTypingLabelX = this.mTitleLabelX;
        this.mTypingLabelY = V.dp(45.0f);
        this.mDotY = V.dp(54.0f);
        this.mMaxMessageHeight = (Math.round(getRealTextHeight(this.mMessageTextPaint)) << 1) + SUBTITLE_LINE_HEIGHT;
    }

    private void layout() {
        CharSequence contentDescription;
        Rect rect;
        CharSequence contentDescription2;
        Rect rect2;
        Rect rect3;
        Rect rect4;
        Rect rect5;
        int width = getWidth();
        float timeLabelWidth = this.mTimeTextPaint.measureText(this.mTimeText);
        this.mTimeLabelX = (width - timeLabelWidth) - TIME_MARGIN_RIGHT;
        int titleWidth = Math.round((this.mTimeLabelX - this.mTitleLabelX) - TIME_MARGIN_LEFT);
        if (this.mDrawMuted) {
            titleWidth -= MUTED_MARGIN + this.mMutedIcon.getIntrinsicWidth();
        }
        this.mTitleText = this.mData.profile.fullName == null ? "" : TextUtils.ellipsize(this.mData.profile.fullName, this.mTitleTextPaint, titleWidth, TextUtils.TruncateAt.END).toString();
        if (this.mDrawMuted) {
            int mutedX = Math.round(this.mTitleLabelX + this.mTitleTextPaint.measureText(this.mTitleText) + MUTED_MARGIN);
            int mutedY = (TITLE_BASELINE - TITLE_HALF_HEIGHT) - (this.mMutedIcon.getIntrinsicHeight() >> 1);
            this.mMutedIcon.setBounds(mutedX, mutedY, this.mMutedIcon.getIntrinsicWidth() + mutedX, this.mMutedIcon.getIntrinsicHeight() + mutedY);
        }
        this.mSubtitleBounds.left = Math.round(PRIMARY_IMAGE_BOUNDS.right + PRIMARY_IMAGE_MARGIN);
        this.mSubtitleBounds.right = width - CONTENT_MARGIN_RIGHT;
        if (this.mDrawCounter) {
            this.mCounterText = String.valueOf(this.mData.unreadCount);
            this.mCounterBounds.right = (width - CONTENT_MARGIN_RIGHT) - COUNTER_MARGIN_RIGHT;
            this.mCounterBounds.left = Math.round((this.mCounterBounds.right - this.mCounterTextPaint.measureText(this.mCounterText)) - (COUNTER_HORIZONTAL_PADDING << 1));
            this.mCounterLabelX = this.mCounterBounds.left + COUNTER_HORIZONTAL_PADDING;
            this.mSubtitleBounds.right = (int) (rect5.right - ((this.mCounterBounds.width() + COUNTER_MARGIN_LEFT) + COUNTER_MARGIN_RIGHT));
        }
        if (this.mDrawError) {
            this.mCounterBounds.right = (width - CONTENT_MARGIN_RIGHT) - COUNTER_MARGIN_RIGHT;
            this.mCounterBounds.left = this.mCounterBounds.right - sErrorImage.getIntrinsicWidth();
            this.mCounterLabelX = this.mCounterBounds.left;
            this.mSubtitleBounds.right = (int) (rect4.right - ((this.mCounterBounds.width() + COUNTER_MARGIN_LEFT) + COUNTER_MARGIN_RIGHT));
        }
        if (this.mDrawUnreadDot) {
            this.mDotX = (this.mSubtitleBounds.right - DOT_MARGIN_RIGHT) - (DOT_RADIUS >> 1);
            this.mSubtitleBounds.right = (int) (rect3.right - ((DOT_RADIUS + DOT_MARGIN_LEFT) + DOT_MARGIN_RIGHT));
        }
        CharSequence contentDescription3 = null;
        if (this.mDrawTyping) {
            this.mSubtitleBounds.right = (int) (rect2.right - (this.mTypingLabelX - this.mSubtitleBounds.left));
            Spannable ss = makeTypingString(this.mTypingUsers);
            CharSequence contentDescription4 = ((Object) ss) + "";
            this.mTypingLayout = BoringLayout.make(ss, this.mTypingTextPaint, this.mSubtitleBounds.width(), Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, this.mMessageSingleLineMetrics, false);
            contentDescription2 = contentDescription4;
        } else {
            CharSequence messageText = this.mData.lastMessage.isServiceMessage ? this.mData.lastMessage.getServiceMessageText(Friends.getFromAll(this.mData.lastMessage.sender), this.mData.lastMessage.extras.getString("action_user_name_acc")) : this.mData.lastMessage.displayableText;
            this.mDrawMessageText = !TextUtils.isEmpty(messageText);
            if (this.mUseShortFormat) {
                if (this.mDrawSecondaryImage) {
                    this.mSubtitleBounds.left = (int) (rect.left + SECONDARY_IMAGE_BOUNDS.width() + SECONDARY_IMAGE_MARGIN);
                }
                this.mDrawAttachLabel = !this.mDrawMessageText;
                int subtitleStart = this.mSubtitleBounds.left;
                int subtitleEnd = this.mSubtitleBounds.right;
                if (this.mDrawAttachIcon) {
                    int attachIconX = (ATTACH_ICON_LEFT_MARGIN + subtitleStart) - ATTACH_ICON_SHORT_OFFSETS;
                    int attachIconY = ((this.mSubtitleBounds.top + (this.mSubtitleBounds.height() >> 1)) - (this.mAttachIcon.getIntrinsicHeight() >> 1)) - ATTACH_ICON_SHORT_OFFSETS;
                    this.mAttachIcon.setBounds(attachIconX, attachIconY, this.mAttachIcon.getIntrinsicWidth() + attachIconX, this.mAttachIcon.getIntrinsicHeight() + attachIconY);
                    subtitleStart += ((ATTACH_ICON_MARGIN + ATTACH_ICON_LEFT_MARGIN) + this.mAttachIcon.getIntrinsicWidth()) - ATTACH_ICON_SHORT_OFFSETS;
                }
                if (this.mDrawAttachLabel) {
                    String charSequence = TextUtils.ellipsize(getAttachText(this.mData), this.mAttachTextPaint, subtitleEnd - subtitleStart, TextUtils.TruncateAt.END).toString();
                    this.mAttachText = charSequence;
                    this.mAttachLabelX = subtitleStart;
                    this.mAttachLabelY = SHORT_SUBTITLE_BASELINE;
                    contentDescription2 = charSequence;
                } else {
                    CharSequence contentDescription5 = formatMessage(messageText, this.mMessageTextPaint, subtitleEnd - subtitleStart);
                    this.mMessageLayout = BoringLayout.make(contentDescription5, this.mMessageTextPaint, subtitleEnd - subtitleStart, Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, this.mMessageSingleLineMetrics, false);
                    this.mMessageLabelX = subtitleStart;
                    this.mMessageLabelY = (SHORT_SUBTITLE_BASELINE - this.mMessageLayout.getHeight()) + this.mMessageSingleLineMetrics.descent;
                    contentDescription2 = contentDescription5;
                }
            } else {
                this.mDrawAttachLabel = !this.mData.lastMessage.attachments.isEmpty() || !this.mData.lastMessage.fwdMessages.isEmpty();
                int attachOffsetY = 0;
                if (this.mDrawMessageText) {
                    if (this.mDrawAttachLabel) {
                        CharSequence contentDescription6 = formatMessage(messageText, this.mMessageTextPaint, this.mSubtitleBounds.width());
                        this.mMessageLayout = BoringLayout.make(contentDescription6, this.mMessageTextPaint, this.mSubtitleBounds.width(), Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, this.mMessageSingleLineMetrics, false);
                        contentDescription = contentDescription6;
                    } else {
                        CharSequence contentDescription7 = formatMessage(messageText, this.mMessageTextPaint, this.mSubtitleBounds.width() << 1);
                        this.mMessageLayout = new StaticLayout(contentDescription7, 0, contentDescription7.length(), this.mMessageTextPaint, this.mSubtitleBounds.width(), Layout.Alignment.ALIGN_NORMAL, 1.0f, SUBTITLE_LINE_HEIGHT, false, TextUtils.TruncateAt.END, this.mSubtitleBounds.width() << 1);
                        contentDescription = contentDescription7;
                    }
                    attachOffsetY = 0 + this.mMessageLayout.getHeight() + ATTACH_LABEL_EXTRA;
                    this.mMessageLabelX = this.mSubtitleBounds.left;
                    this.mMessageLabelY = SUBTITLE_TOP;
                    contentDescription3 = contentDescription;
                }
                if (this.mDrawAttachIcon) {
                    attachOffsetY += ATTACH_ICON_TOP_EXTRA;
                    int attachIconX2 = this.mSubtitleBounds.left + ATTACH_ICON_LEFT_MARGIN;
                    int attachIconY2 = ((SUBTITLE_TOP + attachOffsetY) + (Math.round(getRealTextHeight(this.mAttachTextPaint)) >> 1)) - (this.mAttachIcon.getIntrinsicHeight() >> 1);
                    this.mAttachIcon.setBounds(attachIconX2, attachIconY2, this.mAttachIcon.getIntrinsicWidth() + attachIconX2, this.mAttachIcon.getIntrinsicHeight() + attachIconY2);
                    this.mSubtitleBounds.left += ATTACH_ICON_MARGIN + ATTACH_ICON_LEFT_MARGIN + this.mAttachIcon.getIntrinsicWidth();
                }
                contentDescription2 = contentDescription3;
                if (this.mDrawAttachLabel) {
                    this.mAttachLabelX = this.mSubtitleBounds.left;
                    this.mAttachLabelY = (SUBTITLE_TOP + attachOffsetY) - Math.round(this.mAttachTextPaint.ascent());
                    this.mAttachText = TextUtils.ellipsize(getAttachText(this.mData), this.mAttachTextPaint, this.mSubtitleBounds.width(), TextUtils.TruncateAt.END).toString();
                    contentDescription2 = contentDescription3;
                }
            }
        }
        if (TextUtils.isEmpty(contentDescription2)) {
            setContentDescription((this.mGroupChat ? String.format(this.mChatContentDescription, this.mData.profile.fullName) : this.mData.profile.fullName) + " (" + this.mTimeText + "): " + ((Object) contentDescription2));
        } else {
            setContentDescription((this.mGroupChat ? String.format(this.mChatContentDescription, this.mData.profile.fullName) : this.mData.profile.fullName) + " (" + this.mTimeText + ")");
        }
    }

    private Spannable makeTypingString(List<UserProfile> typingUsers) {
        return ViewUtils.getTypingText(getContext(), this.mData == null ? 0 : this.mData.profile.uid, typingUsers, null, this.uiInvalidate, -5525581);
    }

    @Override // android.view.View
    protected void onDraw(@NonNull Canvas canvas) {
        Drawable d;
        if (this.mPrimaryBitmap == null || this.mPrimaryBitmap.isRecycled() || this.mPrimaryBitmap.getWidth() != canvas.getWidth() || this.mPrimaryBitmap.getHeight() != canvas.getHeight()) {
            this.mPrimaryBitmap = Bitmap.createBitmap(canvas.getWidth(), canvas.getHeight(), Bitmap.Config.ARGB_8888);
            this.mPrimaryCanvas = new Canvas(this.mPrimaryBitmap);
            BitmapShader shader = new BitmapShader(this.mPrimaryBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            this.mPrimaryPaint.setShader(shader);
        }
        this.mPrimaryCanvas.drawRect(0.0f, 0.0f, this.mPrimaryCanvas.getWidth(), this.mPrimaryCanvas.getHeight(), this.mEraserPaint);
        updateBounds();
        for (int i = 0; i < this.primaryImagesCount; i++) {
            Drawable drawable = this.draweeHolder.get(i).getTopLevelDrawable();
            if (drawable != null) {
                drawable.draw(this.mPrimaryCanvas);
            }
        }
        canvas.drawOval(PRIMARY_IMAGE_BOUNDS, this.mPrimaryPaint);
        canvas.drawText(this.mTimeText, this.mTimeLabelX, this.mTimeLabelY, this.mTimeTextPaint);
        canvas.drawText(this.mTitleText, this.mTitleLabelX, this.mTitleLabelY, this.mTitleTextPaint);
        if (this.mDrawOnline) {
            this.mOnlineIcon.draw(canvas);
        }
        if (this.mDrawMuted) {
            this.mMutedIcon.draw(canvas);
        }
        if (this.mDrawCounter) {
            canvas.drawRoundRect(this.mCounterBounds, COUNTER_BORDER_RADIUS, COUNTER_BORDER_RADIUS, this.mDrawMuted ? this.mCounterMutedBgPaint : this.mCounterBgPaint);
            canvas.drawText(this.mCounterText, this.mCounterLabelX, this.mCounterLabelY, this.mCounterTextPaint);
        }
        if (this.mDrawTyping) {
            canvas.save();
            canvas.translate(this.mTypingLabelX, this.mTypingLabelY);
            this.mTypingLayout.draw(canvas);
            canvas.restore();
        } else {
            if (this.mDrawSecondaryImage && (d = this.draweeHolder.get(4).getTopLevelDrawable()) != null) {
                d.setBounds((int) SECONDARY_IMAGE_BOUNDS.left, (int) SECONDARY_IMAGE_BOUNDS.top, (int) SECONDARY_IMAGE_BOUNDS.right, (int) SECONDARY_IMAGE_BOUNDS.bottom);
                d.draw(canvas);
            }
            if (this.mDrawAttachIcon) {
                this.mAttachIcon.draw(canvas);
            }
            if (this.mDrawAttachLabel) {
                canvas.drawText(this.mAttachText, this.mAttachLabelX, this.mAttachLabelY, this.mAttachTextPaint);
            }
            if (this.mDrawMessageText) {
                canvas.save();
                canvas.translate(this.mMessageLabelX, this.mMessageLabelY);
                if (this.mMessageLayout.getLineCount() == 0) {
                    canvas.clipRect(0, 0, this.mMessageLayout.getWidth(), this.mMaxMessageHeight);
                } else if (this.mMessageLayout.getLineCount() == 1) {
                    canvas.clipRect(0, 0, this.mMessageLayout.getWidth(), this.mMessageLayout.getLineBottom(0));
                } else {
                    canvas.clipRect(0, 0, this.mMessageLayout.getWidth(), this.mMessageLayout.getLineBottom(1));
                }
                this.mMessageLayout.draw(canvas);
                canvas.restore();
            }
            if (this.mDrawUnreadDot) {
                canvas.drawCircle(this.mDotX, this.mDotY, DOT_RADIUS, sDotPaint);
            }
        }
        if (this.mDrawError) {
            canvas.save();
            canvas.translate(this.mCounterLabelX, this.mCounterLabelY - sErrorImage.getIntrinsicHeight());
            sErrorImage.draw(canvas);
            canvas.restore();
        }
        canvas.drawRect(DIVIDER_X, DIVIDER_Y, getWidth(), TOTAL_HEIGHT, sDividerPaint);
    }

    private String getAttachText(DialogEntry data) {
        if (!data.lastMessage.attachments.isEmpty()) {
            return Attachment.getLocalizedDescription(data.lastMessage.attachments.get(0));
        }
        return !this.mData.lastMessage.fwdMessages.isEmpty() ? getResources().getQuantityString(R.plurals.num_attach_fwd_message, this.mData.lastMessage.fwdMessages.size(), Integer.valueOf(this.mData.lastMessage.fwdMessages.size())) : "".intern();
    }

    private Drawable getAttachIcon(Attachment attachment) {
        if (attachment instanceof GiftAttachment) {
            return getResources().getDrawable(R.drawable.ic_chats_gift);
        }
        return null;
    }

    private static CharSequence formatMessage(CharSequence text, TextPaint paint, int availableWidth) {
        LinkSpan[] linkSpanArr;
        XImageSpan[] xImageSpanArr;
        CharSequence result = TextUtils.ellipsize(text, paint, availableWidth, TextUtils.TruncateAt.END);
        if (result instanceof Spannable) {
            Spannable spannable = (Spannable) result;
            int endOfEllipsize = 0;
            while (true) {
                if (endOfEllipsize == 65279 && endOfEllipsize >= spannable.length()) {
                    break;
                }
                endOfEllipsize++;
            }
            for (LinkSpan span : (LinkSpan[]) spannable.getSpans(0, endOfEllipsize, LinkSpan.class)) {
                spannable.removeSpan(span);
            }
            for (XImageSpan span2 : (XImageSpan[]) spannable.getSpans(endOfEllipsize, spannable.length() - 1, XImageSpan.class)) {
                spannable.removeSpan(span2);
            }
        }
        return result;
    }

    private BoringLayout.Metrics createFontMetrics(Paint paint) {
        BoringLayout.Metrics metrics = new BoringLayout.Metrics();
        Paint.FontMetrics fontMetrics = paint.getFontMetrics();
        metrics.ascent = Math.round(fontMetrics.ascent);
        metrics.descent = Math.round(fontMetrics.descent);
        metrics.bottom = Math.round(fontMetrics.bottom);
        metrics.leading = Math.round(fontMetrics.leading);
        metrics.top = Math.round(fontMetrics.top);
        Emoji.instance(getContext()).ensureEmojiFit(metrics);
        return metrics;
    }

    private static float getRealTextHeight(Paint paint) {
        return paint.descent() - paint.ascent();
    }

    @Override // com.vk.emoji.EmojiView
    public void invalidateEmoji() {
        invalidate();
    }
}
