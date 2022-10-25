.class Lcom/vk/stories/CreateAndEditStoryActivity$77$3;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$77;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$77;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$77;

    .prologue
    .line 2283
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 2286
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2600(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2287
    return-void
.end method
