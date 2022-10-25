.class public Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "WikiViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/WikiViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    const-class v0, Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 53
    return-void
.end method


# virtual methods
.method public setNid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
    .locals 2
    .param p1, "nid"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "nid"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 72
    return-object p0
.end method

.method public setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
    .locals 2
    .param p1, "oid"    # I

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "oid"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 62
    return-object p0
.end method

.method public setPid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
    .locals 2
    .param p1, "pid"    # I

    .prologue
    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "pid"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 67
    return-object p0
.end method

.method public setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
    .locals 2
    .param p1, "refer"    # Ljava/lang/String;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "refer"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    return-object p0
.end method

.method public setSection(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
    .locals 2
    .param p1, "section"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "section"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    return-object p0
.end method

.method public setSite(Z)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
    .locals 2
    .param p1, "site"    # Z

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "site"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 77
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    return-object p0
.end method
