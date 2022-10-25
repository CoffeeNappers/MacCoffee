.class Lcom/vk/stories/CreateAndEditStoryActivity$1;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


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
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$000(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$000(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const v2, 0x7f0806d5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/widget/LoadingDialog;->getInstance(Landroid/content/Context;Ljava/lang/Integer;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$002(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 178
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$000(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/app/Dialog;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$1$1;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$1$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$1;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 184
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$1;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$000(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 185
    return-void
.end method
