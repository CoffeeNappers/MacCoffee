.class Lcom/vkontakte/android/PhotoViewer$21$3;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer$21;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/PhotoViewer$21;

.field final synthetic val$error:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer$21;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/PhotoViewer$21;

    .prologue
    .line 1015
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$21$3;->this$1:Lcom/vkontakte/android/PhotoViewer$21;

    iput-object p2, p0, Lcom/vkontakte/android/PhotoViewer$21$3;->val$error:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1017
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21$3;->val$error:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$21$3;->this$1:Lcom/vkontakte/android/PhotoViewer$21;

    iget-object v1, v1, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->showToast(Landroid/content/Context;)V

    .line 1018
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21$3;->this$1:Lcom/vkontakte/android/PhotoViewer$21;

    iget-object v0, v0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$21$3;->this$1:Lcom/vkontakte/android/PhotoViewer$21;

    iget-object v1, v1, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget v1, v1, Lcom/vkontakte/android/PhotoViewer;->curPos:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V

    .line 1019
    return-void
.end method
