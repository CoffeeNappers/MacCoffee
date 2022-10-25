.class public Lcom/vkontakte/android/ui/XFrameLayout;
.super Landroid/widget/FrameLayout;
.source "XFrameLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;
    }
.end annotation


# instance fields
.field private listener:Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

.field private prevh:I

.field private prevw:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, -0x1

    .line 17
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 13
    iput v0, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevw:I

    iput v0, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevh:I

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/XFrameLayout;->listener:Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, -0x1

    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    iput v0, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevw:I

    iput v0, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevh:I

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/XFrameLayout;->listener:Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

    .line 22
    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 8
    .param p1, "wm"    # I
    .param p2, "hm"    # I

    .prologue
    const/4 v7, -0x1

    .line 25
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/XFrameLayout;->isInEditMode()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 26
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 44
    :goto_0
    return-void

    .line 29
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .local v5, "w":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 30
    .local v1, "h":I
    iget v6, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevh:I

    if-eq v6, v7, :cond_1

    iget v6, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevw:I

    if-eq v6, v7, :cond_1

    iget v6, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevw:I

    if-ne v6, v5, :cond_1

    .line 31
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 32
    .local v2, "rect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/XFrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 33
    iget v4, v2, Landroid/graphics/Rect;->top:I

    .line 34
    .local v4, "statusBarHeight":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/XFrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Display;->getHeight()I

    move-result v3

    .line 35
    .local v3, "screenHeight":I
    sub-int v6, v3, v4

    sub-int v0, v6, v1

    .line 37
    .local v0, "diff":I
    iget-object v6, p0, Lcom/vkontakte/android/ui/XFrameLayout;->listener:Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

    if-eqz v6, :cond_1

    .line 38
    iget-object v7, p0, Lcom/vkontakte/android/ui/XFrameLayout;->listener:Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

    const/16 v6, 0x80

    if-lt v0, v6, :cond_2

    const/4 v6, 0x1

    :goto_1
    invoke-interface {v7, v6}, Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;->onKeyboardStateChanged(Z)V

    .line 41
    .end local v0    # "diff":I
    .end local v2    # "rect":Landroid/graphics/Rect;
    .end local v3    # "screenHeight":I
    .end local v4    # "statusBarHeight":I
    :cond_1
    iput v5, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevw:I

    .line 42
    iput v1, p0, Lcom/vkontakte/android/ui/XFrameLayout;->prevh:I

    .line 43
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    goto :goto_0

    .line 38
    .restart local v0    # "diff":I
    .restart local v2    # "rect":Landroid/graphics/Rect;
    .restart local v3    # "screenHeight":I
    .restart local v4    # "statusBarHeight":I
    :cond_2
    const/4 v6, 0x0

    goto :goto_1
.end method

.method public setOnKeyboardStateListener(Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/vkontakte/android/ui/XFrameLayout;->listener:Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;

    .line 52
    return-void
.end method
