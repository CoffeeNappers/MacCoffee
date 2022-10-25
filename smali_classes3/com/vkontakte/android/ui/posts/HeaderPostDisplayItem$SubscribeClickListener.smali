.class Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;
.super Ljava/lang/Object;
.source "HeaderPostDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SubscribeClickListener"
.end annotation


# instance fields
.field final clickLock:Lcom/vk/core/util/TimeoutLock;

.field final showSubscribe:Lcom/vkontakte/android/functions/F0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field final showUnSubscribe:Lcom/vkontakte/android/functions/F0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field subscribeButton:Landroid/view/View;

.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

.field unSubscribeButton:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;)V
    .locals 4

    .prologue
    .line 391
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 395
    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;)Lcom/vkontakte/android/functions/F0;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->showUnSubscribe:Lcom/vkontakte/android/functions/F0;

    .line 401
    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;)Lcom/vkontakte/android/functions/F0;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->showSubscribe:Lcom/vkontakte/android/functions/F0;

    .line 407
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->clickLock:Lcom/vk/core/util/TimeoutLock;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;

    .prologue
    .line 391
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$new$0()Ljava/lang/Void;
    .locals 2

    .prologue
    .line 396
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->subscribeButton:Landroid/view/View;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 397
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->unSubscribeButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 398
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$new$1()Ljava/lang/Void;
    .locals 2

    .prologue
    .line 402
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->unSubscribeButton:Landroid/view/View;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 403
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->subscribeButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 404
    const/4 v0, 0x0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 411
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->clickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-nez v0, :cond_0

    .line 412
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->clickLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 413
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 414
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-lez v0, :cond_1

    .line 415
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v2, v2, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->showUnSubscribe:Lcom/vkontakte/android/functions/F0;

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->access$200(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V

    .line 423
    :cond_0
    :goto_0
    return-void

    .line 417
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v2, v2, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v2, v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->showUnSubscribe:Lcom/vkontakte/android/functions/F0;

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->access$300(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/content/Context;ILcom/vkontakte/android/functions/F0;)V

    goto :goto_0

    .line 420
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->this$0:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->showSubscribe:Lcom/vkontakte/android/functions/F0;

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->access$400(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;Landroid/view/View;Lcom/vkontakte/android/functions/F0;)V

    goto :goto_0
.end method
