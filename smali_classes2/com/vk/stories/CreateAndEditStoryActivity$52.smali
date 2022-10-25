.class Lcom/vk/stories/CreateAndEditStoryActivity$52;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->showMaskAuthor(Lcom/vk/masks/model/Mask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$mask:Lcom/vk/masks/model/Mask;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 1634
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$52;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$52;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1637
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$52;->val$mask:Lcom/vk/masks/model/Mask;

    iget v1, v1, Lcom/vk/masks/model/Mask;->ownerId:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$52;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1638
    return-void
.end method
