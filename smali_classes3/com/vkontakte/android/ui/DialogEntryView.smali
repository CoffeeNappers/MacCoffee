.class public Lcom/vkontakte/android/ui/DialogEntryView;
.super Lcom/vk/imageloader/view/VKMultiImageView;
.source "DialogEntryView.java"

# interfaces
.implements Lcom/vk/emoji/EmojiView;


# static fields
.field private static final ATTACH_ICON_LEFT_MARGIN:I

.field private static final ATTACH_ICON_MARGIN:I

.field public static final ATTACH_ICON_SHORT_OFFSETS:I

.field private static final ATTACH_ICON_TOP_EXTRA:I

.field public static final ATTACH_LABEL_EXTRA:I

.field private static final CONTENT_MARGIN_RIGHT:I

.field private static final COUNTER_BORDER_RADIUS:I

.field private static final COUNTER_HORIZONTAL_PADDING:I

.field private static final COUNTER_MARGIN_LEFT:I

.field private static final COUNTER_MARGIN_RIGHT:I

.field private static final COUNTER_TOP:I

.field private static final COUNTER_VERTICAL_PADDING:I

.field private static final DIVIDER_X:I

.field private static final DIVIDER_Y:I

.field private static final DOT_MARGIN_LEFT:F

.field private static final DOT_MARGIN_RIGHT:F

.field private static final DOT_RADIUS:I

.field private static final MUTED_MARGIN:I

.field private static final PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

.field private static final PRIMARY_IMAGE_MARGIN:I

.field private static final SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

.field private static final SECONDARY_IMAGE_MARGIN:I

.field private static final SHORT_SUBTITLE_BASELINE:I

.field public static final SUBTITLE_LINE_HEIGHT:I

.field private static final SUBTITLE_TOP:I

.field private static final TIME_BASELINE:I

.field private static final TIME_MARGIN_LEFT:I

.field private static final TIME_MARGIN_RIGHT:I

.field private static final TITLE_BASELINE:I

.field private static final TITLE_HALF_HEIGHT:I

.field private static final TOTAL_HEIGHT:I

.field private static final TYPING_MARGIN:I

.field private static final sDividerPaint:Landroid/graphics/Paint;

.field private static final sDotPaint:Landroid/graphics/Paint;

.field private static sErrorImage:Landroid/graphics/drawable/Drawable;

.field private static sOnline:Landroid/graphics/drawable/Drawable;

.field private static sOnlineMobile:Landroid/graphics/drawable/Drawable;


# instance fields
.field private mAttachIcon:Landroid/graphics/drawable/Drawable;

.field private mAttachLabelX:F

.field private mAttachLabelY:F

.field private mAttachText:Ljava/lang/String;

.field private mAttachTextPaint:Landroid/text/TextPaint;

.field private mChatContentDescription:Ljava/lang/String;

.field private mCounterBgPaint:Landroid/graphics/Paint;

.field private mCounterBounds:Landroid/graphics/RectF;

.field private mCounterLabelX:F

.field private mCounterLabelY:F

.field private mCounterMutedBgPaint:Landroid/graphics/Paint;

.field private mCounterText:Ljava/lang/String;

.field private mCounterTextPaint:Landroid/text/TextPaint;

.field private mData:Lcom/vkontakte/android/DialogEntry;

.field private mDotX:F

.field private mDotY:F

.field private mDrawAttachIcon:Z

.field private mDrawAttachLabel:Z

.field private mDrawCounter:Z

.field private mDrawError:Z

.field private mDrawMessageText:Z

.field private mDrawMuted:Z

.field private mDrawOnline:Z

.field private mDrawSecondaryImage:Z

.field private mDrawTyping:Z

.field private mDrawUnreadDot:Z

.field private final mEraserPaint:Landroid/graphics/Paint;

.field private mGroupChat:Z

.field private mMaxMessageHeight:I

.field private mMessageLabelX:F

.field private mMessageLabelY:F

.field private mMessageLayout:Landroid/text/Layout;

.field private mMessageSingleLineMetrics:Landroid/text/BoringLayout$Metrics;

.field private mMessageTextPaint:Landroid/text/TextPaint;

.field private mMutedIcon:Landroid/graphics/drawable/Drawable;

.field private mOnlineIcon:Landroid/graphics/drawable/Drawable;

.field private mPlaceholderUser:Landroid/graphics/Bitmap;

.field private mPrimaryBitmap:Landroid/graphics/Bitmap;

.field private mPrimaryCanvas:Landroid/graphics/Canvas;

.field private final mPrimaryPaint:Landroid/graphics/Paint;

.field private mSubtitleBounds:Landroid/graphics/Rect;

.field private mTimeLabelX:F

.field private mTimeLabelY:F

.field private mTimeText:Ljava/lang/String;

.field private mTimeTextPaint:Landroid/text/TextPaint;

.field private mTitleLabelX:F

.field private mTitleLabelY:F

.field private mTitleText:Ljava/lang/String;

.field private mTitleTextPaint:Landroid/text/TextPaint;

.field private mTypingLabelX:F

.field private mTypingLabelY:F

.field private mTypingLayout:Landroid/text/Layout;

.field private mTypingTextPaint:Landroid/text/TextPaint;

.field private mTypingUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mUseShortFormat:Z

.field private primaryImagesCount:I

