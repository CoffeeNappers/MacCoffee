.class Lcom/vk/stories/CreateAndEditStoryActivity$25;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initCameraViewPart()V
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
    .line 1020
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$25;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1023
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$25;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const-class v2, Lcom/vk/stories/StorySettingsActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1024
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "from_create_story"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1025
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$25;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1026
    return-void
.end method
