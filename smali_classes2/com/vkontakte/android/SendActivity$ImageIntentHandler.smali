.class final Lcom/vkontakte/android/SendActivity$ImageIntentHandler;
.super Lcom/vkontakte/android/SendActivity$StreamIntentHandler;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ImageIntentHandler"
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
    .line 739
    .local p3, "streams":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    .line 740
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V

    .line 741
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
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 797
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 798
    .local v0, "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    iget-object v2, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->streams:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    .line 799
    .local v1, "stream":Landroid/net/Uri;
    new-instance v3, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 801
    .end local v1    # "stream":Landroid/net/Uri;
    :cond_0
    return-object v0
.end method


# virtual methods
.method createDialogOptions()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 755
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 756
    .local v0, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v2, 0x7f080661

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 757
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v2, 0x7f080662

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 758
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->streams:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0xa

    if-gt v1, v2, :cond_0

    .line 759
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v2, 0x7f080665

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 760
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v2, 0x7f080663

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 762
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1
.end method

.method createDialogTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 750
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-boolean v0, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->multiple:Z

    if-eqz v0, :cond_0

    const v0, 0x7f0806fc

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const v0, 0x7f0806fb

    goto :goto_0
.end method

.method handleOption(I)V
    .locals 3
    .param p1, "option"    # I

    .prologue
    .line 767
    packed-switch p1, :pswitch_data_0

    .line 781
    :goto_0
    return-void

    .line 769
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-static {v0}, Lcom/vkontakte/android/SendActivity;->access$900(Lcom/vkontakte/android/SendActivity;)V

    goto :goto_0

    .line 772
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->streams:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/vkontakte/android/SendActivity;->access$1000(Lcom/vkontakte/android/SendActivity;Ljava/util/List;)V

    goto :goto_0

    .line 775
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->text:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->createAttachments()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$600(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 778
    :pswitch_3
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-static {v0}, Lcom/vkontakte/android/SendActivity;->access$700(Lcom/vkontakte/android/SendActivity;)V

    goto :goto_0

    .line 767
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onGotPhotoAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 2
    .param p1, "album"    # Lcom/vkontakte/android/api/PhotoAlbum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 791
    invoke-super {p0, p1}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->onGotPhotoAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V

    .line 792
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->streams:Ljava/util/List;

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/SendActivity;->access$1100(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/api/PhotoAlbum;Ljava/util/List;)V

    .line 793
    return-void
.end method

.method public onGotRecipient(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 785
    invoke-super {p0, p1}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->onGotRecipient(Lcom/vkontakte/android/UserProfile;)V

    .line 786
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->text:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->createAttachments()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    .line 787
    return-void
.end method

.method onHandleDirectShare(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 745
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->text:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$ImageIntentHandler;->createAttachments()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    .line 746
    return-void
.end method
