.class Lcom/vk/stories/CreateAndEditStoryActivity$35;
.super Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
.source "CreateAndEditStoryActivity.java"


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
    .line 1269
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$35;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 1272
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$35;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$35;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksPagerAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vk/masks/MasksPagerAdapter;->getSection(I)Lcom/vk/masks/model/MaskSection;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3800(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/MaskSection;)V

    .line 1273
    return-void
.end method
