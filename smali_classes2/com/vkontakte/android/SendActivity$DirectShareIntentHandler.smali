.class abstract Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;
.super Ljava/lang/Object;
.source "SendActivity.java"

# interfaces
.implements Lcom/vkontakte/android/SendActivity$IntentHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "DirectShareIntentHandler"
.end annotation


# instance fields
.field private recipient:Lcom/vkontakte/android/UserProfile;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/SendActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/SendActivity;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1    # Lcom/vkontakte/android/SendActivity;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "recipient"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 613
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 614
    iput-object p2, p0, Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;->recipient:Lcom/vkontakte/android/UserProfile;

    .line 615
    return-void
.end method


# virtual methods
.method public final handle()Z
    .locals 1

    .prologue
    .line 619
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;->recipient:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    .line 620
    iget-object v0, p0, Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;->recipient:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;->onHandleDirectShare(Lcom/vkontakte/android/UserProfile;)V

    .line 621
    const/4 v0, 0x1

    .line 624
    :goto_0
    return v0

    .line 623
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity$DirectShareIntentHandler;->onHandle()V

    .line 624
    const/4 v0, 0x0

    goto :goto_0
.end method

.method abstract onHandle()V
.end method

.method abstract onHandleDirectShare(Lcom/vkontakte/android/UserProfile;)V
    .param p1    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
