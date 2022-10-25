.class final Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;
.super Ljava/lang/Object;
.source "SendActivity.java"

# interfaces
.implements Lcom/vkontakte/android/SendActivity$IntentHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UnsupportedIntentHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/SendActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/SendActivity;)V
    .locals 0

    .prologue
    .line 589
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/SendActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/SendActivity;
    .param p2, "x1"    # Lcom/vkontakte/android/SendActivity$1;

    .prologue
    .line 589
    invoke-direct {p0, p1}, Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;-><init>(Lcom/vkontakte/android/SendActivity;)V

    return-void
.end method


# virtual methods
.method public handle()Z
    .locals 3

    .prologue
    .line 593
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$UnsupportedIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    const v1, 0x7f080666

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 594
    const/4 v0, 0x1

    return v0
.end method

.method public onGotPhotoAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 2
    .param p1, "album"    # Lcom/vkontakte/android/api/PhotoAlbum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 604
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Unsupported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onGotRecipient(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 599
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Unsupported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
