.class public Lcom/vkontakte/android/api/groups/GroupsSearch;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "GroupsSearch.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 2
    .param p1, "q"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 9
    const-string/jumbo v0, "groups.search"

    const-class v1, Lcom/vkontakte/android/api/Group;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 10
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/groups/GroupsSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "offset"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "start_date,members_count,verified"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/groups/GroupsSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    return-void
.end method
