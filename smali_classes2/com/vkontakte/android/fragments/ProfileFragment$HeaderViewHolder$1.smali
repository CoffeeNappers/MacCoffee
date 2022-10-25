.class Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    .prologue
    .line 3791
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 4

    .prologue
    .line 3794
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5900(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 3795
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->access$6100(Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v0

    new-instance v1, Lcom/vk/imageloader/transform/ProfileHeaderTransform;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->photoRect:Landroid/graphics/RectF;

    invoke-direct {v1, v2, v3}, Lcom/vk/imageloader/transform/ProfileHeaderTransform;-><init>(FLandroid/graphics/RectF;)V

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 3796
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->access$6100(Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getHeaderImageUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 3797
    const/4 v0, 0x1

    return v0
.end method
