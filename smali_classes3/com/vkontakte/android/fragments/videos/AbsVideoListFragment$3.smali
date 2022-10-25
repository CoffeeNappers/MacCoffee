.class Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "AbsVideoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->deleteVideoFile(Lcom/vkontakte/android/api/VideoFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

.field final synthetic val$video:Lcom/vkontakte/android/api/VideoFile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 262
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$3;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$3;->val$video:Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 265
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$3;->this$0:Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$3;->val$video:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment$3;->val$video:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;->removeItem(II)V

    .line 266
    return-void
.end method
