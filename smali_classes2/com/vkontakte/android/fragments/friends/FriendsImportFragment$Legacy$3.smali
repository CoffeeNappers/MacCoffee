.class Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;
.super Ljava/lang/Object;
.source "FriendsImportFragment.java"

# interfaces
.implements Lcom/facebook/FacebookCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->startImportFacebook()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/FacebookCallback",
        "<",
        "Lcom/facebook/login/LoginResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    .prologue
    .line 875
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 2

    .prologue
    .line 887
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    .line 888
    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 3
    .param p1, "e"    # Lcom/facebook/FacebookException;

    .prologue
    .line 892
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    .line 893
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0801f9

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 894
    return-void
.end method

.method public onSuccess(Lcom/facebook/login/LoginResult;)V
    .locals 2
    .param p1, "loginResult"    # Lcom/facebook/login/LoginResult;

    .prologue
    .line 878
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    .line 880
    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getAccessToken()Lcom/facebook/AccessToken;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 881
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getAccessToken()Lcom/facebook/AccessToken;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importFacebook(Lcom/facebook/AccessToken;)V

    .line 883
    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 875
    check-cast p1, Lcom/facebook/login/LoginResult;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;->onSuccess(Lcom/facebook/login/LoginResult;)V

    return-void
.end method
