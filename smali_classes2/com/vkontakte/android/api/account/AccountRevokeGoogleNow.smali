.class public Lcom/vkontakte/android/api/account/AccountRevokeGoogleNow;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const-string v0, "account.revokeGoogleNow"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    const-string v0, "old_access_token"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/account/AccountRevokeGoogleNow;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    return-void
.end method
