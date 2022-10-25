.class Lcom/vkontakte/android/fragments/AudioListFragment$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "AudioListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/AudioListFragment;->search(Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

.field final synthetic val$query:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;Landroid/app/Fragment;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 494
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$4;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/AudioListFragment$4;->val$query:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 503
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$4;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1202(Lcom/vkontakte/android/fragments/AudioListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 504
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$4;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1400(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$4;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/AudioListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 508
    :cond_0
    :goto_0
    return-void

    .line 507
    :cond_1
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
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
    .line 497
    .local p1, "files":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$4;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1202(Lcom/vkontakte/android/fragments/AudioListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 498
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$4;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$4;->val$query:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1300(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;Ljava/util/List;)V

    .line 499
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 494
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$4;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
