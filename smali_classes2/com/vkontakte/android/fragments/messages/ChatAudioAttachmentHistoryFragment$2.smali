.class Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ChatAudioAttachmentHistoryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->doLoadData(II)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 92
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 93
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
    .line 85
    .local p1, "res":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-static {p1}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments;->nextFrom(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->access$102(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 87
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, p1, v0}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment;Ljava/util/List;Z)V

    .line 88
    return-void

    .line 87
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 82
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatAudioAttachmentHistoryFragment$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
