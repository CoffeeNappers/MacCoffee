.class public Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "AddUserToChatHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder$AddUserToChatI;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder$AddUserToChatI;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 17
    const v0, 0x7f030023

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 18
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder$AddUserToChatI;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder$AddUserToChatI;

    .prologue
    .line 22
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 10
    check-cast p1, Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder$AddUserToChatI;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder;->onBind(Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder$AddUserToChatI;)V

    return-void
.end method

.method public onClick()V
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 27
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder$AddUserToChatI;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder$AddUserToChatI;->addUserToChat()V

    .line 29
    :cond_0
    return-void
.end method
