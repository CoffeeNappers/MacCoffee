.class Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;
.super Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WidgetViewHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 0
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 3806
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 3807
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 3808
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .prologue
    .line 3812
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasWidget()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;->itemView:Landroid/view/View;

    instance-of v0, v0, Lcom/vkontakte/android/ui/widget/WidgetBinder;

    if-eqz v0, :cond_0

    .line 3813
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vkontakte/android/ui/widget/WidgetBinder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->widget:Lcom/vkontakte/android/api/widget/Widget;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/widget/WidgetBinder;->bind(Lcom/vkontakte/android/api/widget/Widget;)V

    .line 3815
    :cond_0
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3804
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    return-void
.end method
