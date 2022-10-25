.class public Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "PrettyCardAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PrettyCardAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrettyCardDecoration"
.end annotation


# instance fields
.field private defaultOffset:I

.field private firstLeftOffset:I

.field private lastRightOffset:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 380
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 381
    const/16 v0, 0x10

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;->lastRightOffset:I

    iput v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;->firstLeftOffset:I

    .line 382
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;->defaultOffset:I

    .line 383
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 3
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 387
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v1

    .line 389
    .local v1, "position":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    .line 391
    .local v0, "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    if-nez v1, :cond_0

    .line 392
    iget v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;->firstLeftOffset:I

    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 399
    :goto_0
    return-void

    .line 393
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_1

    .line 394
    iget v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;->defaultOffset:I

    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 395
    iget v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;->lastRightOffset:I

    iput v2, p1, Landroid/graphics/Rect;->right:I

    goto :goto_0

    .line 397
    :cond_1
    iget v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;->defaultOffset:I

    iput v2, p1, Landroid/graphics/Rect;->left:I

    goto :goto_0
.end method
