.class public Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SettingsSelectFriendHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field final textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 28
    const v0, 0x7f0301f8

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 29
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;->textView:Landroid/widget/TextView;

    .line 30
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;->textView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;->text:Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 35
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 12
    check-cast p1, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;->onBind(Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;)V

    return-void
.end method

.method public onClick()V
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;->clickFunc:Lcom/vkontakte/android/functions/VoidF0;

    invoke-interface {v0}, Lcom/vkontakte/android/functions/VoidF0;->f()V

    .line 40
    return-void
.end method
