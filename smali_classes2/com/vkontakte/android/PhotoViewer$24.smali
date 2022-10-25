.class Lcom/vkontakte/android/PhotoViewer$24;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PhotoViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;

.field final synthetic val$album:Lcom/vkontakte/android/api/PhotoAlbum;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Landroid/content/Context;Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1128
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iput-object p3, p0, Lcom/vkontakte/android/PhotoViewer$24;->val$album:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 4

    .prologue
    .line 1131
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.PHOTO_REMOVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1132
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "aid"

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/Photo;->albumID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1133
    const-string/jumbo v1, "pid"

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/Photo;->id:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1134
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1135
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$24;->val$album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    iput v2, v1, Lcom/vkontakte/android/Photo;->albumID:I

    .line 1136
    new-instance v0, Landroid/content/Intent;

    .end local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v1, "com.vkontakte.android.PHOTO_ADDED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1137
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v1, "aid"

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/Photo;->albumID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1138
    const-string/jumbo v1, "photo"

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1139
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1140
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {v1}, Lcom/vkontakte/android/PhotoViewer;->dismiss()V

    .line 1141
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$24;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0804a8

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1142
    return-void
.end method
