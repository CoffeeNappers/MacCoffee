.class public Lcom/vkontakte/android/fragments/SuggestedPostListFragment;
.super Lcom/vkontakte/android/fragments/PostListFragment;
.source "SuggestedPostListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/SuggestedPostListFragment$Builder;
    }
.end annotation


# instance fields
.field private receiver:Landroid/content/BroadcastReceiver;

.field private uid:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostListFragment;-><init>()V

    .line 22
    new-instance v0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$1;-><init>(Lcom/vkontakte/android/fragments/SuggestedPostListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->receiver:Landroid/content/BroadcastReceiver;

    return-void
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 6
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 81
    new-instance v0, Lcom/vkontakte/android/api/wall/WallGet;

    iget v1, p0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->uid:I

    const-string/jumbo v4, "suggests"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v5

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/wall/WallGet;-><init>(IIILjava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$2;-><init>(Lcom/vkontakte/android/fragments/SuggestedPostListFragment;Landroid/app/Fragment;)V

    .line 82
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 88
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 89
    return-void
.end method

.method protected getListReferrer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getReferer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    const-string/jumbo v0, "postponed"

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->uid:I

    .line 64
    const v0, 0x7f0806ee

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->setTitle(I)V

    .line 65
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onAttach(Landroid/app/Activity;)V

    .line 66
    const v0, 0x7f080456

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->setEmptyText(I)V

    .line 67
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 45
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 46
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.POST_DELETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 47
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 48
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 52
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDestroy()V

    .line 54
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
