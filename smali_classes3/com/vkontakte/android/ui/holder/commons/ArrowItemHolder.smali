.class public Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ArrowItemHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field final text1:Landroid/widget/TextView;

.field final text2:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 31
    const v0, 0x7f030040

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 32
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->text1:Landroid/widget/TextView;

    .line 33
    const v0, 0x1020015

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->text2:Landroid/widget/TextView;

    .line 34
    const v0, 0x1020006

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    const v2, 0x7f020189

    .line 35
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, -0x55514d

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 36
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->text1:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->text2:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 13
    check-cast p1, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->onBind(Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;->listener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder$Info;->listener:Landroid/view/View$OnClickListener;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/commons/ArrowItemHolder;->itemView:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 49
    :cond_0
    return-void
.end method
