.class public Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "AuthCheckFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/AuthCheckFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field public static final AUTH_STATE:Ljava/lang/String; = "auth_state"

.field private static final CODE:Ljava/lang/String; = "code"

.field private static final IS_LIBVERIFY:Ljava/lang/String; = "is_libverify"

.field private static final IS_SMS:Ljava/lang/String; = "is_sms"

.field private static final LIBVERIFY_PHONE:Ljava/lang/String; = "libverify_phone"

.field private static final PHONE:Ljava/lang/String; = "phone"

.field private static final PHONE_MASK:Ljava/lang/String; = "phoneMask"

.field private static final SID:Ljava/lang/String; = "sid"

.field private static final VALIDATE_PHONE_ON_START:Ljava/lang/String; = "validate_phone_on_start"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2
    .param p1, "phone"    # Ljava/lang/String;
    .param p2, "phoneMask"    # Ljava/lang/String;
    .param p3, "isSms"    # Z
    .param p4, "sid"    # Ljava/lang/String;

    .prologue
    .line 72
    const-class v0, Lcom/vkontakte/android/fragments/AuthCheckFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "phone"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "phoneMask"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "is_sms"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "sid"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    return-void
.end method


# virtual methods
.method public setCode(Ljava/lang/String;)Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;
    .locals 2
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "code"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    return-object p0
.end method

.method public setIsLibverify(Ljava/lang/String;)Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;
    .locals 3
    .param p1, "phone"    # Ljava/lang/String;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "is_libverify"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "libverify_phone"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    return-object p0
.end method

.method public setLoginHelper(Lcom/vkontakte/android/auth/VKAuthState;)Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;
    .locals 2
    .param p1, "helper"    # Lcom/vkontakte/android/auth/VKAuthState;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "auth_state"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 91
    return-object p0
.end method

.method public validatePhoneOnStart()Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;
    .locals 3

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AuthCheckFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "validate_phone_on_start"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 81
    return-object p0
.end method
