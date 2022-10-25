.class public Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment;
.super Lcom/vkontakte/android/fragments/friends/FriendsFragment;
.source "SendRequestToGameFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$Builder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected doLoadData()V
    .locals 4

    .prologue
    .line 21
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGetFriendsList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "appId"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetFriendsList;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$1;-><init>(Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment;Landroid/app/Fragment;)V

    .line 22
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetFriendsList;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 27
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 28
    return-void
.end method
