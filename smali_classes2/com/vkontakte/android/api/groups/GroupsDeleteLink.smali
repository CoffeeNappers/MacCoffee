.class public Lcom/vkontakte/android/api/groups/GroupsDeleteLink;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "GroupsDeleteLink.java"


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "gid"    # I
    .param p2, "lid"    # I

    .prologue
    .line 11
    const-string/jumbo v0, "groups.deleteLink"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 12
    const-string/jumbo v0, "group_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/groups/GroupsDeleteLink;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v0, "link_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/groups/GroupsDeleteLink;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    return-void
.end method
