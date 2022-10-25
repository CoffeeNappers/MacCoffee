.class Lcom/vk/stories/CreateAndEditStoryActivity$2;
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
    .line 191
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$2;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$2;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$100(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    move-result-object v0

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v0, v1, :cond_0

    .line 195
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$2;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$200(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 196
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$2;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$300(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 198
    :cond_0
    return-void
.end method
