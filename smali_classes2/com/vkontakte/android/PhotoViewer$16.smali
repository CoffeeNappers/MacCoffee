.class Lcom/vkontakte/android/PhotoViewer$16;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PhotoViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->deletePhoto()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 859
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$16;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 862
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.PHOTO_REMOVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 863
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "aid"

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$16;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/Photo;->albumID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 864
    const-string/jumbo v1, "pid"

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$16;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/Photo;->id:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 865
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$16;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 866
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$16;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {v1}, Lcom/vkontakte/android/PhotoViewer;->dismiss()V

    .line 867
    return-void
.end method
