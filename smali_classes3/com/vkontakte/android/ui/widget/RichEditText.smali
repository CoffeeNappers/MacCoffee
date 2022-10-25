.class public Lcom/vkontakte/android/ui/widget/RichEditText;
.super Landroid/support/v7/widget/AppCompatEditText;
.source "RichEditText.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/widget/RichEditText$OnKeyPreImeListener;
    }
.end annotation


# instance fields
.field private keepFocus:Z

.field public onKeyPreImeListener:Lcom/vkontakte/android/ui/widget/RichEditText$OnKeyPreImeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    return-void
.end method


# virtual methods
.method public clearFocus()V
    .locals 1

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/RichEditText;->keepFocus:Z

    if-nez v0, :cond_0

    .line 33
    invoke-super {p0}, Landroid/support/v7/widget/AppCompatEditText;->clearFocus()V

    .line 35
    :cond_0
    return-void
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/RichEditText;->onKeyPreImeListener:Lcom/vkontakte/android/ui/widget/RichEditText$OnKeyPreImeListener;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/RichEditText;->onKeyPreImeListener:Lcom/vkontakte/android/ui/widget/RichEditText$OnKeyPreImeListener;

    invoke-interface {v0, p1, p2}, Lcom/vkontakte/android/ui/widget/RichEditText$OnKeyPreImeListener;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 55
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final setKeepFocus(Z)V
    .locals 1
    .param p1, "keepFocus"    # Z

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/widget/RichEditText;->keepFocus:Z

    .line 39
    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/RichEditText;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/RichEditText;->clearFocus()V

    .line 45
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/RichEditText;->requestFocus()Z

    .line 47
    :cond_0
    return-void
.end method
