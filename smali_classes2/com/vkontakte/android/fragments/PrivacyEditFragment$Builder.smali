.class public Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "PrivacyEditFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PrivacyEditFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field static final KEY_SETTING:Ljava/lang/String; = "setting"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    const-class v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 64
    return-void
.end method


# virtual methods
.method public setSetting(Lcom/vkontakte/android/data/PrivacySetting;)Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;
    .locals 3
    .param p1, "setting"    # Lcom/vkontakte/android/data/PrivacySetting;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "setting"

    new-instance v2, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-direct {v2, p1}, Lcom/vkontakte/android/data/PrivacySetting;-><init>(Lcom/vkontakte/android/data/PrivacySetting;)V

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 68
    return-object p0
.end method
