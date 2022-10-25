.class Lcom/vk/emoji/EmojiHeaderHolder$1;
.super Landroid/widget/TextView;
.source "EmojiHeaderHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/emoji/EmojiHeaderHolder;-><init>(Landroid/content/Context;Landroid/graphics/Typeface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Context;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Context;

    .prologue
    .line 14
    iput-object p2, p0, Lcom/vk/emoji/EmojiHeaderHolder$1;->val$context:Landroid/content/Context;

    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 17
    iget-object v1, p0, Lcom/vk/emoji/EmojiHeaderHolder$1;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/vk/emoji/R$dimen;->emoji_keyboard_header_height:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v0, v1

    .line 18
    .local v0, "height":I
    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-super {p0, p1, v1}, Landroid/widget/TextView;->onMeasure(II)V

    .line 19
    return-void
.end method
