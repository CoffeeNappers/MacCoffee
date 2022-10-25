.class final Lcom/vkontakte/android/data/Posts$5;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "Posts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Posts;->toggleFixed(Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Landroid/app/Activity;

.field final synthetic val$post:Lcom/vkontakte/android/NewsEntry;

.field final synthetic val$runAfter:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 610
    iput-object p2, p0, Lcom/vkontakte/android/data/Posts$5;->val$post:Lcom/vkontakte/android/NewsEntry;

    iput-object p3, p0, Lcom/vkontakte/android/data/Posts$5;->val$act:Landroid/app/Activity;

    iput-object p4, p0, Lcom/vkontakte/android/data/Posts$5;->val$runAfter:Ljava/lang/Runnable;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 613
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 614
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "com.vkontakte.android.RELOAD_PROFILE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 615
    const-string/jumbo v1, "id"

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$5;->val$post:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 616
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$5;->val$act:Landroid/app/Activity;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 617
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$5;->val$runAfter:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 618
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$5;->val$runAfter:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 620
    :cond_0
    return-void
.end method
