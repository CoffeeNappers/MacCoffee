.class final Lcom/vk/sharing/view/KeyboardListener;
.super Ljava/lang/Object;
.source "KeyboardListener.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field private prevHeight:I

.field private final screenHeight:I

.field private final statusBarHeight:I

.field private final view:Lcom/vk/sharing/view/SharingView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/vk/sharing/view/SharingView;)V
    .locals 5
    .param p1, "view"    # Lcom/vk/sharing/view/SharingView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v2, -0x1

    iput v2, p0, Lcom/vk/sharing/view/KeyboardListener;->prevHeight:I

    .line 23
    iput-object p1, p0, Lcom/vk/sharing/view/KeyboardListener;->view:Lcom/vk/sharing/view/SharingView;

    .line 24
    iget-object v2, p0, Lcom/vk/sharing/view/KeyboardListener;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v2}, Lcom/vk/sharing/view/SharingView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 26
    invoke-virtual {p1}, Lcom/vk/sharing/view/SharingView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 27
    .local v0, "res":Landroid/content/res/Resources;
    const-string/jumbo v2, "status_bar_height"

    const-string/jumbo v3, "dimen"

    const-string/jumbo v4, "android"

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 28
    .local v1, "resId":I
    if-eqz v1, :cond_0

    .line 29
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/vk/sharing/view/KeyboardListener;->statusBarHeight:I

    .line 33
    :goto_0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v2, p0, Lcom/vk/sharing/view/KeyboardListener;->screenHeight:I

    .line 34
    return-void

    .line 31
    :cond_0
    const/4 v2, 0x0

    iput v2, p0, Lcom/vk/sharing/view/KeyboardListener;->statusBarHeight:I

    goto :goto_0
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .prologue
    .line 38
    iget v1, p0, Lcom/vk/sharing/view/KeyboardListener;->prevHeight:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 39
    iget-object v1, p0, Lcom/vk/sharing/view/KeyboardListener;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1}, Lcom/vk/sharing/view/SharingView;->getHeight()I

    move-result v1

    iput v1, p0, Lcom/vk/sharing/view/KeyboardListener;->prevHeight:I

    .line 42
    :cond_0
    iget v1, p0, Lcom/vk/sharing/view/KeyboardListener;->prevHeight:I

    iget-object v2, p0, Lcom/vk/sharing/view/KeyboardListener;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v2}, Lcom/vk/sharing/view/SharingView;->getHeight()I

    move-result v2

    if-eq v1, v2, :cond_1

    .line 43
    iget v1, p0, Lcom/vk/sharing/view/KeyboardListener;->prevHeight:I

    iget-object v2, p0, Lcom/vk/sharing/view/KeyboardListener;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v2}, Lcom/vk/sharing/view/SharingView;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 44
    .local v0, "keyboardHeight":I
    iget-object v1, p0, Lcom/vk/sharing/view/KeyboardListener;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1}, Lcom/vk/sharing/view/SharingView;->getHeight()I

    move-result v1

    iput v1, p0, Lcom/vk/sharing/view/KeyboardListener;->prevHeight:I

    .line 45
    iget v1, p0, Lcom/vk/sharing/view/KeyboardListener;->prevHeight:I

    iget v2, p0, Lcom/vk/sharing/view/KeyboardListener;->statusBarHeight:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/vk/sharing/view/KeyboardListener;->screenHeight:I

    if-ne v1, v2, :cond_2

    .line 46
    iget-object v1, p0, Lcom/vk/sharing/view/KeyboardListener;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1, v0}, Lcom/vk/sharing/view/SharingView;->onHiddenKeyboard(I)V

    .line 51
    .end local v0    # "keyboardHeight":I
    :cond_1
    :goto_0
    return-void

    .line 48
    .restart local v0    # "keyboardHeight":I
    :cond_2
    iget-object v1, p0, Lcom/vk/sharing/view/KeyboardListener;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1, v0}, Lcom/vk/sharing/view/SharingView;->onOpenedKeyboard(I)V

    goto :goto_0
.end method
