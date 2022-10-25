.class public Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "FriendsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    const-class v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 61
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 65
    return-void
.end method


# virtual methods
.method public setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 3

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "disable_spinner"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 84
    return-object p0
.end method

.method public setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 2
    .param p1, "globalSearch"    # Z

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "global_search"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 99
    return-object p0
.end method

.method public setMultiSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 3

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "multiselect"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 94
    return-object p0
.end method

.method public setMutual(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 2
    .param p1, "mutual"    # Z

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "mutual"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 74
    return-object p0
.end method

.method public setPresetUsers([I)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 2
    .param p1, "users"    # [I

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "selectedUsers"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 104
    return-object p0
.end method

.method public setSearchEnabled(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 2
    .param p1, "value"    # Z

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "search_enabled"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 109
    return-object p0
.end method

.method public setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 3

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "select"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 79
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    return-object p0
.end method

.method public setUid(I)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    .locals 2
    .param p1, "uid"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "uid"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 69
    return-object p0
.end method
