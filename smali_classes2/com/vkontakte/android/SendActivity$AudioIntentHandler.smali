.class final Lcom/vkontakte/android/SendActivity$AudioIntentHandler;
.super Lcom/vkontakte/android/SendActivity$StreamIntentHandler;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AudioIntentHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/SendActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1    # Lcom/vkontakte/android/SendActivity;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "recipient"    # Lcom/vkontakte/android/UserProfile;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Lcom/vkontakte/android/UserProfile;",
            ")V"
        }
    .end annotation

    .prologue
    .line 807
    .local p3, "streams":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    .line 808
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V

    .line 809
    return-void
.end method

.method private createAttachments()Ljava/util/List;
    .locals 5
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/AudioAttachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 851
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 852
    .local v0, "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/AudioAttachment;>;"
    iget-object v3, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->streams:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    .line 853
    .local v2, "stream":Landroid/net/Uri;
    new-instance v1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {v1}, Lcom/vkontakte/android/audio/MusicTrack;-><init>()V

    .line 854
    .local v1, "mt":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    .line 855
    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v4

    iput v4, v1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 856
    iget-object v4, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-static {v4, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$1200(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/audio/MusicTrack;Landroid/net/Uri;)V

    .line 857
    new-instance v4, Lcom/vkontakte/android/attachments/PendingAudioAttachment;

    invoke-direct {v4, v1}, Lcom/vkontakte/android/attachments/PendingAudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 859
    .end local v1    # "mt":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v2    # "stream":Landroid/net/Uri;
    :cond_0
    return-object v0
.end method


# virtual methods
.method createDialogOptions()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 823
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v3, 0x7f080665

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v3, 0x7f080663

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method createDialogTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 818
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-boolean v0, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->multiple:Z

    if-eqz v0, :cond_0

    const v0, 0x7f0806f8

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const v0, 0x7f0806f7

    goto :goto_0
.end method

.method handleOption(I)V
    .locals 3
    .param p1, "option"    # I

    .prologue
    .line 828
    packed-switch p1, :pswitch_data_0

    .line 836
    :goto_0
    return-void

    .line 830
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->text:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->createAttachments()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$600(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 833
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-static {v0}, Lcom/vkontakte/android/SendActivity;->access$700(Lcom/vkontakte/android/SendActivity;)V

    goto :goto_0

    .line 828
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onGotPhotoAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 2
    .param p1, "album"    # Lcom/vkontakte/android/api/PhotoAlbum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 846
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Unsupported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onGotRecipient(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 840
    invoke-super {p0, p1}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->onGotRecipient(Lcom/vkontakte/android/UserProfile;)V

    .line 841
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->text:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->createAttachments()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    .line 842
    return-void
.end method

.method onHandleDirectShare(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 813
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->text:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$AudioIntentHandler;->createAttachments()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    .line 814
    return-void
.end method
