.class Lcom/vkontakte/android/fragments/AudioListFragment$3;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "AudioListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/AudioListFragment;->doLoadData(II)V
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


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AudioListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 301
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$3;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 310
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$3;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$702(Lcom/vkontakte/android/fragments/AudioListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 311
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 312
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
    .line 304
    .local p1, "files":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$3;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$502(Lcom/vkontakte/android/fragments/AudioListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 305
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$3;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$600(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/util/List;)V

    .line 306
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 301
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment$3;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
