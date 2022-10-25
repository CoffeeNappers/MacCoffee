.class Lcom/vkontakte/android/LinkRedirActivity$10;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 1253
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$10;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iput-object p2, p0, Lcom/vkontakte/android/LinkRedirActivity$10;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1270
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$10;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1271
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$10;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$10;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 1272
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1253
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$10;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1257
    .local p1, "res":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$10;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1258
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$10;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1259
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 1260
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$10;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const v2, 0x7f080516

    invoke-static {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->access$200(Lcom/vkontakte/android/LinkRedirActivity;I)V

    .line 1266
    :goto_0
    return-void

    .line 1263
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 1264
    .local v0, "af":Lcom/vkontakte/android/audio/MusicTrack;
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/AudioFacade;->playTrack(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    .line 1265
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->showPlayer()V

    goto :goto_0
.end method
