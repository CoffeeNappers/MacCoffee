.class public Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "WebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/WebViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 63
    const-class v0, Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    return-void
.end method


# virtual methods
.method public openInternally()Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
    .locals 3

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "open_internally"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 69
    return-object p0
.end method

.method public setAppId(I)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
    .locals 2
    .param p1, "appId"    # I

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "appID"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 94
    return-object p0
.end method

.method public setAppReport(Z)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
    .locals 2
    .param p1, "appReport"    # Z

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "app_report"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 84
    return-object p0
.end method

.method public setOwnerId(I)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
    .locals 2
    .param p1, "ownerId"    # I

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ownerID"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 89
    return-object p0
.end method

.method public setScreenTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
    .locals 2
    .param p1, "screenTitle"    # Ljava/lang/String;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "screen_title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    return-object p0
.end method

.method public setTheme(I)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
    .locals 2
    .param p1, "themeResId"    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "theme"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 99
    return-object p0
.end method

.method public setUrlToCopy(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
    .locals 2
    .param p1, "urlToCopy"    # Ljava/lang/String;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "url_to_copy"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    return-object p0
.end method
