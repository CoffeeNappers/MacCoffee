.class final Lcom/vkontakte/android/SendActivity$TextIntentHandler;
.super Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "TextIntentHandler"
.end annotation


# instance fields
.field private final attachment:Lcom/vkontakte/android/attachments/Attachment;

.field private final dialogTitle:Ljava/lang/String;

.field private final postTitle:Ljava/lang/String;

.field private final text:Ljava/lang/String;

.field final synthetic this$0:Lcom/vkontakte/android/SendActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1    # Lcom/vkontakte/android/SendActivity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "subject"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "recipient"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 641
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    .line 642
    invoke-direct {p0, p1, p4}, Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;)V

    .line 643
    iput-object p2, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->text:Ljava/lang/String;

    .line 644
    invoke-static {p2}, Lcom/vkontakte/android/LinkParser;->isLink(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 645
    const v0, 0x7f0806fd

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->dialogTitle:Ljava/lang/String;

    .line 646
    if-eqz p3, :cond_0

    .end local p3    # "subject":Ljava/lang/String;
    :goto_0
    iput-object p3, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->postTitle:Ljava/lang/String;

    .line 647
    new-instance v0, Lcom/vkontakte/android/attachments/LinkAttachment;

    const-string/jumbo v1, ""

    const-string/jumbo v2, ""

    invoke-direct {v0, p2, v1, v2}, Lcom/vkontakte/android/attachments/LinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->attachment:Lcom/vkontakte/android/attachments/Attachment;

    .line 653
    :goto_1
    return-void

    .line 646
    .restart local p3    # "subject":Ljava/lang/String;
    :cond_0
    const-string/jumbo p3, ""

    goto :goto_0

    .line 649
    :cond_1
    const v0, 0x7f0806fe

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->dialogTitle:Ljava/lang/String;

    .line 650
    iput-object p2, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->postTitle:Ljava/lang/String;

    .line 651
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->attachment:Lcom/vkontakte/android/attachments/Attachment;

    goto :goto_1
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/SendActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lcom/vkontakte/android/UserProfile;
    .param p5, "x4"    # Lcom/vkontakte/android/SendActivity$1;

    .prologue
    .line 633
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/SendActivity$TextIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onHandle$0(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 671
    packed-switch p2, :pswitch_data_0

    .line 682
    :goto_0
    return-void

    .line 673
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->postTitle:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->attachment:Lcom/vkontakte/android/attachments/Attachment;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$600(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 676
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-static {v0}, Lcom/vkontakte/android/SendActivity;->access$700(Lcom/vkontakte/android/SendActivity;)V

    goto :goto_0

    .line 679
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->text:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/SendActivity;->access$800(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 671
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method synthetic lambda$onHandle$1(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 683
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/SendActivity;->finish()V

    return-void
.end method

.method public onGotPhotoAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 2
    .param p1, "album"    # Lcom/vkontakte/android/api/PhotoAlbum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 694
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
    .line 689
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->text:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    .line 690
    return-void
.end method

.method onHandle()V
    .locals 8

    .prologue
    const v7, 0x7f080665

    const v6, 0x7f080663

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 663
    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "_internal"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 664
    const/4 v1, 0x3

    new-array v0, v1, [Ljava/lang/String;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v1, v7}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v2, 0x7f08065a

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    .line 668
    .local v0, "items":[Ljava/lang/String;
    :goto_0
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->dialogTitle:Ljava/lang/String;

    .line 669
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/SendActivity$TextIntentHandler$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/SendActivity$TextIntentHandler;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 670
    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/SendActivity$TextIntentHandler$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/SendActivity$TextIntentHandler;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v2

    .line 683
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 684
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 685
    return-void

    .line 666
    .end local v0    # "items":[Ljava/lang/String;
    :cond_0
    new-array v0, v5, [Ljava/lang/String;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v1, v7}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v1, v6}, Lcom/vkontakte/android/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    .restart local v0    # "items":[Ljava/lang/String;
    goto :goto_0
.end method

.method onHandleDirectShare(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 657
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$TextIntentHandler;->text:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2}, Lcom/vkontakte/android/SendActivity;->access$500(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/util/List;)V

    .line 658
    return-void
.end method
