.class Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "FriendsImportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKFromList",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKFromList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKFromList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 168
    .local p1, "result":Lcom/vkontakte/android/data/VKFromList;, "Lcom/vkontakte/android/data/VKFromList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKFromList;->from()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->startFrom:Ljava/lang/String;

    .line 169
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->startFrom:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, p1, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->access$200(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Ljava/util/List;Z)V

    .line 170
    return-void

    .line 169
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 165
    check-cast p1, Lcom/vkontakte/android/data/VKFromList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;->success(Lcom/vkontakte/android/data/VKFromList;)V

    return-void
.end method