.field private primaryUrls:[Ljava/lang/String;

.field private uiInvalidate:Lcom/vkontakte/android/functions/VoidF0;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/high16 v9, 0x41480000    # 12.5f

    const/high16 v8, 0x41200000    # 10.0f

    const/high16 v7, 0x40800000    # 4.0f

    const/high16 v6, 0x40200000    # 2.5f

    const/high16 v5, 0x41400000    # 12.0f

    .line 50
    new-instance v0, Landroid/graphics/RectF;

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x42980000    # 76.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x42940000    # 74.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    sput-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    .line 55
    new-instance v0, Landroid/graphics/RectF;

    const/high16 v1, 0x42b00000    # 88.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x42180000    # 38.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x42f00000    # 120.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x428c0000    # 70.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    sput-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    .line 60
    const/high16 v0, 0x42a80000    # 84.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->TOTAL_HEIGHT:I

    .line 62
    const/high16 v0, 0x42b00000    # 88.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->DIVIDER_X:I

    .line 64
    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->TOTAL_HEIGHT:I

    const/4 v1, 0x1

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    sub-int/2addr v0, v1

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->DIVIDER_Y:I

    .line 66
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->sDividerPaint:Landroid/graphics/Paint;

    .line 67
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->sDotPaint:Landroid/graphics/Paint;

    .line 72
    const/high16 v0, 0x41d80000    # 27.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->TITLE_BASELINE:I

    .line 77
    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    shr-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->TITLE_HALF_HEIGHT:I

    .line 82
    const/high16 v0, 0x41d80000    # 27.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->TIME_BASELINE:I

    .line 87
    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_MARGIN:I

    .line 92
    const/high16 v0, 0x40a00000    # 5.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->TIME_MARGIN_LEFT:I

    .line 97
    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->TIME_MARGIN_RIGHT:I

    .line 102
    const/high16 v0, 0x40c00000    # 6.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->MUTED_MARGIN:I

    .line 107
    const/high16 v0, 0x41580000    # 13.5f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->CONTENT_MARGIN_RIGHT:I

    .line 112
    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_BORDER_RADIUS:I

    .line 117
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_HORIZONTAL_PADDING:I

    .line 122
    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_VERTICAL_PADDING:I

    .line 127
    const/high16 v0, 0x40e00000    # 7.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_MARGIN_LEFT:I

    .line 132
    invoke-static {v6}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_MARGIN_RIGHT:I

    .line 137
    const/high16 v0, 0x42280000    # 42.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_TOP:I

    .line 142
    const/high16 v0, 0x41700000    # 15.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->TYPING_MARGIN:I

    .line 147
    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_MARGIN:I

    .line 152
    const v0, 0x426aa3d7    # 58.66f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->SHORT_SUBTITLE_BASELINE:I

    .line 157
    const/high16 v0, 0x41100000    # 9.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_MARGIN:I

    .line 162
    const/high16 v0, 0x42080000    # 34.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->SUBTITLE_TOP:I

    .line 167
    const/high16 v0, -0x40000000    # -2.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_TOP_EXTRA:I

    .line 172
    const v0, 0x40151eb8    # 2.33f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->SUBTITLE_LINE_HEIGHT:I

    .line 177
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_SHORT_OFFSETS:I

    .line 181
    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_SHORT_OFFSETS:I

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_LEFT_MARGIN:I

    .line 186
    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_LABEL_EXTRA:I

    .line 191
    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_RADIUS:I

    .line 196
    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v0, v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_MARGIN_LEFT:F

    .line 201
    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v0, v0

    sput v0, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_MARGIN_RIGHT:F

    .line 204
    sget-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->sDividerPaint:Landroid/graphics/Paint;

    const v1, -0x262627

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 205
    sget-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->sDotPaint:Landroid/graphics/Paint;

    const v1, -0x855f34

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 206
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 281
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;)V

    .line 210
    iput v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    .line 211
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryUrls:[Ljava/lang/String;

    .line 215
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mEraserPaint:Landroid/graphics/Paint;

    .line 216
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryPaint:Landroid/graphics/Paint;

    .line 243
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v2, v2, v2, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    .line 244
    new-instance v0, Landroid/graphics/Rect;

    sget-object v1, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    sget-object v2, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {v0, v3, v1, v3, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    .line 274
    invoke-static {p0}, Lcom/vkontakte/android/ui/DialogEntryView$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/DialogEntryView;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->uiInvalidate:Lcom/vkontakte/android/functions/VoidF0;

    .line 282
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/DialogEntryView;->init(Landroid/content/Context;)V

    .line 283
    return-void
.end method

.method private createFontMetrics(Landroid/graphics/Paint;)Landroid/text/BoringLayout$Metrics;
    .locals 3
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 750
    new-instance v1, Landroid/text/BoringLayout$Metrics;

    invoke-direct {v1}, Landroid/text/BoringLayout$Metrics;-><init>()V

    .line 751
    .local v1, "metrics":Landroid/text/BoringLayout$Metrics;
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v0

    .line 752
    .local v0, "fontMetrics":Landroid/graphics/Paint$FontMetrics;
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->ascent:I

    .line 753
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->descent:I

    .line 754
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->bottom:I

    .line 755
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->leading:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->leading:I

    .line 756
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->top:I

    .line 758
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/emoji/Emoji;->instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/vk/emoji/Emoji;->ensureEmojiFit(Landroid/graphics/Paint$FontMetricsInt;)V

    .line 760
    return-object v1
.end method

.method private static formatMessage(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)Ljava/lang/CharSequence;
    .locals 8
    .param p0, "text"    # Ljava/lang/CharSequence;
    .param p1, "paint"    # Landroid/text/TextPaint;
    .param p2, "availableWidth"    # I

    .prologue
    const/4 v5, 0x0

    .line 727
    int-to-float v4, p2

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {p0, p1, v4, v6}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 728
    .local v1, "result":Ljava/lang/CharSequence;
    instance-of v4, v1, Landroid/text/Spannable;

    if-eqz v4, :cond_3

    move-object v3, v1

    .line 729
    check-cast v3, Landroid/text/Spannable;

    .line 733
    .local v3, "spannable":Landroid/text/Spannable;
    const/4 v0, 0x0

    .local v0, "endOfEllipsize":I
    :goto_0
    const v4, 0xfeff

    if-ne v0, v4, :cond_0

    invoke-interface {v3}, Landroid/text/Spannable;->length()I

    move-result v4

    if-ge v0, v4, :cond_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 737
    :cond_1
    const-class v4, Lcom/vkontakte/android/LinkSpan;

    invoke-interface {v3, v5, v0, v4}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/vkontakte/android/LinkSpan;

    array-length v7, v4

    move v6, v5

    :goto_1
    if-ge v6, v7, :cond_2

    aget-object v2, v4, v6

    .line 738
    .local v2, "span":Lcom/vkontakte/android/LinkSpan;
    invoke-interface {v3, v2}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 737
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 741
    .end local v2    # "span":Lcom/vkontakte/android/LinkSpan;
    :cond_2
    invoke-interface {v3}, Landroid/text/Spannable;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    const-class v6, Lcom/vkontakte/android/ui/XImageSpan;

    invoke-interface {v3, v0, v4, v6}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/vkontakte/android/ui/XImageSpan;

    array-length v6, v4

    :goto_2
    if-ge v5, v6, :cond_3

    aget-object v2, v4, v5

    .line 742
    .local v2, "span":Lcom/vkontakte/android/ui/XImageSpan;
    invoke-interface {v3, v2}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 741
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 746
    .end local v0    # "endOfEllipsize":I
    .end local v2    # "span":Lcom/vkontakte/android/ui/XImageSpan;
    .end local v3    # "spannable":Landroid/text/Spannable;
    :cond_3
    return-object v1
.end method

.method private getAttachIcon(Lcom/vkontakte/android/attachments/Attachment;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1, "attachment"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 720
    instance-of v0, p1, Lcom/vkontakte/android/attachments/GiftAttachment;

    if-eqz v0, :cond_0

    .line 721
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020182

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 723
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getAttachText(Lcom/vkontakte/android/DialogEntry;)Ljava/lang/String;
    .locals 6
    .param p1, "data"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    const/4 v5, 0x0

    .line 710
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 711
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Lcom/vkontakte/android/attachments/Attachment;)Ljava/lang/String;

    move-result-object v0

    .line 716
    :goto_0
    return-object v0

    .line 713
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v0, v0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 714
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d003d

    iget-object v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v2, v2, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v2, v2, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v4, v4, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 716
    :cond_1
    const-string/jumbo v0, ""

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static getRealTextHeight(Landroid/graphics/Paint;)F
    .locals 2
    .param p0, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 764
    invoke-virtual {p0}, Landroid/graphics/Paint;->descent()F

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Paint;->ascent()F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method private init(Landroid/content/Context;)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    const v8, -0x878686

    const/high16 v7, 0x41700000    # 15.0f

    const/4 v6, 0x1

    .line 286
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v3, 0x5

    if-ge v1, v3, :cond_0

    .line 287
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->addImage()V

    .line 288
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v3, v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v3

    check-cast v3, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    const v4, 0x7f0203d3

    invoke-virtual {v3, v4}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setPlaceholderImage(I)V

    .line 286
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 290
    :cond_0
    sget-object v3, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/DialogEntryView;->setScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 291
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v3

    check-cast v3, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->asCircle()Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setRoundingParams(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 293
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mEraserPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 294
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mEraserPaint:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/PorterDuffXfermode;

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v4, v5}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 296
    new-instance v3, Landroid/text/TextPaint;

    invoke-direct {v3, v6}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleTextPaint:Landroid/text/TextPaint;

    .line 297
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleTextPaint:Landroid/text/TextPaint;

    const/high16 v4, 0x41880000    # 17.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 298
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleTextPaint:Landroid/text/TextPaint;

    const v4, -0xd1cfcd

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setColor(I)V

    .line 300
    new-instance v3, Landroid/text/TextPaint;

    invoke-direct {v3, v6}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingTextPaint:Landroid/text/TextPaint;

    .line 301
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingTextPaint:Landroid/text/TextPaint;

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 302
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingTextPaint:Landroid/text/TextPaint;

    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 303
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingTextPaint:Landroid/text/TextPaint;

    const v4, -0x777778

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setColor(I)V

    .line 305
    new-instance v3, Landroid/text/TextPaint;

    invoke-direct {v3, v6}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    .line 306
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 307
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 308
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3, v8}, Landroid/text/TextPaint;->setColor(I)V

    .line 310
    new-instance v3, Landroid/text/TextPaint;

    invoke-direct {v3, v6}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    .line 311
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 312
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 313
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    const v4, -0xa38767

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setColor(I)V

    .line 315
    new-instance v3, Landroid/text/TextPaint;

    invoke-direct {v3, v6}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeTextPaint:Landroid/text/TextPaint;

    .line 316
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3, v8}, Landroid/text/TextPaint;->setColor(I)V

    .line 317
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeTextPaint:Landroid/text/TextPaint;

    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 319
    new-instance v3, Landroid/text/TextPaint;

    invoke-direct {v3, v6}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterTextPaint:Landroid/text/TextPaint;

    .line 320
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3, v9}, Landroid/text/TextPaint;->setColor(I)V

    .line 321
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterTextPaint:Landroid/text/TextPaint;

    const/high16 v4, 0x41600000    # 14.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 322
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterTextPaint:Landroid/text/TextPaint;

    sget-object v4, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v4, v4, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 324
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v6}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBgPaint:Landroid/graphics/Paint;

    .line 325
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBgPaint:Landroid/graphics/Paint;

    const v4, -0x9d6c34

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 327
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v6}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterMutedBgPaint:Landroid/graphics/Paint;

    .line 328
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterMutedBgPaint:Landroid/graphics/Paint;

    const v4, -0x433c34

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 330
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0203d3

    invoke-static {v3, v4}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPlaceholderUser:Landroid/graphics/Bitmap;

    .line 332
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0201fa

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMutedIcon:Landroid/graphics/drawable/Drawable;

    .line 334
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    invoke-direct {p0, v3}, Lcom/vkontakte/android/ui/DialogEntryView;->createFontMetrics(Landroid/graphics/Paint;)Landroid/text/BoringLayout$Metrics;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageSingleLineMetrics:Landroid/text/BoringLayout$Metrics;

    .line 336
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080460

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mChatContentDescription:Ljava/lang/String;

    .line 338
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sErrorImage:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_1

    .line 339
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020208

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sput-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sErrorImage:Landroid/graphics/drawable/Drawable;

    .line 340
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sErrorImage:Landroid/graphics/drawable/Drawable;

    sget-object v4, Lcom/vkontakte/android/ui/DialogEntryView;->sErrorImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    sget-object v5, Lcom/vkontakte/android/ui/DialogEntryView;->sErrorImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-virtual {v3, v10, v10, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 342
    :cond_1
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sOnline:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_2

    .line 343
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02022a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sput-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sOnline:Landroid/graphics/drawable/Drawable;

    .line 344
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    float-to-int v2, v3

    .line 345
    .local v2, "right":I
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    float-to-int v0, v3

    .line 346
    .local v0, "bottom":I
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sOnline:Landroid/graphics/drawable/Drawable;

    sget-object v4, Lcom/vkontakte/android/ui/DialogEntryView;->sOnline:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    sub-int v4, v2, v4

    sget-object v5, Lcom/vkontakte/android/ui/DialogEntryView;->sOnline:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    sub-int v5, v0, v5

    invoke-virtual {v3, v4, v5, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 348
    .end local v0    # "bottom":I
    .end local v2    # "right":I
    :cond_2
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sOnlineMobile:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_3

    .line 349
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02022d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sput-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sOnlineMobile:Landroid/graphics/drawable/Drawable;

    .line 350
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    float-to-int v2, v3

    .line 351
    .restart local v2    # "right":I
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    float-to-int v0, v3

    .line 352
    .restart local v0    # "bottom":I
    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sOnlineMobile:Landroid/graphics/drawable/Drawable;

    sget-object v4, Lcom/vkontakte/android/ui/DialogEntryView;->sOnlineMobile:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    sub-int v4, v2, v4

    sget-object v5, Lcom/vkontakte/android/ui/DialogEntryView;->sOnlineMobile:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    sub-int v5, v0, v5

    invoke-virtual {v3, v4, v5, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 355
    .end local v0    # "bottom":I
    .end local v2    # "right":I
    :cond_3
    invoke-direct {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->staticLayout()V

    .line 356
    return-void
.end method

.method private layout()V
    .locals 28

    .prologue
    .line 488
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getWidth()I

    move-result v27

    .line 491
    .local v27, "width":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeText:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v25

    .line 492
    .local v25, "timeLabelWidth":F
    move/from16 v0, v27

    int-to-float v4, v0

    sub-float v4, v4, v25

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->TIME_MARGIN_RIGHT:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeLabelX:F

    .line 495
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeLabelX:F

    move-object/from16 v0, p0

    iget v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleLabelX:F

    sub-float/2addr v4, v5

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->TIME_MARGIN_LEFT:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v26

    .line 497
    .local v26, "titleWidth":I
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMuted:Z

    if-eqz v4, :cond_0

    .line 498
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->MUTED_MARGIN:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMutedIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    add-int/2addr v4, v5

    sub-int v26, v26, v4

    .line 501
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    if-nez v4, :cond_6

    const-string/jumbo v4, ""

    .line 502
    :goto_0
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleText:Ljava/lang/String;

    .line 504
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMuted:Z

    if-eqz v4, :cond_1

    .line 505
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleLabelX:F

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleText:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v5

    add-float/2addr v4, v5

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->MUTED_MARGIN:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v21

    .line 506
    .local v21, "mutedX":I
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->TITLE_BASELINE:I

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->TITLE_HALF_HEIGHT:I

    sub-int/2addr v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMutedIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    shr-int/lit8 v5, v5, 0x1

    sub-int v22, v4, v5

    .line 507
    .local v22, "mutedY":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMutedIcon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMutedIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    add-int v5, v5, v21

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMutedIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    add-int v6, v6, v22

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v4, v0, v1, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 510
    .end local v21    # "mutedX":I
    .end local v22    # "mutedY":I
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    sget-object v5, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sget v6, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_MARGIN:I

    int-to-float v6, v6

    add-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    iput v5, v4, Landroid/graphics/Rect;->left:I

    .line 511
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->CONTENT_MARGIN_RIGHT:I

    sub-int v5, v27, v5

    iput v5, v4, Landroid/graphics/Rect;->right:I

    .line 514
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawCounter:Z

    if-eqz v4, :cond_2

    .line 515
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget v4, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterText:Ljava/lang/String;

    .line 516
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->CONTENT_MARGIN_RIGHT:I

    sub-int v5, v27, v5

    sget v6, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_MARGIN_RIGHT:I

    sub-int/2addr v5, v6

    int-to-float v5, v5

    iput v5, v4, Landroid/graphics/RectF;->right:F

    .line 517
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterText:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v6

    sub-float/2addr v5, v6

    sget v6, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_HORIZONTAL_PADDING:I

    shl-int/lit8 v6, v6, 0x1

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v5, v5

    iput v5, v4, Landroid/graphics/RectF;->left:F

    .line 519
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_HORIZONTAL_PADDING:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterLabelX:F

    .line 521
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    sget v7, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_MARGIN_LEFT:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    sget v7, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_MARGIN_RIGHT:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->right:I

    .line 524
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawError:Z

    if-eqz v4, :cond_3

    .line 525
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->CONTENT_MARGIN_RIGHT:I

    sub-int v5, v27, v5

    sget v6, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_MARGIN_RIGHT:I

    sub-int/2addr v5, v6

    int-to-float v5, v5

    iput v5, v4, Landroid/graphics/RectF;->right:F

    .line 526
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sget-object v6, Lcom/vkontakte/android/ui/DialogEntryView;->sErrorImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v5, v6

    iput v5, v4, Landroid/graphics/RectF;->left:F

    .line 528
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterLabelX:F

    .line 530
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    sget v7, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_MARGIN_LEFT:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    sget v7, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_MARGIN_RIGHT:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->right:I

    .line 533
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawUnreadDot:Z

    if-eqz v4, :cond_4

    .line 534
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_MARGIN_RIGHT:F

    sub-float/2addr v4, v5

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_RADIUS:I

    shr-int/lit8 v5, v5, 0x1

    int-to-float v5, v5

    sub-float/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDotX:F

    .line 535
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    sget v6, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_RADIUS:I

    int-to-float v6, v6

    sget v7, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_MARGIN_LEFT:F

    add-float/2addr v6, v7

    sget v7, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_MARGIN_RIGHT:F

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->right:I

    .line 538
    :cond_4
    const/4 v3, 0x0

    .line 541
    .local v3, "contentDescription":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawTyping:Z

    if-eqz v4, :cond_7

    .line 542
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    move-object/from16 v0, p0

    iget v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingLabelX:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    int-to-float v7, v7

    sub-float/2addr v6, v7

    sub-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->right:I

    .line 544
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingUsers:Ljava/util/List;

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/ui/DialogEntryView;->makeTypingString(Ljava/util/List;)Landroid/text/Spannable;

    move-result-object v2

    .line 546
    .local v2, "ss":Landroid/text/Spannable;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 547
    .end local v3    # "contentDescription":Ljava/lang/CharSequence;
    .local v19, "contentDescription":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageSingleLineMetrics:Landroid/text/BoringLayout$Metrics;

    const/4 v9, 0x0

    invoke-static/range {v2 .. v9}, Landroid/text/BoringLayout;->make(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;Z)Landroid/text/BoringLayout;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingLayout:Landroid/text/Layout;

    move-object/from16 v3, v19

    .line 613
    .end local v2    # "ss":Landroid/text/Spannable;
    .end local v19    # "contentDescription":Ljava/lang/CharSequence;
    .restart local v3    # "contentDescription":Ljava/lang/CharSequence;
    :cond_5
    :goto_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 614
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mGroupChat:Z

    if-eqz v4, :cond_14

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mChatContentDescription:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v8, v8, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :goto_2
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeText:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/DialogEntryView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 618
    :goto_3
    return-void

    .line 501
    .end local v3    # "contentDescription":Ljava/lang/CharSequence;
    :cond_6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleTextPaint:Landroid/text/TextPaint;

    move/from16 v0, v26

    int-to-float v6, v0

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 502
    invoke-static {v4, v5, v6, v7}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 549
    .restart local v3    # "contentDescription":Ljava/lang/CharSequence;
    :cond_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v4, v4, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-eqz v4, :cond_a

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v5, v5, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v5, v5, Lcom/vkontakte/android/Message;->sender:I

    .line 550
    invoke-static {v5}, Lcom/vkontakte/android/data/Friends;->getFromAll(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v6, v6, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v6, v6, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v7, "action_user_name_acc"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/Message;->getServiceMessageText(Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 552
    .local v20, "messageText":Ljava/lang/CharSequence;
    :goto_4
    invoke-static/range {v20 .. v20}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_b

    const/4 v4, 0x1

    :goto_5
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMessageText:Z

    .line 554
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mUseShortFormat:Z

    if-eqz v4, :cond_e

    .line 555
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawSecondaryImage:Z

    if-eqz v4, :cond_8

    .line 556
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    sget-object v6, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    sget v7, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_MARGIN:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    add-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v4, Landroid/graphics/Rect;->left:I

    .line 559
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMessageText:Z

    if-nez v4, :cond_c

    const/4 v4, 0x1

    :goto_6
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachLabel:Z

    .line 561
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v0, v4, Landroid/graphics/Rect;->left:I

    move/from16 v24, v0

    .line 562
    .local v24, "subtitleStart":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v0, v4, Landroid/graphics/Rect;->right:I

    move/from16 v23, v0

    .line 564
    .local v23, "subtitleEnd":I
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachIcon:Z

    if-eqz v4, :cond_9

    .line 565
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_LEFT_MARGIN:I

    add-int v4, v4, v24

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_SHORT_OFFSETS:I

    sub-int v16, v4, v5

    .line 566
    .local v16, "attachIconX":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    shr-int/lit8 v5, v5, 0x1

    add-int/2addr v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    shr-int/lit8 v5, v5, 0x1

    sub-int/2addr v4, v5

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_SHORT_OFFSETS:I

    sub-int v17, v4, v5

    .line 567
    .local v17, "attachIconY":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    add-int v5, v5, v16

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    add-int v6, v6, v17

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v4, v0, v1, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 568
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_MARGIN:I

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_LEFT_MARGIN:I

    add-int/2addr v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    add-int/2addr v4, v5

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_SHORT_OFFSETS:I

    sub-int/2addr v4, v5

    add-int v24, v24, v4

    .line 571
    .end local v16    # "attachIconX":I
    .end local v17    # "attachIconY":I
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachLabel:Z

    if-eqz v4, :cond_d

    .line 572
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/ui/DialogEntryView;->getAttachText(Lcom/vkontakte/android/DialogEntry;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    sub-int v6, v23, v24

    int-to-float v6, v6

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v4, v5, v6, v7}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .end local v3    # "contentDescription":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachText:Ljava/lang/String;

    .line 573
    .restart local v3    # "contentDescription":Ljava/lang/CharSequence;
    move/from16 v0, v24

    int-to-float v4, v0

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachLabelX:F

    .line 574
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->SHORT_SUBTITLE_BASELINE:I

    int-to-float v4, v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachLabelY:F

    goto/16 :goto_1

    .line 550
    .end local v20    # "messageText":Ljava/lang/CharSequence;
    .end local v23    # "subtitleEnd":I
    .end local v24    # "subtitleStart":I
    :cond_a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v0, v4, Lcom/vkontakte/android/Message;->displayableText:Ljava/lang/CharSequence;

    move-object/from16 v20, v0

    goto/16 :goto_4

    .line 552
    .restart local v20    # "messageText":Ljava/lang/CharSequence;
    :cond_b
    const/4 v4, 0x0

    goto/16 :goto_5

    .line 559
    :cond_c
    const/4 v4, 0x0

    goto/16 :goto_6

    .line 576
    .restart local v23    # "subtitleEnd":I
    .restart local v24    # "subtitleStart":I
    :cond_d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    sub-int v5, v23, v24

    move-object/from16 v0, v20

    invoke-static {v0, v4, v5}, Lcom/vkontakte/android/ui/DialogEntryView;->formatMessage(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    sub-int v5, v23, v24

    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageSingleLineMetrics:Landroid/text/BoringLayout$Metrics;

    const/4 v10, 0x0

    invoke-static/range {v3 .. v10}, Landroid/text/BoringLayout;->make(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;Z)Landroid/text/BoringLayout;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    .line 577
    move/from16 v0, v24

    int-to-float v4, v0

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLabelX:F

    .line 578
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->SHORT_SUBTITLE_BASELINE:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v5}, Landroid/text/Layout;->getHeight()I

    move-result v5

    sub-int/2addr v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageSingleLineMetrics:Landroid/text/BoringLayout$Metrics;

    iget v5, v5, Landroid/text/BoringLayout$Metrics;->descent:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLabelY:F

    goto/16 :goto_1

    .line 581
    .end local v23    # "subtitleEnd":I
    .end local v24    # "subtitleStart":I
    :cond_e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v4, v4, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v4, v4, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_12

    :cond_f
    const/4 v4, 0x1

    :goto_7
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachLabel:Z

    .line 583
    const/16 v18, 0x0

    .line 585
    .local v18, "attachOffsetY":I
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMessageText:Z

    if-eqz v4, :cond_10

    .line 586
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachLabel:Z

    if-eqz v4, :cond_13

    .line 587
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    move-object/from16 v0, v20

    invoke-static {v0, v4, v5}, Lcom/vkontakte/android/ui/DialogEntryView;->formatMessage(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageSingleLineMetrics:Landroid/text/BoringLayout$Metrics;

    const/4 v10, 0x0

    invoke-static/range {v3 .. v10}, Landroid/text/BoringLayout;->make(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;Z)Landroid/text/BoringLayout;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    .line 592
    :goto_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v4}, Landroid/text/Layout;->getHeight()I

    move-result v4

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_LABEL_EXTRA:I

    add-int/2addr v4, v5

    add-int v18, v18, v4

    .line 593
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLabelX:F

    .line 594
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->SUBTITLE_TOP:I

    int-to-float v4, v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLabelY:F

    .line 597
    :cond_10
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachIcon:Z

    if-eqz v4, :cond_11

    .line 598
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_TOP_EXTRA:I

    add-int v18, v18, v4

    .line 599
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_LEFT_MARGIN:I

    add-int v16, v4, v5

    .line 600
    .restart local v16    # "attachIconX":I
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->SUBTITLE_TOP:I

    add-int v4, v4, v18

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    invoke-static {v5}, Lcom/vkontakte/android/ui/DialogEntryView;->getRealTextHeight(Landroid/graphics/Paint;)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    shr-int/lit8 v5, v5, 0x1

    add-int/2addr v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    shr-int/lit8 v5, v5, 0x1

    sub-int v17, v4, v5

    .line 601
    .restart local v17    # "attachIconY":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    add-int v5, v5, v16

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    add-int v6, v6, v17

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v4, v0, v1, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 602
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->left:I

    sget v6, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_MARGIN:I

    sget v7, Lcom/vkontakte/android/ui/DialogEntryView;->ATTACH_ICON_LEFT_MARGIN:I

    add-int/2addr v6, v7

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    add-int/2addr v6, v7

    add-int/2addr v5, v6

    iput v5, v4, Landroid/graphics/Rect;->left:I

    .line 605
    .end local v16    # "attachIconX":I
    .end local v17    # "attachIconY":I
    :cond_11
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachLabel:Z

    if-eqz v4, :cond_5

    .line 606
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachLabelX:F

    .line 607
    sget v4, Lcom/vkontakte/android/ui/DialogEntryView;->SUBTITLE_TOP:I

    add-int v4, v4, v18

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v5}, Landroid/text/TextPaint;->ascent()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachLabelY:F

    .line 608
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/ui/DialogEntryView;->getAttachText(Lcom/vkontakte/android/DialogEntry;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v4, v5, v6, v7}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachText:Ljava/lang/String;

    goto/16 :goto_1

    .line 581
    .end local v18    # "attachOffsetY":I
    :cond_12
    const/4 v4, 0x0

    goto/16 :goto_7

    .line 589
    .restart local v18    # "attachOffsetY":I
    :cond_13
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    shl-int/lit8 v5, v5, 0x1

    move-object/from16 v0, v20

    invoke-static {v0, v4, v5}, Lcom/vkontakte/android/ui/DialogEntryView;->formatMessage(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 590
    new-instance v4, Landroid/text/StaticLayout;

    const/4 v6, 0x0

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v9

    sget-object v10, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v11, 0x3f800000    # 1.0f

    sget v5, Lcom/vkontakte/android/ui/DialogEntryView;->SUBTITLE_LINE_HEIGHT:I

    int-to-float v12, v5

    const/4 v13, 0x0

    sget-object v14, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mSubtitleBounds:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    shl-int/lit8 v15, v5, 0x1

    move-object v5, v3

    invoke-direct/range {v4 .. v15}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZLandroid/text/TextUtils$TruncateAt;I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    goto/16 :goto_8

    .line 614
    .end local v18    # "attachOffsetY":I
    .end local v20    # "messageText":Ljava/lang/CharSequence;
    :cond_14
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    goto/16 :goto_2

    .line 616
    :cond_15
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mGroupChat:Z

    if-eqz v4, :cond_16

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mChatContentDescription:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v8, v8, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :goto_9
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeText:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/DialogEntryView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    :cond_16
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v4, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    goto :goto_9
.end method

.method private makeTypingString(Ljava/util/List;)Landroid/text/Spannable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Landroid/text/Spannable;"
        }
    .end annotation

    .prologue
    .line 621
    .local p1, "typingUsers":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/vkontakte/android/ui/DialogEntryView;->uiInvalidate:Lcom/vkontakte/android/functions/VoidF0;

    const v5, -0x54504d

    move-object v2, p1

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/ViewUtils;->getTypingText(Landroid/content/Context;ILjava/util/List;Landroid/util/SparseArray;Lcom/vkontakte/android/functions/VoidF0;I)Landroid/text/SpannableString;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v1, v1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    goto :goto_0
.end method

.method private setAvatarUrl(Ljava/lang/String;)V
    .locals 7
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 394
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryUrls:[Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 395
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 396
    const-string/jumbo v3, "vkchatphoto"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 397
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 398
    .local v2, "u":Landroid/net/Uri;
    iput v5, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    .line 399
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v3, 0x4

    if-ge v0, v3, :cond_0

    .line 400
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "photo"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 401
    .local v1, "p":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 416
    .end local v0    # "i":I
    .end local v1    # "p":Ljava/lang/String;
    .end local v2    # "u":Landroid/net/Uri;
    :cond_0
    :goto_1
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    iget v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    if-ge v0, v3, :cond_4

    .line 417
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryUrls:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {p0, v0, v3}, Lcom/vkontakte/android/ui/DialogEntryView;->load(ILjava/lang/String;)V

    .line 416
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 404
    .restart local v1    # "p":Ljava/lang/String;
    .restart local v2    # "u":Landroid/net/Uri;
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryUrls:[Ljava/lang/String;

    aput-object v1, v3, v0

    .line 405
    iget v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    .line 399
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 408
    .end local v0    # "i":I
    .end local v1    # "p":Ljava/lang/String;
    .end local v2    # "u":Landroid/net/Uri;
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryUrls:[Ljava/lang/String;

    aput-object p1, v3, v5

    .line 409
    iput v6, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    goto :goto_1

    .line 412
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->clear()V

    .line 413
    iput v6, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    goto :goto_1

    .line 419
    .restart local v0    # "i":I
    :cond_4
    return-void
.end method

.method private staticLayout()V
    .locals 3

    .prologue
    .line 471
    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->TIME_BASELINE:I

    int-to-float v0, v0

    iput v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeLabelY:F

    .line 473
    sget-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    sget v1, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_MARGIN:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleLabelX:F

    .line 474
    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->TITLE_BASELINE:I

    int-to-float v0, v0

    iput v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleLabelY:F

    .line 476
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    sget v1, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_TOP:I

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 477
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterTextPaint:Landroid/text/TextPaint;

    invoke-static {v2}, Lcom/vkontakte/android/ui/DialogEntryView;->getRealTextHeight(Landroid/graphics/Paint;)F

    move-result v2

    add-float/2addr v1, v2

    sget v2, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_VERTICAL_PADDING:I

    shl-int/lit8 v2, v2, 0x1

    int-to-float v2, v2

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 479
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    sget v1, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_VERTICAL_PADDING:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->descent()F

    move-result v1

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterLabelY:F

    .line 481
    iget v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleLabelX:F

    iput v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingLabelX:F

    .line 482
    const/high16 v0, 0x42340000    # 45.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingLabelY:F

    .line 483
    const/high16 v0, 0x42580000    # 54.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDotY:F

    .line 484
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageTextPaint:Landroid/text/TextPaint;

    invoke-static {v0}, Lcom/vkontakte/android/ui/DialogEntryView;->getRealTextHeight(Landroid/graphics/Paint;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    sget v1, Lcom/vkontakte/android/ui/DialogEntryView;->SUBTITLE_LINE_HEIGHT:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMaxMessageHeight:I

    .line 485
    return-void
.end method

.method private updateBounds()V
    .locals 13

    .prologue
    const/4 v12, 0x3

    const/high16 v11, 0x40000000    # 2.0f

    const/4 v10, 0x2

    const/4 v9, 0x1

    .line 423
    :try_start_0
    sget-object v8, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->left:F

    float-to-int v4, v8

    .line 424
    .local v4, "l":I
    sget-object v8, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->top:F

    float-to-int v5, v8

    .line 425
    .local v5, "t":I
    sget-object v8, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    float-to-int v6, v8

    .line 426
    .local v6, "w":I
    sget-object v8, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    move-result v8

    float-to-int v2, v8

    .line 427
    .local v2, "h":I
    sget-object v8, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    div-float/2addr v8, v11

    float-to-int v7, v8

    .line 428
    .local v7, "w2":I
    sget-object v8, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    move-result v8

    div-float/2addr v8, v11

    float-to-int v3, v8

    .line 430
    .local v3, "h2":I
    const/4 v1, 0x0

    .line 431
    .local v1, "div":I
    const/4 v0, 0x0

    .line 433
    .local v0, "d2":I
    iget v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    if-ne v8, v9, :cond_1

    .line 434
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v6

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 452
    .end local v0    # "d2":I
    .end local v1    # "div":I
    .end local v2    # "h":I
    .end local v3    # "h2":I
    .end local v4    # "l":I
    .end local v5    # "t":I
    .end local v6    # "w":I
    .end local v7    # "w2":I
    :cond_0
    :goto_0
    return-void

    .line 435
    .restart local v0    # "d2":I
    .restart local v1    # "div":I
    .restart local v2    # "h":I
    .restart local v3    # "h2":I
    .restart local v4    # "l":I
    .restart local v5    # "t":I
    .restart local v6    # "w":I
    .restart local v7    # "w2":I
    :cond_1
    iget v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    if-ne v8, v10, :cond_2

    .line 436
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 437
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v2

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 448
    .end local v0    # "d2":I
    .end local v1    # "div":I
    .end local v2    # "h":I
    .end local v3    # "h2":I
    .end local v4    # "l":I
    .end local v5    # "t":I
    .end local v6    # "w":I
    .end local v7    # "w2":I
    :catch_0
    move-exception v8

    goto :goto_0

    .line 438
    .restart local v0    # "d2":I
    .restart local v1    # "div":I
    .restart local v2    # "h":I
    .restart local v3    # "h2":I
    .restart local v4    # "l":I
    .restart local v5    # "t":I
    .restart local v6    # "w":I
    .restart local v7    # "w2":I
    :cond_2
    iget v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    if-ne v8, v12, :cond_3

    .line 439
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 440
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v3

    add-int/lit8 v11, v11, 0x0

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 441
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    add-int v11, v4, v6

    add-int v12, v5, v2

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 442
    :cond_3
    iget v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    const/4 v9, 0x4

    if-ne v8, v9, :cond_0

    .line 443
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 444
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v3

    add-int/lit8 v11, v11, 0x0

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 445
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    add-int v11, v4, v6

    add-int v12, v5, v2

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 446
    iget-object v8, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v5, v3

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v7

    add-int/lit8 v10, v10, 0x0

    add-int v11, v5, v2

    invoke-virtual {v8, v4, v9, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method


# virtual methods
.method public invalidateEmoji()V
    .locals 0

    .prologue
    .line 769
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->invalidate()V

    .line 770
    return-void
.end method

.method synthetic lambda$new$0()V
    .locals 1

    .prologue
    .line 275
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawTyping:Z

    if-eqz v0, :cond_0

    .line 276
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->invalidate()V

    .line 278
    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v11, 0x1

    const/4 v1, 0x0

    const/4 v10, 0x0

    .line 628
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 629
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryBitmap:Landroid/graphics/Bitmap;

    .line 630
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryCanvas:Landroid/graphics/Canvas;

    .line 631
    new-instance v9, Landroid/graphics/BitmapShader;

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryBitmap:Landroid/graphics/Bitmap;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v9, v0, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 632
    .local v9, "shader":Landroid/graphics/BitmapShader;
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 634
    .end local v9    # "shader":Landroid/graphics/BitmapShader;
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryCanvas:Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    int-to-float v3, v2

    iget-object v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    int-to-float v4, v2

    iget-object v5, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mEraserPaint:Landroid/graphics/Paint;

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 635
    invoke-direct {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->updateBounds()V

    .line 636
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    iget v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->primaryImagesCount:I

    if-ge v8, v0, :cond_3

    .line 637
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0, v8}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 638
    .local v7, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v7, :cond_2

    .line 639
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v7, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 636
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 643
    .end local v7    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_3
    sget-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->PRIMARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mPrimaryPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 646
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeText:Ljava/lang/String;

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeLabelX:F

    iget v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeLabelY:F

    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeTextPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 647
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleText:Ljava/lang/String;

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleLabelX:F

    iget v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleLabelY:F

    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTitleTextPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 650
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawOnline:Z

    if-eqz v0, :cond_4

    .line 651
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mOnlineIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 654
    :cond_4
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMuted:Z

    if-eqz v0, :cond_5

    .line 655
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMutedIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 658
    :cond_5
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawCounter:Z

    if-eqz v0, :cond_6

    .line 659
    iget-object v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBounds:Landroid/graphics/RectF;

    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_BORDER_RADIUS:I

    int-to-float v2, v0

    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->COUNTER_BORDER_RADIUS:I

    int-to-float v3, v0

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMuted:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterMutedBgPaint:Landroid/graphics/Paint;

    :goto_1
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 660
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterText:Ljava/lang/String;

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterLabelX:F

    iget v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterLabelY:F

    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterTextPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 662
    :cond_6
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawTyping:Z

    if-eqz v0, :cond_a

    .line 663
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 664
    iget v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingLabelX:F

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingLabelY:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 665
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingLayout:Landroid/text/Layout;

    invoke-virtual {v0, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 666
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 699
    :cond_7
    :goto_2
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawError:Z

    if-eqz v0, :cond_8

    .line 700
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 701
    iget v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterLabelX:F

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterLabelY:F

    sget-object v2, Lcom/vkontakte/android/ui/DialogEntryView;->sErrorImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 702
    sget-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->sErrorImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 703
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 706
    :cond_8
    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->DIVIDER_X:I

    int-to-float v1, v0

    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->DIVIDER_Y:I

    int-to-float v2, v0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getWidth()I

    move-result v0

    int-to-float v3, v0

    sget v0, Lcom/vkontakte/android/ui/DialogEntryView;->TOTAL_HEIGHT:I

    int-to-float v4, v0

    sget-object v5, Lcom/vkontakte/android/ui/DialogEntryView;->sDividerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 707
    return-void

    .line 659
    :cond_9
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mCounterBgPaint:Landroid/graphics/Paint;

    goto :goto_1

    .line 668
    :cond_a
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawSecondaryImage:Z

    if-eqz v0, :cond_b

    .line 669
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 670
    .local v6, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v6, :cond_b

    .line 671
    sget-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    float-to-int v0, v0

    sget-object v1, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    float-to-int v1, v1

    sget-object v2, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    float-to-int v2, v2

    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->SECONDARY_IMAGE_BOUNDS:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    float-to-int v3, v3

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 672
    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 675
    .end local v6    # "d":Landroid/graphics/drawable/Drawable;
    :cond_b
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachIcon:Z

    if-eqz v0, :cond_c

    .line 676
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 678
    :cond_c
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachLabel:Z

    if-eqz v0, :cond_d

    .line 679
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachText:Ljava/lang/String;

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachLabelX:F

    iget v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachLabelY:F

    iget-object v3, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachTextPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 681
    :cond_d
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMessageText:Z

    if-eqz v0, :cond_e

    .line 682
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 683
    iget v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLabelX:F

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLabelY:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 684
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    move-result v0

    if-nez v0, :cond_f

    .line 685
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v0}, Landroid/text/Layout;->getWidth()I

    move-result v0

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMaxMessageHeight:I

    invoke-virtual {p1, v10, v10, v0, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 691
    :goto_3
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v0, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 692
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 694
    :cond_e
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawUnreadDot:Z

    if-eqz v0, :cond_7

    .line 695
    iget v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDotX:F

    iget v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDotY:F

    sget v2, Lcom/vkontakte/android/ui/DialogEntryView;->DOT_RADIUS:I

    int-to-float v2, v2

    sget-object v3, Lcom/vkontakte/android/ui/DialogEntryView;->sDotPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_2

    .line 686
    :cond_f
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    move-result v0

    if-ne v0, v11, :cond_10

    .line 687
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v0}, Landroid/text/Layout;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v1, v10}, Landroid/text/Layout;->getLineBottom(I)I

    move-result v1

    invoke-virtual {p1, v10, v10, v0, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    goto :goto_3

    .line 689
    :cond_10
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v0}, Landroid/text/Layout;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mMessageLayout:Landroid/text/Layout;

    invoke-virtual {v1, v11}, Landroid/text/Layout;->getLineBottom(I)I

    move-result v1

    invoke-virtual {p1, v10, v10, v0, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    goto :goto_3
.end method

.method protected onLayout(ZIIII)V
    .locals 1
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 461
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    if-eqz v0, :cond_0

    .line 462
    invoke-direct {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->layout()V

    .line 464
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/vk/imageloader/view/VKMultiImageView;->onLayout(ZIIII)V

    .line 465
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 456
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    sget v1, Lcom/vkontakte/android/ui/DialogEntryView;->TOTAL_HEIGHT:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ui/DialogEntryView;->setMeasuredDimension(II)V

    .line 457
    return-void
.end method

.method public setData(Lcom/vkontakte/android/DialogEntry;Ljava/lang/String;)V
    .locals 5
    .param p1, "data"    # Lcom/vkontakte/android/DialogEntry;
    .param p2, "userPhoto"    # Ljava/lang/String;

    .prologue
    const v4, 0x77359400

    const/4 v3, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 359
    iput-object p1, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    .line 360
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-le v0, v4, :cond_7

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mGroupChat:Z

    .line 362
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    invoke-virtual {v0}, Lcom/vkontakte/android/DialogEntry;->getWritesMessage()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingUsers:Ljava/util/List;

    .line 363
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingUsers:Ljava/util/List;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTypingUsers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_8

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawTyping:Z

    .line 365
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mGroupChat:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->readState:Z

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v0, :cond_9

    :cond_1
    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mUseShortFormat:Z

    .line 368
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->online:I

    if-lez v0, :cond_a

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mGroupChat:Z

    if-nez v0, :cond_a

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawOnline:Z

    .line 369
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-boolean v0, v0, Lcom/vkontakte/android/DialogEntry;->muted:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawMuted:Z

    .line 370
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawError:Z

    .line 371
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawError:Z

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget v0, v0, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    if-lez v0, :cond_b

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->readState:Z

    if-nez v0, :cond_b

    move v0, v1

    :goto_4
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawCounter:Z

    .line 372
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mGroupChat:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v0, :cond_c

    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-nez v0, :cond_c

    move v0, v1

    :goto_5
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawSecondaryImage:Z

    .line 373
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawError:Z

    if-nez v0, :cond_d

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mUseShortFormat:Z

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->readState:Z

    if-nez v0, :cond_d

    move v0, v1

    :goto_6
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawUnreadDot:Z

    .line 374
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/DialogEntryView;->getAttachIcon(Lcom/vkontakte/android/attachments/Attachment;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mAttachIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    move v2, v1

    :cond_3
    iput-boolean v2, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawAttachIcon:Z

    .line 376
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mDrawOnline:Z

    if-eqz v0, :cond_4

    .line 377
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->online:I

    if-ne v0, v1, :cond_e

    sget-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->sOnline:Landroid/graphics/drawable/Drawable;

    :goto_7
    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mOnlineIcon:Landroid/graphics/drawable/Drawable;

    .line 379
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v0, v0, Lcom/vkontakte/android/Message;->time:I

    invoke-static {v0}, Lcom/vkontakte/android/TimeUtils;->langDateShort(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mTimeText:Ljava/lang/String;

    .line 381
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->getWidth()I

    move-result v0

    if-eqz v0, :cond_5

    .line 382
    invoke-direct {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->layout()V

    .line 384
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/DialogEntryView;->setAvatarUrl(Ljava/lang/String;)V

    .line 385
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v0, :cond_f

    .line 386
    invoke-virtual {p0, v3, p2}, Lcom/vkontakte/android/ui/DialogEntryView;->load(ILjava/lang/String;)V

    .line 390
    :cond_6
    :goto_8
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/DialogEntryView;->invalidate()V

    .line 391
    return-void

    :cond_7
    move v0, v2

    .line 360
    goto/16 :goto_0

    :cond_8
    move v0, v2

    .line 363
    goto/16 :goto_1

    :cond_9
    move v0, v2

    .line 365
    goto/16 :goto_2

    :cond_a
    move v0, v2

    .line 368
    goto/16 :goto_3

    :cond_b
    move v0, v2

    .line 371
    goto/16 :goto_4

    :cond_c
    move v0, v2

    .line 372
    goto/16 :goto_5

    :cond_d
    move v0, v2

    .line 373
    goto :goto_6

    .line 377
    :cond_e
    sget-object v0, Lcom/vkontakte/android/ui/DialogEntryView;->sOnlineMobile:Landroid/graphics/drawable/Drawable;

    goto :goto_7

    .line 387
    :cond_f
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-le v0, v4, :cond_6

    .line 388
    iget-object v0, p0, Lcom/vkontakte/android/ui/DialogEntryView;->mData:Lcom/vkontakte/android/DialogEntry;

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    invoke-virtual {p0, v3, v0}, Lcom/vkontakte/android/ui/DialogEntryView;->load(ILjava/lang/String;)V

    goto :goto_8
.end method
