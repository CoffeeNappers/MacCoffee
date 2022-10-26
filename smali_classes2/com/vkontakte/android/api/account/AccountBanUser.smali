.class public Lcom/vkontakte/android/api/account/AccountBanUser;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AccountBanUser.java"


# direct methods
.method public constructor <init>(IZ)V
    .locals 2
    .param p1, "uid"    # I
    .param p2, "ban"    # Z

    .prologue
    if-eqz p2, :cond_0

    const-string v0, "account.ban"

    :goto_0
    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    const-string v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/account/AccountBanUser;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    const-string v0, "v"

    const-string v1, "5.90"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/account/AccountBanUser;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    return-void

    :cond_0
    const-string/jumbo v0, "account.unban"

    goto :goto_0
.end method
