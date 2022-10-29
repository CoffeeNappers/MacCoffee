.class public Lcom/vkontakte/android/api/account/AccountSetInfo;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AccountSetInfo.java"


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "flags"    # I

    .prologue
    .line 24
    const-string/jumbo v0, "account.setInfo"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 25
    const-string/jumbo v0, "intro"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/account/AccountSetInfo;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 26
    const-string/jumbo v0, "v"

    const-string/jumbo v1, "5.46"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/account/AccountSetInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 2
    .param p1, "ownPostsDefault"    # Z
    .param p2, "noWallReplies"    # Z

    .prologue
    .line 30
    const-string/jumbo v0, "account.setInfo"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 31
    const-string/jumbo v1, "own_posts_default"

    if-eqz p1, :cond_0

    const-string/jumbo v0, "1"

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/account/AccountSetInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 32
    const-string/jumbo v1, "no_wall_replies"

    if-eqz p2, :cond_1

    const-string/jumbo v0, "1"

    :goto_1
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/account/AccountSetInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 33
    const-string/jumbo v0, "v"

    const-string/jumbo v1, "5.46"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/account/AccountSetInfo;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 34
    return-void

    .line 31
    :cond_0
    const-string/jumbo v0, "0"

    goto :goto_0

    .line 32
    :cond_1
    const-string/jumbo v0, "0"

    goto :goto_1
.end method