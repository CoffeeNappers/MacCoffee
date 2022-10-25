.class Lcom/vk/stories/CreateAndEditStoryActivity$6$1;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$6;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$6;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$6;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$6;

    .prologue
    .line 446
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$6$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 449
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$6$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$6;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$6;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$800(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 450
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$6$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$6;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$6;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$900(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 451
    return-void
.end method
