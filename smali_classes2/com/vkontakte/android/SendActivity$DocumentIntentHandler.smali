.class final Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;
.super Lcom/vkontakte/android/SendActivity$StreamIntentHandler;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DocumentIntentHandler"
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
    .line 918
    .local p3, "streams":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    .line 919
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V

    .line 920
    return-void
.end method

.method private createAttachments()Ljava/util/List;
    .locals 11
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/PendingDocumentAttachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 957
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 958
    .local v8, "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/PendingDocumentAttachment;>;"
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->streams:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/net/Uri;

    .line 959
    .local v9, "stream":Landroid/net/Uri;
    invoke-virtual {v9}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    .line 960
    .local v2, "uri":Ljava/lang/String;
    new-instance v0, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    .line 962
    invoke-static {v9}, Lcom/vkontakte/android/upload/UploadUtils;->resolveName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/io/File;

    .line 964
    invoke-static {v9}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v4

    long-to-int v3, v4

    const/4 v5, 0x0

    .line 967
    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v6

    .line 968
    invoke-static {v9}, Lcom/vkontakte/android/upload/UploadUtils;->resolveExtension(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    move-object v4, v2

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;)V

    .line 960
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 972
    .end local v2    # "uri":Ljava/lang/String;
    .end local v9    # "stream":Landroid/net/Uri;
    :cond_0
    return-object v8
.end method


# virtual methods
.method createDialogOptions()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 934
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v3, 0x7f080662

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v3, 0x7f080663

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method createDialogTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 929
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-boolean v0, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->multiple:Z

    if-eqz v0, :cond_0

    const v0, 0x7f0806fa

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const v0, 0x7f0806f9

    goto :goto_0
.end method

.method handleOption(I)V
    .locals 2
    .param p1, "option"    # I

    .prologue
    .line 939
    packed-switch p1, :pswitch_data_0

    .line 947
    :goto_0
    return-void

    .line 941
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->streams:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/vkontakte/android/SendActivity;->access$1000(Lcom/vkontakte/android/SendActivity;Ljava/util/List;)V

    goto :goto_0

    .line 944
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-static {v0}, Lcom/vkontakte/android/SendActivity;->access$700(Lcom/vkontakte/android/SendActivity;)V

    goto :goto_0

    .line 939
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onGotRecipient(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 951
    invoke-super {p0, p1}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->onGotRecipient(Lcom/vkontakte/android/UserProfile;)V

    .line 952
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->text:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->createAttachments()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    .line 953
    return-void
.end method

.method onHandleDirectShare(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 924
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->text:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$DocumentIntentHandler;->createAttachments()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    .line 925
    return-void
.end method
