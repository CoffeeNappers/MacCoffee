.class public Lcom/vkontakte/android/api/groups/GroupsJoin;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "GroupsJoin.java"


# direct methods
.method public constructor <init>(IZ)V
    .locals 2
    .param p1, "gid"    # I
    .param p2, "unsure"    # Z

    .prologue
    .line 15
    const-string/jumbo v0, "groups.join"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 16
    const-string/jumbo v0, "group_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/groups/GroupsJoin;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    if-eqz p2, :cond_0

    .line 18
    const-string/jumbo v0, "not_sure"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/groups/GroupsJoin;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    :cond_0
    return-void
.end method

.method public static createGroupsJoinAndSendAllStats(IZ)Lcom/vkontakte/android/api/groups/GroupsJoin;
    .locals 1
    .param p0, "gid"    # I
    .param p1, "unsure"    # Z

    .prologue
    .line 10
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->sendAnalyticsNow()V

    .line 11
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsJoin;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/api/groups/GroupsJoin;-><init>(IZ)V

    return-object v0
.end method


# virtual methods
.method public invokeCallback(Ljava/lang/Object;)V
    .locals 1
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessAPIRequest;->invokeCallback(Ljava/lang/Object;)V

    .line 25
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->reload(Z)V

    .line 26
    return-void
.end method
