.class Lcom/vk/stories/CreateAndEditStoryActivity$3;
.super Landroid/os/Handler;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p2, "x0"    # Landroid/os/Looper;

    .prologue
    .line 275
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$3;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x1

    .line 278
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_1

    .line 279
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$3;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$400(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/widget/ViewShower;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 291
    :cond_0
    :goto_0
    return-void

    .line 281
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v2, :cond_2

    .line 282
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$3;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/widget/ViewShower;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    goto :goto_0

    .line 284
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 285
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$3;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/widget/ViewShower;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/widget/ViewShower;->show()V

    goto :goto_0

    .line 287
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 288
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$3;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/widget/ViewShower;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    goto :goto_0
.end method
