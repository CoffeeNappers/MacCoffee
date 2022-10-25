.class public Lcom/vkontakte/android/ui/widget/SeekBarSamsungFixed;
.super Landroid/support/v7/widget/AppCompatSeekBar;
.source "SeekBarSamsungFixed.java"


# instance fields
.field enabled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatSeekBar;-><init>(Landroid/content/Context;)V

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/SeekBarSamsungFixed;->enabled:Z

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/SeekBarSamsungFixed;->enabled:Z

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/AppCompatSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/SeekBarSamsungFixed;->enabled:Z

    .line 22
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/SeekBarSamsungFixed;->enabled:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatSeekBar;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/widget/SeekBarSamsungFixed;->enabled:Z

    .line 27
    return-void
.end method
