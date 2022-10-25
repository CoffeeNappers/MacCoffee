.class Lcom/vk/stories/CreateAndEditStoryActivity$97;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->trackDraw(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$isFinal:Z


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 3159
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$97;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-boolean p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$97;->val$isFinal:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 3162
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$97;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/EditorAnalytics;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$97;->val$isFinal:Z

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/EditorAnalytics;->logDraw(Z)V

    .line 3163
    return-void
.end method
