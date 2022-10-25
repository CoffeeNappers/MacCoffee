.class Lcom/vkontakte/android/stickers/WindowRecyclerView$3;
.super Landroid/widget/FrameLayout;
.source "WindowRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/WindowRecyclerView;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final position:[I

.field final synthetic this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/WindowRecyclerView;Landroid/content/Context;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/WindowRecyclerView;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 107
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->position:[I

    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 6
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 111
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 112
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 136
    :cond_0
    :goto_0
    return-void

    .line 116
    :cond_1
    const/4 v1, 0x0

    .line 118
    .local v1, "extraPadding":I
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-gt v3, v4, :cond_2

    .line 119
    iget-object v3, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->position:[I

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->getLocationOnScreen([I)V

    .line 120
    iget-object v3, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->position:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    if-nez v3, :cond_2

    .line 121
    invoke-static {}, Lcom/vkontakte/android/ViewUtils;->getStatusBarHeight()I

    move-result v1

    .line 125
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$900(Lcom/vkontakte/android/stickers/WindowRecyclerView;)I

    move-result v3

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->getMeasuredHeight()I

    move-result v4

    shr-int/lit8 v4, v4, 0x1

    sget v5, Lcom/vkontakte/android/stickers/StickersConfig;->PREVIEW_SIZE:I

    shr-int/lit8 v5, v5, 0x1

    add-int/2addr v4, v5

    sub-int/2addr v3, v4

    add-int/2addr v3, v1

    neg-int v0, v3

    .line 126
    .local v0, "diff":I
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->getMeasuredHeight()I

    move-result v3

    shr-int/lit8 v3, v3, 0x1

    sget v4, Lcom/vkontakte/android/stickers/StickersConfig;->PREVIEW_SIZE:I

    shr-int/lit8 v4, v4, 0x1

    sub-int/2addr v3, v4

    add-int v2, v3, v1

    .line 127
    .local v2, "maxDiff":I
    if-le v0, v2, :cond_3

    .line 128
    move v0, v2

    .line 131
    :cond_3
    if-lez v0, :cond_0

    .line 132
    iget-object v3, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$1000(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/imageloader/view/VKImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    iput v0, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 133
    iget-object v3, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$1100(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Landroid/widget/ProgressBar;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ProgressBar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    iput v0, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 134
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/WindowRecyclerView$3;->requestLayout()V

    goto :goto_0
.end method
