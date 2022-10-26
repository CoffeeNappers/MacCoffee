.class public Lcom/vkontakte/android/api/account/AccountRegisterGoogleNow;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const-string v0, "account.registerGoogleNow"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    const-string v0, "auth_code"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/account/AccountRegisterGoogleNow;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    return-void
.end method
