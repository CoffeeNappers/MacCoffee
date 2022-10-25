.class public Lcom/vkontakte/android/fragments/SignupPhoneFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "SignupPhoneFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SignupPhoneFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 51
    const-class v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "show_toolbar"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 53
    return-void
.end method
