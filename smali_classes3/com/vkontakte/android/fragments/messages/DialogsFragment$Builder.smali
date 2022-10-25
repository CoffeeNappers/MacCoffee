.class public Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "DialogsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/DialogsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    const-class v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 66
    return-void
.end method


# virtual methods
.method public setSelectMode()Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;
    .locals 3

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "select"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 70
    return-object p0
.end method
