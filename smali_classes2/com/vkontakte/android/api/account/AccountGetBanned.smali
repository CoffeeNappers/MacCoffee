.class public Lcom/vkontakte/android/api/account/AccountGetBanned;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "AccountGetBanned.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 9
    const-string/jumbo v0, "account.getBanned"

    const-class v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 10
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/account/AccountGetBanned;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "online,photo_100,photo_200,photo_50"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/account/AccountGetBanned;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    return-void
.end method
