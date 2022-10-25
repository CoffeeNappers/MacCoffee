.class Lcom/vk/stories/StoryViewDialog$4;
.super Lcom/vk/core/widget/LifecycleListener;
.source "StoryViewDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/StoryViewDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/StoryViewDialog;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoryViewDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 274
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 298
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 299
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onDestroy()V

    .line 301
    :cond_0
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 291
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 292
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onPause()V

    .line 294
    :cond_0
    return-void
.end method

.method public onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V
    .locals 1
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "requestCode"    # I
    .param p3, "resultCode"    # I
    .param p4, "data"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 277
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 278
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    invoke-virtual {v0, p2, p3, p4}, Lcom/vk/stories/view/StoryViewContainer;->onActivityResult(IILandroid/content/Intent;)V

    .line 280
    :cond_0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 284
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$4;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$100(Lcom/vk/stories/StoryViewDialog;)Lcom/vk/stories/view/StoryViewContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->onResume()V

    .line 287
    :cond_0
    return-void
.end method
