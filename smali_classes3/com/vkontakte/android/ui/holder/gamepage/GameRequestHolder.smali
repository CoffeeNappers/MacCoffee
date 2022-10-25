.class public Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;
.super Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
.source "GameRequestHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "drawable"    # Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "drawable"    # Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    .param p4, "layoutRes"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;I)V

    .line 26
    return-void
.end method

.method public static openGame(Lcom/vkontakte/android/data/GameRequest;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p0, "request"    # Lcom/vkontakte/android/data/GameRequest;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "visitSource"    # Ljava/lang/String;

    .prologue
    .line 40
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 41
    .local v1, "extras":Landroid/os/Bundle;
    const-string/jumbo v0, "key"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->key:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    const-string/jumbo v0, "name"

    iget-object v2, p0, Lcom/vkontakte/android/data/GameRequest;->name:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    const-string/jumbo v0, "request"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    const-string/jumbo v2, "request"

    invoke-static {v0, v1, p1, p2, v2}, Lcom/vkontakte/android/data/Games;->open(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    :goto_0
    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/GameRequest;->appPackage:Ljava/lang/String;

    iget v3, p0, Lcom/vkontakte/android/data/GameRequest;->appId:I

    const-string/jumbo v5, "request"

    move-object v2, p1

    move-object v4, p2

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/data/Games;->openInstallableGame(Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public onClick()V
    .locals 3

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->visitSource:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->openGame(Lcom/vkontakte/android/data/GameRequest;Landroid/app/Activity;Ljava/lang/String;)V

    .line 31
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    invoke-static {v1, v0}, Lcom/vkontakte/android/data/Games;->deleteRequest(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V

    .line 32
    return-void
.end method

.method protected onPlayButtonClick()V
    .locals 3

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->visitSource:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->openGame(Lcom/vkontakte/android/data/GameRequest;Landroid/app/Activity;Ljava/lang/String;)V

    .line 37
    return-void
.end method
