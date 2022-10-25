.class Lcom/vkontakte/android/activities/VideoPlayerActivity$12;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->createUI(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

.field final synthetic val$file:Lcom/vkontakte/android/api/VideoFile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 340
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$12;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iput-object p2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$12;->val$file:Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$12;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$12;->val$file:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$12;->val$file:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/utils/VKLiveUtils;->goToTranslation(Landroid/content/Context;II)V

    .line 344
    return-void
.end method
