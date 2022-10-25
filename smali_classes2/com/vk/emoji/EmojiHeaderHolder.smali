.class final Lcom/vk/emoji/EmojiHeaderHolder;
.super Lcom/vk/emoji/EmojiHolder;
.source "EmojiHeaderHolder.java"


# instance fields
.field private textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/Typeface;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "headersTypeface"    # Landroid/graphics/Typeface;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/high16 v3, 0x41400000    # 12.0f

    .line 14
    new-instance v0, Lcom/vk/emoji/EmojiHeaderHolder$1;

    invoke-direct {v0, p1, p1}, Lcom/vk/emoji/EmojiHeaderHolder$1;-><init>(Landroid/content/Context;Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/vk/emoji/EmojiHolder;-><init>(Landroid/view/View;)V

    .line 21
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    .line 22
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 23
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    const v1, 0x3d4ccccd    # 0.05f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    invoke-static {v3, p1}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v1

    float-to-int v1, v1

    const/high16 v2, 0x40a00000    # 5.0f

    .line 26
    invoke-static {v2, p1}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v2

    float-to-int v2, v2

    .line 25
    invoke-virtual {v0, v1, v4, v4, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 27
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 28
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 29
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    const v1, -0x6f6b67

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    const/16 v1, 0x53

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 31
    if-eqz p2, :cond_1

    .line 32
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 36
    :goto_0
    return-void

    .line 34
    :cond_1
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_0
.end method


# virtual methods
.method public update(Ljava/lang/String;)V
    .locals 1
    .param p1, "emojiCategoryName"    # Ljava/lang/String;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vk/emoji/EmojiHeaderHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    return-void
.end method
