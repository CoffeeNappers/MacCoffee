.class final Lcom/vkontakte/android/SendActivity$1SharedItem;
.super Ljava/lang/Object;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/SendActivity;->createStreamIntentHandler(Landroid/content/Intent;Lcom/vkontakte/android/UserProfile;)Lcom/vkontakte/android/SendActivity$IntentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SharedItem"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/SendActivity;

.field final type:I

.field final uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/SendActivity;ILandroid/net/Uri;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/SendActivity;
    .param p2, "type"    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "uri"    # Landroid/net/Uri;

    .prologue
    .line 463
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$1SharedItem;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 464
    iput p2, p0, Lcom/vkontakte/android/SendActivity$1SharedItem;->type:I

    .line 465
    iput-object p3, p0, Lcom/vkontakte/android/SendActivity$1SharedItem;->uri:Landroid/net/Uri;

    .line 466
    return-void
.end method
