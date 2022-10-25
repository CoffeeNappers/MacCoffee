.class Lcom/vkontakte/android/PhotoViewer$20;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PhotoViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->makeCover()V
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
    .line 944
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$20;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 10

    .prologue
    const/16 v4, 0x6d

    const/4 v9, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    .line 947
    const/16 v2, 0x70

    .line 948
    .local v2, "needSize":C
    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v5, 0x3fc00000    # 1.5f

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_0

    .line 949
    const/16 v2, 0x71

    .line 951
    :cond_0
    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v3, v3, v8

    if-ltz v3, :cond_1

    .line 952
    const/16 v2, 0x72

    .line 954
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer$20;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v3}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v5

    const/4 v3, 0x3

    new-array v6, v3, [C

    aput-char v2, v6, v9

    const/4 v7, 0x1

    sget v3, Lcom/vkontakte/android/Global;->displayDensity:F

    cmpl-float v3, v3, v8

    if-ltz v3, :cond_2

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isHighSpeed()Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x78

    :goto_0
    aput-char v3, v6, v7

    const/4 v3, 0x2

    aput-char v4, v6, v3

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/Photo;->getImage([C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v3

    iget-object v0, v3, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 955
    .local v0, "cover":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer$20;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v3}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0800c5

    invoke-static {v3, v4, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 956
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.UPDATE_ALBUM_COVER"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 957
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "aid"

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer$20;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v4}, Lcom/vkontakte/android/PhotoViewer;->access$000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/Photo;

    move-result-object v4

    iget v4, v4, Lcom/vkontakte/android/Photo;->albumID:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 958
    const-string/jumbo v3, "new_cover_url"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 959
    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer$20;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v3}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v3

    const-string/jumbo v4, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v3, v1, v4}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 960
    return-void

    .end local v0    # "cover":Ljava/lang/String;
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_2
    move v3, v4

    .line 954
    goto :goto_0
.end method
