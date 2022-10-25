.class abstract Lcom/vkontakte/android/SendActivity$StreamIntentHandler;
.super Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "StreamIntentHandler"
.end annotation


# instance fields
.field final multiple:Z

.field final streams:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field final text:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/SendActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/SendActivity;Ljava/lang/String;Ljava/util/List;Lcom/vkontakte/android/UserProfile;)V
    .locals 2
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
    .local p3, "streams":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    const/4 v0, 0x1

    .line 706
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    .line 707
    invoke-direct {p0, p1, p4}, Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;)V

    .line 708
    iput-object p2, p0, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->text:Ljava/lang/String;

    .line 709
    iput-object p3, p0, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->streams:Ljava/util/List;

    .line 710
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->multiple:Z

    .line 711
    return-void

    .line 710
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method abstract createDialogOptions()[Ljava/lang/String;
.end method

.method abstract createDialogTitle()Ljava/lang/String;
.end method

.method abstract handleOption(I)V
.end method

.method synthetic lambda$onHandle$0(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 717
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->handleOption(I)V

    return-void
.end method

.method synthetic lambda$onHandle$1(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 718
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/SendActivity;->finish()V

    return-void
.end method

.method public onGotPhotoAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 0
    .param p1, "album"    # Lcom/vkontakte/android/api/PhotoAlbum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 728
    return-void
.end method

.method public onGotRecipient(Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "recipient"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 724
    return-void
.end method

.method onHandle()V
    .locals 3

    .prologue
    .line 715
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 716
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->createDialogTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 717
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler;->createDialogOptions()[Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/SendActivity$StreamIntentHandler;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/SendActivity$StreamIntentHandler$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/SendActivity$StreamIntentHandler;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v1

    .line 718
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 719
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 720
    return-void
.end method
