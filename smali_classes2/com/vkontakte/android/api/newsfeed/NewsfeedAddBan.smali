.class public Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "NewsfeedAddBan.java"


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "refer"    # Ljava/lang/String;
    .param p3, "trackCode"    # Ljava/lang/String;

    .prologue
    .line 9
    const-string/jumbo v0, "newsfeed.addBan"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 10
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 11
    const-string/jumbo v0, "ref"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 14
    const-string/jumbo v0, "track_code"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    :cond_1
    if-lez p1, :cond_2

    .line 17
    const-string/jumbo v0, "user_ids"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 21
    :goto_0
    return-void

    .line 19
    :cond_2
    const-string/jumbo v0, "group_ids"

    neg-int v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method
