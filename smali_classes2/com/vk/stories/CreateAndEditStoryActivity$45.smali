.class Lcom/vk/stories/CreateAndEditStoryActivity$45;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onMaskSelected(ILcom/vk/masks/model/Mask;)V
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
    .line 1394
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$45;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1397
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$45;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4502(Lcom/vk/stories/CreateAndEditStoryActivity;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1398
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$45;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1399
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$45;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const-wide/16 v2, 0x0

    invoke-static {v0, v2, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4300(Lcom/vk/stories/CreateAndEditStoryActivity;J)V

    .line 1400
    return-void
.end method
