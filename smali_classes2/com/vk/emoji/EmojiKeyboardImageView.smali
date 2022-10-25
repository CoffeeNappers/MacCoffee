.class final Lcom/vk/emoji/EmojiKeyboardImageView;
.super Landroid/widget/ImageView;
.source "EmojiKeyboardImageView.java"

# interfaces
.implements Lcom/vk/emoji/EmojiView;


# static fields
.field private static final emojiDrawableMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vk/emoji/EmojiKeyboardImageView;->emojiDrawableMap:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 17
    invoke-direct {p0}, Lcom/vk/emoji/EmojiKeyboardImageView;->init()V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    invoke-direct {p0}, Lcom/vk/emoji/EmojiKeyboardImageView;->init()V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    invoke-direct {p0}, Lcom/vk/emoji/EmojiKeyboardImageView;->init()V

    .line 28
    return-void
.end method

.method private getEmojiDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1, "emojiCode"    # Ljava/lang/String;

    .prologue
    .line 38
    sget-object v1, Lcom/vk/emoji/EmojiKeyboardImageView;->emojiDrawableMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 39
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_0

    .line 40
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiKeyboardImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/emoji/Emoji;->instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vk/emoji/Emoji;->getEmojiDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 41
    sget-object v1, Lcom/vk/emoji/EmojiKeyboardImageView;->emojiDrawableMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    :cond_0
    return-object v0
.end method

.method private init()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 31
    sget v0, Lcom/vk/emoji/R$drawable;->emoji_white_ripple_bounded:I

    invoke-virtual {p0, v0}, Lcom/vk/emoji/EmojiKeyboardImageView;->setBackgroundResource(I)V

    .line 32
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/vk/emoji/EmojiKeyboardImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 33
    invoke-virtual {p0, v1}, Lcom/vk/emoji/EmojiKeyboardImageView;->setFocusable(Z)V

    .line 34
    invoke-virtual {p0, v1}, Lcom/vk/emoji/EmojiKeyboardImageView;->setFocusableInTouchMode(Z)V

    .line 35
    return-void
.end method


# virtual methods
.method public invalidateEmoji()V
    .locals 0

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiKeyboardImageView;->invalidate()V

    .line 60
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiKeyboardImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/vk/emoji/R$dimen;->emoji_keyboard_item_width:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 50
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiKeyboardImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/vk/emoji/R$dimen;->emoji_keyboard_item_height:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 48
    invoke-super {p0, v0, v1}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 51
    return-void
.end method

.method public setEmoji(Ljava/lang/String;)V
    .locals 1
    .param p1, "emojiCode"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/vk/emoji/EmojiKeyboardImageView;->getEmojiDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/emoji/EmojiKeyboardImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    return-void
.end method
