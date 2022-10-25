.class final Lcom/vkontakte/android/SendActivity$1SharedItems;
.super Ljava/util/ArrayList;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/SendActivity;->createStreamIntentHandler(Landroid/content/Intent;Lcom/vkontakte/android/UserProfile;)Lcom/vkontakte/android/SendActivity$IntentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SharedItems"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/SendActivity$1SharedItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/SendActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/SendActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/SendActivity;

    .prologue
    .line 469
    iput-object p1, p0, Lcom/vkontakte/android/SendActivity$1SharedItems;->this$0:Lcom/vkontakte/android/SendActivity;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/SendActivity$1SharedItems;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity$1SharedItems;

    .prologue
    .line 469
    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$1SharedItems;->getType()I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/SendActivity$1SharedItems;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/SendActivity$1SharedItems;

    .prologue
    .line 469
    invoke-direct {p0}, Lcom/vkontakte/android/SendActivity$1SharedItems;->getUris()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private getType()I
    .locals 4

    .prologue
    .line 473
    const/4 v1, 0x0

    .line 474
    .local v1, "type":I
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity$1SharedItems;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v1

    .line 486
    :goto_0
    return v2

    .line 478
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity$1SharedItems;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/SendActivity$1SharedItem;

    .line 479
    .local v0, "sharedItem":Lcom/vkontakte/android/SendActivity$1SharedItem;
    if-nez v1, :cond_2

    .line 480
    iget v1, v0, Lcom/vkontakte/android/SendActivity$1SharedItem;->type:I

    goto :goto_1

    .line 481
    :cond_2
    iget v3, v0, Lcom/vkontakte/android/SendActivity$1SharedItem;->type:I

    if-eq v1, v3, :cond_1

    .line 482
    const/4 v2, 0x4

    goto :goto_0

    .end local v0    # "sharedItem":Lcom/vkontakte/android/SendActivity$1SharedItem;
    :cond_3
    move v2, v1

    .line 486
    goto :goto_0
.end method

.method private getUris()Ljava/util/List;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 491
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 492
    .local v1, "uris":Ljava/util/List;, "Ljava/util/List<Landroid/net/Uri;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/SendActivity$1SharedItems;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/SendActivity$1SharedItem;

    .line 493
    .local v0, "sharedItem":Lcom/vkontakte/android/SendActivity$1SharedItem;
    iget-object v3, v0, Lcom/vkontakte/android/SendActivity$1SharedItem;->uri:Landroid/net/Uri;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 495
    .end local v0    # "sharedItem":Lcom/vkontakte/android/SendActivity$1SharedItem;
    :cond_0
    return-object v1
.end method
