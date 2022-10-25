.class Lcom/vk/stories/CreateAndEditStoryActivity$4;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$maskId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 338
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$4;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$4;->val$maskId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 341
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$4;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$4;->val$maskId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$700(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/String;)V

    .line 342
    return-void
.end method
