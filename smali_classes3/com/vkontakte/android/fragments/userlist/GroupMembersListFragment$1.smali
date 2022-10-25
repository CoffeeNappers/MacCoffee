.class Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;
.super Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider;
.source "GroupMembersListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getIndexChar(Lcom/vkontakte/android/UserProfile;)[C
    .locals 5
    .param p1, "from"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    const/16 v1, 0x20

    const/4 v4, 0x0

    .line 55
    const/4 v0, 0x2

    new-array v2, v0, [C

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 56
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    aput-char v0, v2, v4

    const/4 v0, 0x1

    iget-object v3, p1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 57
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    :goto_1
    aput-char v1, v2, v0

    return-object v2

    .line 56
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    goto :goto_0

    .line 57
    :cond_1
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    goto :goto_1
.end method

.method public bridge synthetic getIndexChar(Ljava/lang/Object;)[C
    .locals 1

    .prologue
    .line 52
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;->getIndexChar(Lcom/vkontakte/android/UserProfile;)[C

    move-result-object v0

    return-object v0
.end method

.method public matches(Ljava/lang/String;Lcom/vkontakte/android/UserProfile;)Z
    .locals 1
    .param p1, "q"    # Ljava/lang/String;
    .param p2, "item"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 63
    iget-object v0, p2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p2, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 64
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p2, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 65
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic matches(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 52
    check-cast p2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$1;->matches(Ljava/lang/String;Lcom/vkontakte/android/UserProfile;)Z

    move-result v0

    return v0
.end method
