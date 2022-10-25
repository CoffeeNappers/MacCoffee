.class Lcom/vk/stories/CreateAndEditStoryActivity$40;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$moreInfoUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 1349
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$40;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$40;->val$moreInfoUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1352
    new-instance v0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$40;->val$moreInfoUrl:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$40;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1353
    return-void
.end method
