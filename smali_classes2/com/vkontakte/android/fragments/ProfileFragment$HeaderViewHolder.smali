.class Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;
.super Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeaderViewHolder"
.end annotation


# instance fields
.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 1
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 3783
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 3784
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 3785
    const v0, 0x7f1004ee

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 3786
    return-void
.end method

.method static synthetic access$6100(Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;)Lcom/vk/imageloader/view/VKImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;

    .prologue
    .line 3779
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    return-object v0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .prologue
    .line 3790
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    .line 3791
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6200(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 3800
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3779
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    return-void
.end method
