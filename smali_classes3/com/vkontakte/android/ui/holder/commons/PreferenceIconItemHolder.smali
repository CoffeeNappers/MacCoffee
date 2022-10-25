.class public Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "PreferenceIconItemHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;",
        ">",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<TT;>;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private final clickFunk:Lcom/vkontakte/android/functions/VoidF1;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final icon:Landroid/view/View;

.field protected final text:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/functions/VoidF1;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;, "Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder<TT;>;"
    .local p2, "clickFunk":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<TT;>;"
    const v0, 0x7f0300d9

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 47
    const v0, 0x1020006

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->icon:Landroid/view/View;

    .line 48
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->text:Landroid/widget/TextView;

    .line 49
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->onViewInit()V

    .line 50
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->clickFunk:Lcom/vkontakte/android/functions/VoidF1;

    .line 51
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;, "Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder<TT;>;"
    .local p1, "item":Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;, "TT;"
    iget v2, p1, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->colorRes:I

    const v3, 0x106000d

    if-eq v2, v3, :cond_0

    .line 60
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->icon:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p1, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->iconRes:I

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 61
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->icon:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v3, p1, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->colorRes:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 62
    .local v0, "color":I
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->icon:Landroid/view/View;

    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-direct {v3, v1, v0}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .end local v0    # "color":I
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->text:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->text:Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 67
    return-void

    .line 64
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->icon:Landroid/view/View;

    iget v3, p1, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;->iconRes:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    .local p0, "this":Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;, "Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder<TT;>;"
    check-cast p1, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->onBind(Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 71
    .local p0, "this":Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;, "Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->clickFunk:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->clickFunk:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 74
    :cond_0
    return-void
.end method

.method protected onViewInit()V
    .locals 0

    .prologue
    .line 55
    .local p0, "this":Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;, "Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder<TT;>;"
    return-void
.end method
