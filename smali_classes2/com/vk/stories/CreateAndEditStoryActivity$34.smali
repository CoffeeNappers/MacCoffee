.class Lcom/vk/stories/CreateAndEditStoryActivity$34;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initMasksUIPart()V
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
    .line 1251
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$34;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1254
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$34;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3600(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 1255
    return-void
.end method
