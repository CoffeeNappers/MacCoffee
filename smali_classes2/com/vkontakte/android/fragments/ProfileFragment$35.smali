.class Lcom/vkontakte/android/fragments/ProfileFragment$35;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->loadPlaylistAndPlay(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 3445
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$35;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 3457
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$35;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5302(Lcom/vkontakte/android/fragments/ProfileFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 3458
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 3459
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->stop()V

    .line 3460
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3448
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$35;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5302(Lcom/vkontakte/android/fragments/ProfileFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 3449
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$35;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5402(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 3450
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$35;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5400(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 3451
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$35;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$35;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5500(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5600(Lcom/vkontakte/android/fragments/ProfileFragment;I)V

    .line 3452
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$35;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5502(Lcom/vkontakte/android/fragments/ProfileFragment;I)I

    .line 3453
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3445
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$35;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
