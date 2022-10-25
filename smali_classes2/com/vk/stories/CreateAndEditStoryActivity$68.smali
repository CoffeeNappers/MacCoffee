.class Lcom/vk/stories/CreateAndEditStoryActivity$68;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initDrawingUi()V
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
    .line 1987
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$68;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1990
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$68;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6300(Lcom/vk/stories/CreateAndEditStoryActivity;I)V

    .line 1991
    return-void
.end method
