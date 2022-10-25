.class public Lcom/vkontakte/android/ui/LinkedTextView;
.super Landroid/support/v7/widget/AppCompatTextView;
.source "LinkedTextView.java"


# instance fields
.field private delegate:Lcom/vkontakte/android/ui/ClickableLinksDelegate;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    .line 14
    new-instance v0, Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/ClickableLinksDelegate;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/LinkedTextView;->delegate:Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    .line 18
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/LinkedTextView;->setDrawingCacheEnabled(Z)V

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    new-instance v0, Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/ClickableLinksDelegate;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/LinkedTextView;->delegate:Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    .line 23
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/LinkedTextView;->setDrawingCacheEnabled(Z)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    new-instance v0, Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/ClickableLinksDelegate;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/LinkedTextView;->delegate:Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    .line 28
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/LinkedTextView;->setDrawingCacheEnabled(Z)V

    .line 29
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatTextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/ui/LinkedTextView;->delegate:Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/ClickableLinksDelegate;->onDraw(Landroid/graphics/Canvas;)V

    .line 42
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/ui/LinkedTextView;->delegate:Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/ClickableLinksDelegate;->onTouch(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatTextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCanShowMessageOptions(Z)V
    .locals 1
    .param p1, "canShowMessageOptions"    # Z

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/ui/LinkedTextView;->delegate:Lcom/vkontakte/android/ui/ClickableLinksDelegate;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/ClickableLinksDelegate;->setCanShowMessageOptions(Z)V

    .line 33
    return-void
.end method
