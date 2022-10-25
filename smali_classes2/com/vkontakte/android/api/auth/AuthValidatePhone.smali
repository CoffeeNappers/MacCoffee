.class public Lcom/vkontakte/android/api/auth/AuthValidatePhone;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AuthValidatePhone.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "phone"    # Ljava/lang/String;
    .param p3, "voice"    # Z

    .prologue
    .line 11
    const-string/jumbo v0, "auth.validatePhone"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 12
    const-string/jumbo v0, "sid"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/auth/AuthValidatePhone;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v0, "phone"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/auth/AuthValidatePhone;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    if-eqz p3, :cond_0

    .line 15
    const-string/jumbo v0, "voice"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/auth/AuthValidatePhone;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    :cond_0
    return-void
.end method
